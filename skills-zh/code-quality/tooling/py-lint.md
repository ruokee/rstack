# Python lint 设置

Python 项目的格式化、常规 lint 及自定义规则操作。

## 工具选择

先读取项目工具、配置及版本约定。Ruff 可以分别执行格式化和现成 lint 规则。已有 Black 等 formatter 时，先评估配置及迁移成本，同批文件交给一个 formatter。初次采用时，将选定版本加入项目开发依赖或工具锁定文件。

以下 Ruff 示例在可丢弃目录运行。使用开发环境中选定的 Ruff 版本核对选项。保存为 `ruff.toml`：

```toml
line-length = 88

[format]
quote-style = "double"
exclude = ["generated/*.py"]

[lint]
select = ["F401"]

[lint.per-file-ignores]
"generated/*.py" = ["F401"]
```

本例只启用 `F401`。约定由生成器维护生成代码的导入及格式，因此对 `generated/*.py` 忽略该规则，并在格式化发现时排除它。两项例外分别配置。

## 常规 lint

违规案例保存为 `bad.py`：

```python
import math
```

合法案例保存为 `good.py`：

```python
from math import ceil


def page_count(items: int) -> int:
    return ceil(items / 10)
```

执行检查：

```bash
ruff check --config ruff.toml bad.py good.py
ruff check --config ruff.toml good.py
```

第一条只对 `bad.py` 报告 `F401`，退出非零。第二条退出 `0`。在 `generated/api.py` 放入与 `bad.py` 相同的内容，单独检查该文件应按例外通过。

核对规则、例外及目录发现：

```bash
ruff check --config ruff.toml generated/api.py
ruff check --show-settings --config ruff.toml good.py
ruff check --show-files --config ruff.toml .
```

文件发现列出文件，逐文件例外决定其诊断。核对每项结果的实际作用。

## 格式化

保存为 `unformatted.py`：

```python
def message( name ):return {'greeting':name}
```

依次检查、写回及复查：

```bash
ruff check --config ruff.toml unformatted.py
ruff format --check --diff --config ruff.toml unformatted.py
ruff format --config ruff.toml unformatted.py
ruff format --check --config ruff.toml unformatted.py
ruff format --config ruff.toml unformatted.py
```

lint 先通过。首次格式检查显示差异并退出 `1`，写回后检查退出 `0`，再次格式化应保持内容不变。`--check` 的 `2` 表示配置、参数或内部错误。分别记录 formatter 和 lint 的结果。

项目启用 lint 自动修复时，先执行 `ruff check --fix`，再执行 `ruff format`，最后分别复查 lint 和格式。检查与 formatter 冲突的规则，例如 `W191`、`Q000`、`COM812`。formatter 尽力满足行长，`E501` 仍可能报告超长行。编辑器、提交钩子及 CI 复用相同版本、配置和入口，按实际文件发现核对格式排除。

## Flake8 自定义规则

先核对现成规则。Ruff 当前不装载第三方插件；本地自定义检查由 Flake8 执行。将 Flake8 及插件依赖安装在执行它的开发环境，本地及 CI 复用相同版本、配置和命令。需要分发插件时再采用包入口点。

以下独立示例使用 AST 检查项目约定：模块直接声明的同步或异步 `job_` 函数必须显式声明必填的仅关键字参数 `context`。类方法及嵌套函数不在范围内。token 适合标记关系，行级检查适合独立逐行约定；本规则依赖函数语法结构。

在单独的可丢弃目录保存 `checks.py`：

```python
import ast


class JobContextChecker:
    name = "project-job-context"
    version = "1.0.0"

    def __init__(self, tree):
        self.tree = tree

    def run(self):
        for node in self.tree.body:
            if not isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                continue
            if not node.name.startswith("job_"):
                continue
            required_context = any(
                argument.arg == "context" and default is None
                for argument, default in zip(
                    node.args.kwonlyargs, node.args.kw_defaults
                )
            )
            if not required_context:
                yield (
                    node.lineno,
                    node.col_offset,
                    "PRJ001 job_ function must declare required keyword-only context",
                    type(self),
                )
```

`kw_defaults` 中的 `None` 表示参数必填。源码中的默认值 `None` 是 AST 节点，仍属于可选参数。诊断返回函数定义的位置，Flake8 显示的列号从 `1` 开始。

同目录保存 `.flake8`：

```ini
[flake8]
select = PRJ001

[flake8:local-plugins]
extension =
    PRJ = checks:JobContextChecker
paths = .
```

`paths` 相对配置文件解析。Ruff 负责现成规则，这里只选择本地 `PRJ001`，避免重复诊断。

违规案例保存为 `bad.py`：

```python
def job_build(context):
    return context


def job_optional(*, context=None):
    return context
```

合法案例保存为 `good.py`：

```python
def job_build(*, context):
    return context


async def job_async(*, context):
    return context
```

排除范围保存为 `edge.py`：

```python
class Handler:
    def job_local(self):
        return "method"


def helper():
    def job_nested():
        return "nested"

    return job_nested()
```

在该目录执行：

```bash
python -m flake8 --config .flake8 bad.py
python -m flake8 --config .flake8 good.py edge.py
```

第一条在 `bad.py:1:1` 和 `bad.py:5:1` 各报告一项 `PRJ001`，消息为 `job_ function must declare required keyword-only context`，退出非零。第二条退出 `0`，覆盖同步、异步合法声明及类方法、嵌套函数的误报边界。

验证结束后清理本例的临时目录及工具产物，失败时同样清理。项目正式配置及获准维护的永久测试继续保留。
