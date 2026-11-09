# Python 类型检查

Python 项目的静态类型保证、表示不变量及类型检查设置。

## 静态保证

`NewType` 为检查器提供静态用途区分，`TypedDict` 描述静态映射形状。二者均不校验任意运行时输入。冻结的 dataclass 限制正常字段赋值。检查构造过程及嵌套对象的修改是否保持值约束。运行时校验由项目输入契约决定。

`typing.cast` 告诉检查器采用什么假设，运行时返回原对象。它不会校验外部值。核对 `Any`、动态属性及忽略注释如何进入消费者，区分检查器支持的保证与作者仍需建立的值约束。

## 工具选择

沿用项目已有的 mypy、pyright、basedpyright、ty 等检查器，以及支持版本和配置。初次选型比较所需静态检查、依赖类型覆盖及项目工具链，再确定命令、范围及严格度。

## mypy 示例

以下使用 mypy 检查 Python 3.11+ 的可空值误用。局部契约允许缺失标签时抛出 `ValueError`，存在标签时转为大写。将违规实现保存为可丢弃目录中的 `bad.py`：

```python
def label(value: str | None) -> str:
    return value.upper()
```

合法实现保存为 `good.py`：

```python
def label(value: str | None) -> str:
    if value is None:
        raise ValueError("missing value")
    return value.upper()
```

使用开发环境中的 mypy 执行：

```bash
mypy --strict bad.py
mypy --strict good.py
```

第一条报告对 `None` 变体的不安全访问，退出非零；第二条退出 `0`。`good.py` 的分支承担运行时处理，检查器判断其支持的静态关系。类型检查器不会增加运行时校验。

验证后清理本例的临时目录及工具产物。在应用真实边界核对缺失依赖类型及局部例外，追踪 `Any` 如何进入消费者。说明仍依赖运行时检查或行为验证的属性。
