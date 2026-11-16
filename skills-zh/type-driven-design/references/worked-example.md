# 批量导入案例

本构造案例从操作推导模型，再用该目标修复已有实现。按顺序拼接本页全部 Python 代码块，可组成一个使用 Python 3.12 或以上版本的程序。标明旧代码的部分是可执行的诊断示例。

## 合同

一个批次按顺序请求来源标识。所请求标识全部存在于提供的目录中。来源包含文本和动态标签。每行文本产生一条行记录；以 `!` 开头的行使该来源失败，原因包含出错行。空文本以零行成功。

批次标识与来源标识指代不同概念。结果保留请求顺序。每份来源产生行数据或非空失败原因。汇总按成功来源数和失败来源数计数。零行成功来源计为一次成功。

已有外部格式恰好包含 `source`、`status`、`rows` 和 `error` 四个字段。状态为 `ok` 或 `error`。成功使用行字符串列表，`error` 为 null。失败的 `rows` 为 null，`error` 为非空字符串。已有历史可能包含原因字段为 null 的不完整失败。这些记录需要权威原因或显式信息缺口错误。

## 推导目标

目录是真实映射，标签也是真实映射。行和结果是同类型元素的有序序列。成功和失败需要不同载荷，各自使用记录。汇总为两个计数命名。

```python
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from typing import Literal, NewType, TypedDict, assert_never

BatchId = NewType("BatchId", str)
SourceId = NewType("SourceId", str)


@dataclass(frozen=True, kw_only=True)
class Row:
    text: str


@dataclass(frozen=True, kw_only=True)
class Source:
    text: str
    labels: Mapping[str, str]


@dataclass(frozen=True, kw_only=True)
class Imported:
    source_id: SourceId
    rows: tuple[Row, ...]


@dataclass(frozen=True, kw_only=True)
class Rejected:
    source_id: SourceId
    reason: str

    def __post_init__(self) -> None:
        if not self.reason:
            raise ValueError("a rejection requires a reason")


type ImportResult = Imported | Rejected


@dataclass(frozen=True, kw_only=True)
class ImportSummary:
    succeeded: int
    failed: int


@dataclass(frozen=True, kw_only=True)
class BatchReport:
    batch_id: BatchId
    results: tuple[ImportResult, ...]
```

`NewType` 为检查器提供不同标识角色，运行时保留字符串。关键字参数解释同类型字段的角色。`Rejected.__post_init__` 在生成构造器调用中检查原因。字段注解依赖经过检查的带类型调用者。冻结记录限制普通字段重新绑定。`Source.labels` 提供借用读取；字典的其他持有者仍能修改它。下列操作读取文本，保留标签原值。

此处再为目录或每个标签增加类，会增加构造工作。它们没有新增职责。联合别名命名已有表达。计数仍为整数，含义来自字段名及生产者。机制选择和保证边界见 [Python](./python.md)。

## 产生结果

```python
def import_source(*, source_id: SourceId, source: Source) -> ImportResult:
    rows: list[Row] = []
    for line in source.text.splitlines():
        if line.startswith("!"):
            return Rejected(source_id=source_id, reason=f"invalid row: {line}")
        rows.append(Row(text=line))
    return Imported(source_id=source_id, rows=tuple(rows))


def run_batch(
    *,
    batch_id: BatchId,
    requested: Sequence[SourceId],
    catalog: Mapping[SourceId, Source],
) -> BatchReport:
    return BatchReport(
        batch_id=batch_id,
        results=tuple(
            import_source(source_id=source_id, source=catalog[source_id])
            for source_id in requested
        ),
    )
```

目录查找依赖已经说明的存在性前提。调用者违反前提时会暴露 `KeyError`。`SourceId` 值自身携带静态角色区别。目录在本次操作中确定存在性。

## 消费结果

