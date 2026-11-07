# 面向对象编程

面向对象设计将状态与负责该状态的操作组织在一起。对象可以表达身份、受控值、资源生命周期或可替换行为。价值来自完整契约和归属。类或继承的存在本身不能决定价值。

## 定义不变量所有者

明确合法状态、构造路径及允许的修改，将规则放在能够实施它的权威所有者处。值对象可能只需检查构造。可变实体可能需要在每次调用后维护状态的操作。

函数和透明记录仍适合转换及数据交换。纯数据记录加独立策略函数，可以是有意采用的设计。需要统一归属的规则出现分散约束或可绕过路径时，才构成问题。

## 控制预留

下面的 Rust 2021 示例拥有本地库存数量。所有 `u32` 初始数量均合法。预留要求非零数量，拒绝库存不足，并在拒绝时保持数量原样。

```rust
mod inventory {
    use std::num::NonZeroU32;

    pub struct Stock {
        available: u32,
    }

    #[derive(Debug, PartialEq)]
    pub struct InsufficientStock;

    impl Stock {
        pub fn new(available: u32) -> Self {
            Self { available }
        }

        pub fn available(&self) -> u32 {
            self.available
        }

        pub fn reserve(&mut self, units: NonZeroU32) -> Result<(), InsufficientStock> {
            let remaining = self.available.checked_sub(units.get()).ok_or(InsufficientStock)?;
            self.available = remaining;
            Ok(())
        }
    }
}

fn main() {
    use std::num::NonZeroU32;
    let mut stock = inventory::Stock::new(5);
    stock.reserve(NonZeroU32::new(2).unwrap()).unwrap();
    assert_eq!(stock.available(), 3);
    assert_eq!(stock.reserve(NonZeroU32::new(4).unwrap()), Err(inventory::InsufficientStock));
    assert_eq!(stock.available(), 3);
}
```

在安全 Rust 中，私有字段约束模块边界，`&mut self` 要求调用期间独占访问该值。独立库存快照或存储写入者仍需要权威归属及并发契约。该对象表示的是本地状态。

## 按语言判断封装

Rust 模块私有性及所有权提供编译器约束，内部可变性类型引入各自的访问规则。Python 下划线约定表达内部意图。普通属性访问仍可以绕过约定。冻结 dataclass 限制普通字段赋值，也可能包含可变子对象。

说明实际约束机制。私有名称、类型注解、不可变绑定及检查过的构造器，提供不同保证。

## 有意组合行为

根据[组合优于继承](../design-principles/composition-over-inheritance.md)区分实现复用及行为替换。相关的状态专属操作可以使用[状态机](./state-machine.md)。分离副作用有价值时，方法内部决策也可以保持为[函数式核心](./functional-core.md)。
