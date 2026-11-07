# 工厂

工厂负责构造决定，例如选择产品、应用构造策略或组装依赖。调用方使用最终契约，避免分别重复这些决定。

GoF 工厂方法特指通过创建者的子类覆盖产品创建。独立工厂函数、具名构造器及按注册表构造，属于其他创建机制。按实际扩展契约选择形式。

## 定义构造行为

说明接受的选择值、产品能力、资源归属及构造失败。区分未知选择值和创建已知产品时发生的错误。资源获取可以合理地属于构造，需要明确清理及部分失败契约。

直接构造器已清楚表达所需操作时，就直接使用。只有一个产品的工厂仍可以拥有复杂组装或转换边界。可配置注册表需要实际注册要求，并定义重名处理策略。

## 选择构造器

下面的 Python 3.11 示例为 `zlib` 或 `bzip2` 创建新的流式压缩器。调用方提供字节，通过一次 `flush` 完成各压缩器。protocol 描述调用方使用的能力。

```python
import bz2
import zlib
from collections.abc import Callable
from typing import Protocol


class Compressor(Protocol):
    def compress(self, data: bytes, /) -> bytes: ...
    def flush(self) -> bytes: ...


_CONSTRUCTORS: dict[str, Callable[[], Compressor]] = {
    "zlib": zlib.compressobj,
    "bzip2": bz2.BZ2Compressor,
}


def make_compressor(kind: str) -> Compressor:
    try:
        constructor = _CONSTRUCTORS[kind]
    except KeyError as exc:
        raise ValueError(f"unknown compression format: {kind}") from exc
    return constructor()


compressor = make_compressor("zlib")
encoded = compressor.compress(b"report data") + compressor.flush()
assert zlib.decompress(encoded) == b"report data"
```

异常转换仅包围查表。构造器失败保留原有含义，包括其内部抛出的 `KeyError`。固定表表达受支持产品，无需维护注册生命周期。

## 检查边界

验证选择、产品状态独立性及构造失败。避免为未知选择值静默提供默认产品。返回共享缓存产品会改变状态和归属义务，应与创建新产品明确区分。

配套产品参见[抽象工厂](./abstract-factory.md)，分阶段构造参见[构建器](./builder.md)，所选产品提供的行为参见[策略](./strategy.md)。