```python
def display(result: ImportResult) -> str:
    if isinstance(result, Imported):
        return f"{result.source_id}: imported {len(result.rows)} rows"
    if isinstance(result, Rejected):
        return f"{result.source_id}: rejected: {result.reason}"
    assert_never(result)


def summarize(results: Sequence[ImportResult]) -> ImportSummary:
    succeeded = 0
    failed = 0
    for result in results:
        if isinstance(result, Imported):
            succeeded += 1
        elif isinstance(result, Rejected):
            failed += 1
        else:
            assert_never(result)
    return ImportSummary(succeeded=succeeded, failed=failed)
```

分支选择结果情形，行数是另一项事实。严格检查器覆盖这些函数时，联合扩展会使 `assert_never` 暴露遗漏情形。运行时到达此处会抛出异常。

## 保持边界

传输形状保留已有字典接口。这里的 `TypedDict` 描述已经完成形状检查的数据。真实 JSON 或数据库适配器必须先确定字段存在性及字段类型，再将数据传给 `from_wire`。`from_wire` 检查字段关系并识别不完整历史。

```python
class WireResult(TypedDict):
    source: str
    status: Literal["ok", "error"]
    rows: list[str] | None
    error: str | None


class HistoryGap(ValueError):
    pass


def to_wire(result: ImportResult) -> WireResult:
    if isinstance(result, Imported):
        return {
            "source": result.source_id,
            "status": "ok",
            "rows": [row.text for row in result.rows],
            "error": None,
        }
    if isinstance(result, Rejected):
        return {
            "source": result.source_id,
            "status": "error",
            "rows": None,
            "error": result.reason,
        }
    assert_never(result)


def from_wire(record: WireResult) -> ImportResult:
    source_id = SourceId(record["source"])
    if record["status"] == "ok":
        rows = record["rows"]
        if rows is None or record["error"] is not None:
            raise ValueError("invalid success payload")
        return Imported(source_id=source_id, rows=tuple(Row(text=x) for x in rows))
    if record["rows"] is not None:
        raise ValueError("invalid failure payload")
    reason = record["error"]
    if not reason:
        raise HistoryGap(f"missing failure reason for {source_id}")
    return Rejected(source_id=source_id, reason=reason)


def read_history(records: Sequence[WireResult]) -> tuple[ImportResult, ...]:
    return tuple(from_wire(record) for record in records)
```

外部 schema 持有字段名及 null 约定，适配器持有对应关系。行列表分配服务于该外部合同。内部 tuple 保存操作的有序结果。此案例使用标准库完成边界转换。

## 使用模型

```python
catalog = {
    SourceId("full"): Source(text="alpha\nbeta", labels={"team": "stock"}),
    SourceId("empty"): Source(text="", labels={}),
    SourceId("bad"): Source(text="!broken", labels={"team": "stock"}),
}
report = run_batch(
    batch_id=BatchId("batch-7"),
    requested=(SourceId("full"), SourceId("empty"), SourceId("bad")),
    catalog=catalog,
)
for result in report.results:
    print(display(result))
print(summarize(report.results))
wire = [to_wire(result) for result in report.results]
restored = read_history(wire)
print(summarize(restored))
print(wire[1])
```

合同给出以下预期结果：

```text
full: imported 2 rows
empty: imported 0 rows
bad: rejected: invalid row: !broken
ImportSummary(succeeded=2, failed=1)
ImportSummary(succeeded=2, failed=1)
{'source': 'empty', 'status': 'ok', 'rows': [], 'error': None}
```

检查器应拒绝将 `BatchId` 传给 `source_id`，以及读取尚未收窄的 `ImportResult` 的 `.reason`。将这些错误调用与可运行程序分开。它们检查静态区别。零行成功、恢复及原因保留还需要运行时观察。

## 诊断旧模型

假设旧内部模型复制了外部字段。以下声明和消费者展示缺陷：

