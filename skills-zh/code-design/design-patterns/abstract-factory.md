# 抽象工厂

抽象工厂以相关产品族作为选择单位。在 GoF 结构中，工厂契约创建各类产品，每个具体工厂提供一套相容产品。真正有价值的约束是这些产品必须协同工作。

## 明确产品族不变量

说明哪些内容必须匹配，例如编解码器的编码规则、数据库连接的方言，或共享同一事务的会话对象。外观相似或同属一个应用并不足够。

说明产品是否共享可变状态、配置或资源生命周期。工厂应按契约处理部分创建资源的获取及释放。产品转而使用无关全局配置，可能破坏预期的产品族关系。

## 组装配套能力

下面的 Python 3.11 示例返回配套文本操作。输入是所选编码器可编码的 Unicode 字符串，以及对应解码器接受的字节序列。编码错误原样传播。两个工厂分别选择 UTF-8 及不含字节顺序标记的 UTF-16 小端编码。

```python
from collections.abc import Callable
from dataclasses import dataclass


@dataclass(frozen=True)
class TextCodec:
    encode: Callable[[str], bytes]
    decode: Callable[[bytes], str]


def utf8_codec() -> TextCodec:
    return TextCodec(
        encode=lambda text: text.encode("utf-8"),
        decode=lambda data: data.decode("utf-8"),
    )


def utf16_codec() -> TextCodec:
    return TextCodec(
        encode=lambda text: text.encode("utf-16-le"),
        decode=lambda data: data.decode("utf-16-le"),
    )


for factory in (utf8_codec, utf16_codec):
    codec = factory()
    assert codec.decode(codec.encode("hello 世界")) == "hello 世界"
```

工厂组装匹配操作。`TextCodec` 的公开构造仍允许不匹配组合，callable 类型也无法区分编码。冻结记录限制普通字段赋值。更强的产品族保证需要受控构造，或携带产品族关系的类型。

Rust 可以通过关联类型或产品族参数表达产品关系。使用方需要保留这些关系。将两个产品分别擦除为无关 trait object，可能丢失该关系。

## 限定产品族

一组函数或值就可能足够。需要反复创建产品或拥有共享构造状态时，再采用可复用工厂对象。单个产品族可以需要协调组装。它无需因此建立抽象层次。无关依赖应留在产品族契约之外。

单项创建参见[工厂](./factory.md)，组装步骤参见[构建器](./builder.md)，产品组合操作参见[外观](./facade.md)。
