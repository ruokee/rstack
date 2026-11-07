# 适配器

适配器将既有接口转换为调用方需要的契约。转换可以涉及值、单位、操作、错误及资源归属。单个外部依赖也足以产生真实转换需要。

## 定义两侧契约

明确目标操作和外部操作，分别检查输入域、输出含义、失败分类、部分效果、生命周期及成本。外部操作缺少所需保证时，适配器必须用实际机制提供保证，或公开不同契约。

例如，支付提供方超时属于基础设施故障，支付结果可能未知。业务拒绝属于已知决定。把两者都映射为拒绝，会丢失调用方所需信息。

## 保留错误含义

下面的 Rust 2021 示例适配一个传入的提供方操作。金额为约定币种的正整数分。提供方返回批准标识、明确拒绝或传输错误。目标接口把拒绝表示为正常决定，保留传输错误。

```rust
use std::io;
use std::num::NonZeroU64;

#[derive(Debug)]
enum ProviderError {
    Declined,
    Transport(io::Error),
}

#[derive(Debug, PartialEq)]
enum Decision {
    Approved { receipt: u64 },
    Declined,
}

fn authorize<F>(cents: NonZeroU64, send: F) -> io::Result<Decision>
where
    F: FnOnce(u64) -> Result<u64, ProviderError>,
{
    match send(cents.get()) {
        Ok(receipt) => Ok(Decision::Approved { receipt }),
        Err(ProviderError::Declined) => Ok(Decision::Declined),
        Err(ProviderError::Transport(error)) => Err(error),
    }
}

fn main() {
    let amount = NonZeroU64::new(250).unwrap();
    assert_eq!(authorize(amount, |_| Ok(7)).unwrap(), Decision::Approved { receipt: 7 });
    assert_eq!(authorize(amount, |_| Err(ProviderError::Declined)).unwrap(), Decision::Declined);
    let result = authorize(amount, |_| {
        Err(ProviderError::Transport(io::Error::new(io::ErrorKind::TimedOut, "confirmation lost")))
    });
    assert_eq!(result.unwrap_err().kind(), io::ErrorKind::TimedOut);
}
```

提供方操作调用一次。传输错误后的支付完成状态由提供方契约决定。它不表示业务拒绝。重复请求需要另外判断重复效果及结果核对方式。

## 选择形式

值转换函数可以是适配器。对象适配器持有或借用外部组件，再委托调用。类适配器在语言支持时使用继承，将适配绑定到所继承类型。按真实归属及兼容约束选择形式。

两侧都受控且能共同迁移时，修改原接口可能直接消除转换。独立版本、不同模型或明确兼容边界仍可以使适配器有价值。

## 区分相关概念

适配关注转换，[依赖倒置](../design-principles/dependency-inversion.md)关注所需抽象归属，注入关注依赖提供方式。实现已经匹配的接口可以无需适配器。

[装饰器](./decorator.md)围绕共享接口组合行为，[外观](./facade.md)提供子系统的完整操作。职责由契约决定。被包装对象的数量不能决定模式角色。
