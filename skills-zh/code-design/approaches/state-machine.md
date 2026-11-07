# 状态机

状态机定义状态及响应输入的规则。转移可以依赖守卫并产生副作用。允许的历史、状态专属行为或操作拒绝重要时，可以采用该模型。

## 定义模型

明确初始状态、接受的输入、守卫、结果状态及效果。每个相关的状态输入组合都应有预期结果，包括拒绝或明确接受的空操作。说明守卫或效果失败后保留什么。

有限控制状态可以携带凭据、重试次数等数据。独立维度可以保持分离，也可以构成积状态。层次状态模型及并发状态模型可以表达更大工作流。单个扁平枚举是其中一种表示。

各组合确实合法时，独立布尔值适合表达状态。只有特定组合及载荷应当共同存在时，使用变体。状态标签描述当前条件，输入描述命令或观察到的事实。

## 约束转移

下面的 Rust 2021 示例从待处理状态开始，接受一次结算或失败观察，两种结果均为终态。在这个本地模型中，所有 `u64` 凭据值及字符串均为合法载荷。每次调用消费输入，非法转移保持存储状态原样。

```rust
mod payment {
    #[derive(Debug, PartialEq)]
    pub enum State {
        Pending,
        Settled { receipt: u64 },
        Failed { reason: String },
    }

    pub enum Event {
        Settle { receipt: u64 },
        Fail { reason: String },
    }

    #[derive(Debug, PartialEq)]
    pub struct InvalidTransition;

    pub struct Payment {
        state: State,
    }

    impl Payment {
        pub fn new() -> Self {
            Self { state: State::Pending }
        }

        pub fn state(&self) -> &State {
            &self.state
        }

        pub fn apply(&mut self, event: Event) -> Result<(), InvalidTransition> {
            if !matches!(self.state, State::Pending) {
                return Err(InvalidTransition);
            }
            self.state = match event {
                Event::Settle { receipt } => State::Settled { receipt },
                Event::Fail { reason } => State::Failed { reason },
            };
            Ok(())
        }
    }
}

fn main() {
    use payment::{Event, InvalidTransition, Payment, State};
    let mut paid = Payment::new();
    paid.apply(Event::Settle { receipt: 42 }).unwrap();
    assert_eq!(paid.apply(Event::Settle { receipt: 42 }), Err(InvalidTransition));
    assert_eq!(paid.state(), &State::Settled { receipt: 42 });

    let mut failed = Payment::new();
    failed.apply(Event::Fail { reason: "declined".into() }).unwrap();
    assert!(matches!(failed.state(), State::Failed { reason } if reason == "declined"));
}
```

枚举定义合法形状，私有字段及转移操作控制该对象的历史。调用方可以构造独立的 `State` 值。它不能通过此 API 替换私有字段。传入 `apply` 的观察是否具有权威性，仍由调用方负责。

## 在一致性边界执行效果

示例修改本地内存。支付提供方调用具有自己的结果，超时后该结果可能未知。未知属于领域状态时，应明确表达。将这种超时转换为已知失败，会允许错误的后续转移。

读写持久状态的转移，需要采用所需事务、条件更新或独占所有者。两个读取相同旧状态的操作可能同时通过守卫。执行外部效果及存储新状态，也需要明确部分失败策略。

根据契约，重复输入可以被拒绝、返回已有结果，或触发幂等操作。单独的本地终态不能建立外部效果精确一次保证。参见[事件驱动设计](./event-driven.md)。

## 选择表示

小型封闭模型可以使用直接分支或穷尽匹配。统一规则适合转换表。纯归约器可以返回新状态及预期动作，形成[函数式核心](./functional-core.md)。GoF [状态模式](../design-patterns/state.md)将较多的状态专属行为分配给不同对象。

Typestate 可以让部分转移消费一种 Rust 类型并返回另一种类型，将合法调用顺序交给编译器检查。运行时选择的状态仍可能需要枚举或动态检查。根据调用方、载荷及所需保证选择表示。

检查初始状态、终态、守卫、非法转移、重复输入及失败时的状态保持。在统一负责的位置展示完整转移策略。需要持久化及运行管理能力时，再承担工作流引擎增加的成本。
