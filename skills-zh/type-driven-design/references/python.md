# Python 类型模型

选择 Python 表示及保证机制时使用本参考。除另有说明，示例使用 Python 3.11 或以上版本。遵循项目实际的 Python 最低版本、依赖及检查器配置。

## 按含义选择

内部固定结构数据优先具名记录。多字段结果优先具名记录，让属性说明角色。`dict` 主要用于真实键值查找和动态集合。`tuple[T, ...]` 优先用于同类型元素的不可变序列。这些是本 Skill 的设计默认。

Python 也支持 `tuple[str, int]` 这样的定长异构 tuple。保留真实位置协议。字典互操作、schema 持有的形状及 tuple 兼容 API 各有需求。

### 具名记录

使用 `dataclass` 表达具有具名字段、方法及普通类行为的记录。仅关键字字段让构造角色可见。生成的相等性通常在完全相同类的实例之间比较字段。注解向工具描述字段。生成的构造器直接赋值。它不检查注解类型。见 [dataclasses 文档](https://docs.python.org/3.11/library/dataclasses.html)。

具名访问需要与 tuple 操作共存时使用 `NamedTuple`。它保留迭代、位置解包以及与普通 tuple 按元素比较的相等性。增加字段会影响位置消费者。见 [NamedTuple](https://docs.python.org/3.11/library/typing.html#typing.NamedTuple) 及 [PEP 557](https://peps.python.org/pep-0557/#why-not-just-use-namedtuple) 中的演进取舍。

调用者确实需要指定字符串键及对应值类型的字典接口时，使用 `TypedDict`。`dict[str, str | int]` 允许每个键的值取任一类型；`TypedDict` 可以为各字段关联独立类型。必需键和可空值表达不同事实。`NotRequired` 表达可以缺少的键。运行时值是普通字典。运行时键值校验由解析器或适配器负责。见 [TypedDict 规范](https://typing.python.org/en/latest/spec/typeddict.html) 及 [PEP 589](https://peps.python.org/pep-0589/#motivation) 的动机。

### 身份

类型别名命名已有表达，与该表达保持等价。Python 3.11 使用赋值，可以加上 `TypeAlias` 注解。`type Name = ...` 语法需要 Python 3.12 或以上版本。

`NewType` 为受检查的调用者提供独立静态子类型。运行时调用返回传入对象。它不建立值范围或被引用实体的存在性。两个同类型参数仍需用名称说明角色。见 [NewType](https://docs.python.org/3.11/library/typing.html#newtype)。

```python
from typing import NewType

WarehouseId = NewType("WarehouseId", str)
ProductId = NewType("ProductId", str)


def stock_key(*, warehouse: WarehouseId, product: ProductId) -> str:
    return f"{warehouse}/{product}"


print(stock_key(warehouse=WarehouseId("north"), product=ProductId("bolt")))
```

输出为 `north/bolt`。检查器应拒绝将 `ProductId` 传给 `warehouse`。单次运行检查的是字符串格式化，因此角色区分需要检查器证据。

### 互斥情形

载荷属于不同结果时，使用记录的联合类型。通过 `isinstance` 等受支持分支收窄后访问特定字段。`assert_never` 为检查器提供报告遗漏情形的位置。实际检查器及检查范围决定覆盖能力。[贯穿案例](./worked-example.md) 区分空成功与失败。

按操作选择缺失值表示。字段更新可能需要区分未提供和明确置空。查找可能需要区分未找到和零值。消费者需要这些区别时，采用独立情形或显式哨兵。

### 类型关系

输出必须保留输入类型时使用类型参数。以下完整 Python 3.11 示例保留元素类型：

```python
from collections.abc import Sequence
from typing import TypeVar

T = TypeVar("T")


def last_or_none(values: Sequence[T]) -> T | None:
    if not values:
        return None
    return values[-1]


print(last_or_none((2, 5)))
```

输出为 `5`。检查器可以为此调用推断出 `int | None`。Python 3.12 或以上版本可以用内联类型参数表达同一关系。操作没有有效类型关系时，保留具体签名。

使用 `Protocol` 表达消费者所需的结构能力。实现可以在没有继承关系时满足协议。顺序、错误和资源所有权等语义义务放在操作旁。只读 property 可以表达协议成员的读取能力。`@runtime_checkable` 通过有限的运行时语义检查属性存在性。它不检查成员签名。见 [Protocol 规范](https://typing.python.org/en/latest/spec/protocol.html) 及[运行时检查](https://docs.python.org/3.11/library/typing.html#typing.runtime_checkable)。

## 建立性质

### 构造

值约束需要覆盖每条受支持构造路径的机制。以下区间对带类型的整数输入表达 `start <= stop`。直接调用、便捷工厂及 `dataclasses.replace` 都进入 `__post_init__`：

```python
from dataclasses import dataclass, replace


@dataclass(frozen=True, kw_only=True)
class Interval:
    start: int
    stop: int

    def __post_init__(self) -> None:
        if self.stop < self.start:
            raise ValueError("stop precedes start")

    @classmethod
    def from_size(cls, *, start: int, size: int) -> "Interval":
        return cls(start=start, stop=start + size)


interval = Interval.from_size(start=3, size=2)
print(interval)
print(replace(interval, stop=6))
try:
    Interval(start=3, stop=2)
except ValueError as exc:
    print(exc)
```

预期输出：

```text
Interval(start=3, stop=5)
Interval(start=3, stop=6)
stop precedes start
```

工厂同样通过生成的构造器拒绝负数 size。将 `stop` 替换为小于 `start` 的值也会经过同一钩子并失败。检查为带类型的整数输入建立顺序约束。它不校验任意输入类型。调用此构造器之前，按真实合同解析外部数据。

单独检查恢复路径。自定义 ORM 加载或 pickle 恢复可能绕过普通初始化。支持这些路径时，安排它们在交出值之前建立不变量。`object.__setattr__` 这样的显式底层修改超出普通冻结 API 的范围。保证需要说明受支持路径。

### 修改

`frozen=True` 阻止普通字段重新赋值。冻结记录引用的 list 或 dict 仍可以修改。tuple 阻止元素引用变化，可变元素仍保留自身行为。`Mapping[K, V]` 通过该接口提供读取操作；其他别名仍可能更新底层字典。见[冻结 dataclass](https://docs.python.org/3.11/library/dataclasses.html#frozen-instances) 及[集合接口](https://docs.python.org/3.11/library/collections.abc.html)。

按操作需要选择借用读取、不可变值或复制快照。说明谁能修改共享值。需要快照隔离时再增加复制。存在性检查或并发敏感规则由控制这些事实的操作负责。

### 结构化解析

项目需要解析或序列化时复用已有库。可信内部值可以继续使用标准库记录。项目使用结构化序列化时，`msgspec.Struct` 是一种选择。[Struct 文档](https://msgspec.dev/structs#post-init-processing) 和[使用指南](https://msgspec.dev/usage#typed-decoding) 区分以下路径：

- 直接构造赋值并执行 `__post_init__`。
- 带类型解码按注解及 `Meta` 约束校验序列化输入，再执行 `__post_init__`。
- `msgspec.convert` 按请求类型校验已解析的内置对象，构造 Struct 时执行 `__post_init__`。
- 严格解码和转换限制不安全的隐式转换，默认启用。允许哪些转换取决于目标类型。

以下独立示例需要支持 `Struct`、`Meta` 及带类型转换的 `msgspec`。运行时记录实际安装版本。在线官方文档没有标明版本。

```python
from typing import Annotated

import msgspec


class PageSize(msgspec.Struct, frozen=True):
    value: Annotated[int, msgspec.Meta(ge=0)]


print(PageSize(-1).value)
print(msgspec.json.decode(b'{"value":0}', type=PageSize).value)
print(msgspec.convert({"value": 4}, type=PageSize).value)
try:
    msgspec.json.decode(b'{"value":-1}', type=PageSize)
except msgspec.ValidationError as exc:
    print(type(exc).__name__)
```

预期逐行输出 `-1`、`0`、`4` 和 `ValidationError`。直接构造绕过 `Meta` 校验。如果每次普通构造都必须建立非负约束，在 `__post_init__` 中添加实际检查，或限制受支持的构造 API。`frozen=True` 控制后续赋值。可变 Struct 的字段赋值同样绕过注解及 `Meta` 校验。

用 `__post_init__` 建立实际的自定义不变量。带类型解码和转换时，msgspec 将该钩子中的 `ValueError` 和 `TypeError` 包装为 `ValidationError`。普通构造抛出原异常。按所声称的保证检查解码、转换、直接构造、恢复和更新路径。库专属选项使用 `msgspec` 指导。预期行为来自模型合同。
