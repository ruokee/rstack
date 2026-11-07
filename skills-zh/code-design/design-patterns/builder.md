# 构建器

构建器拥有中间构造状态，在要求满足后产生值。GoF 形式将构造顺序和具体构建器产生的表示分离。链式选项构建器是一种常见的较小形式。

## 决定何时建立合法性

将必需信息放入初始构造器，通过带类型的阶段要求它，或在 `build` 时拒绝缺失。用一条权威构造路径检查跨字段规则。将部分配置的构建器与可用产品区分开。

输入分阶段到达，或可选组合使直接构造困难时，可以使用构建器。小规模独立字段通常适合具名记录或普通构造器。所有权及复制成本可接受时，克隆已有值可以处理小幅变化。

## 消费中间状态

下面的完整 Rust 2021 示例展示消费式选项和跨字段检查。它构造步长非零的半开整数区间，允许空区间，拒绝反向边界。对于这个小型值，带检查的普通构造器也是合理 API。

```rust
mod ranges {
    use std::num::NonZeroUsize;

    pub struct RangePlan {
        start: usize,
        end: usize,
        step: NonZeroUsize,
    }

    impl RangePlan {
        pub fn values(&self) -> impl Iterator<Item = usize> {
            (self.start..self.end).step_by(self.step.get())
        }
    }

    pub struct Builder {
        start: usize,
        end: usize,
        step: NonZeroUsize,
    }

    impl Builder {
        pub fn new(start: usize, end: usize) -> Self {
            Self { start, end, step: NonZeroUsize::new(1).unwrap() }
        }

        pub fn step(mut self, step: NonZeroUsize) -> Self {
            self.step = step;
            self
        }

        pub fn build(self) -> Result<RangePlan, &'static str> {
            if self.start > self.end {
                return Err("start exceeds end");
            }
            Ok(RangePlan { start: self.start, end: self.end, step: self.step })
        }
    }
}

fn main() {
    use std::num::NonZeroUsize;
    let plan = ranges::Builder::new(1, 7)
        .step(NonZeroUsize::new(2).unwrap())
        .build()
        .unwrap();
    assert!(plan.values().eq([1, 3, 5]));
    assert!(ranges::Builder::new(4, 2).build().is_err());
}
```

私有字段阻止模块外调用方绕过构造。消费 `self` 让该构建器值在 `build` 后无法复用，失败也一样。该 API 有意丢弃失败构造状态。需要支持修正的构建器，应采用不同的错误或借用契约。

## 区分保证

类型状态可以让必需阶段在编译时可见，同时增加类型，并可能使条件式组装更复杂。运行时构造可以用检查结果表达同一领域规则。消费式构造控制值的复用。它不建立线程安全，也不验证无关输入性质。

产品选择参见[工厂](./factory.md)，表示不变量参见[数据建模](../approaches/data-modeling.md)。