```python
@dataclass(kw_only=True)
class OldResult:
    source_id: SourceId
    status: Literal["ok", "error"]
    rows: tuple[Row, ...] | None
    error: str | None


def old_display(result: OldResult) -> str:
    if result.rows:
        return "success"
    return "failure"


def old_success_count(results: Sequence[OldResult]) -> int:
    return sum(result.status == "ok" for result in results)


old_empty = OldResult(source_id=SourceId("empty"), status="ok", rows=(), error=None)
print(old_display(old_empty))
print(old_success_count((old_empty,)))
```

第一行输出 `failure`，第二行输出 `1`。两个消费者使用同一记录。一个将行数据视为成功证据，另一个使用状态。已确认合同说明第一种解释有误。有行数据的成功在两条路径都正常，可以用作对照。

该表示允许状态和可选载荷独立变化。消费者反复解释维持了分歧。修复真值判断可以修好当前调用者。目标联合还为全部受影响内部用法将已确认情形与载荷放在一起。追踪到的消费者支持这一范围时，再作更广改造。真实缺陷仅限于适配器丢失原因时，修复适配器并重新判断替换模型的必要性。

字段相似性支持对当前机制的观察。历史意图需要决策记录或其他证据。外部合同解释了传输形状今天仍有用途的原因。

## 完成迁移设计

改变任一路径之前，覆盖完整范围：

- `OldResult.status == "ok"`、行数据存在且错误为 null，映射为 `Imported`，包括空行数据。
- `OldResult.status == "error"`、行字段为 null 且错误非空，映射为 `Rejected`。
- 冲突组合是转换错误。缺少失败原因是信息缺口。
- 即时导入和展示使用 `import_source` 与 `display`。历史读取和汇总使用 `read_history` 与 `summarize`。
- 两条路径都通过 `to_wire` 产生固定外部格式。持久化记录保留该格式。内部结果归联合类型，外部 schema 继续持有存储字段名。
- 非空原因是已有失败合同。改变来源成功条件属于单独的政策变化。

历史存在缺口时，只从与同一来源及同一次导入对应的权威记录取得原因。否则返回显式转换错误，交由负责人员处理。这里的程序暴露缺口：

```python
incomplete: WireResult = {
    "source": "old-bad",
    "status": "error",
    "rows": None,
    "error": None,
}
try:
    from_wire(incomplete)
except HistoryGap as exc:
    print(exc)
```

预期输出为 `missing failure reason for old-bad`。`unknown` 这样的默认值会编造原因，抹去尚未解决的事实缺口。

## 连贯分批迁移

### 即时处理

起点为旧即时处理和旧历史读取。将即时生产者、展示消费者和外部写入方共同迁至上述目标定义。在操作写出已有输出的位置使用 `to_wire`。历史读取继续通过旧路径消费格式未变的存储记录。

在此中间状态，通过新即时路径检查有行成功、空成功和失败。检查准确的传输字段，确认旧历史路径仍能读取新写记录。即时调用者使用联合，对应旧内部生产和展示代码可以移除时，本批结束。

### 历史读取

起点为新即时路径和旧历史解释。将历史生产者及汇总消费者共同迁至 `read_history` 和 `summarize`。存储格式和外部消费者保持合同。对不完整记录应用上述缺口处理规则。

在此中间状态，比较即时结果及其传输记录恢复后的汇总。检查空成功、失败原因保留、冲突字段及显式历史缺口。历史消费者使用目标，对应旧路径可以移除时，本批结束。

### 完成切换

范围内调用者全部迁移后，移除 `OldResult`、`old_display`、`old_success_count` 及失效内部转换。外部适配器继续服务于有效协议，因此保留。同步受影响文档和检查，沿真实生产与消费路径重新检查原分歧。

代码回退、存量数据恢复及外部效果各有责任。本例存储保持已有格式，各代码批次可以沿用该边界。真实操作重写数据或造成外部效果时，需要根据实际变化安排恢复。同次发版且可以共同切换的调用者无需兼容层。小项目可以在一次交付中完成两个依赖完整的批次。
