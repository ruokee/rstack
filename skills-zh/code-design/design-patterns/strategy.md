# 策略

策略向稳定操作提供可变化的决策或算法。操作拥有执行流程，策略拥有所选行为。选择可以发生在编译、配置或每次调用时。

## 定义可互换性

说明输入、输出、错误、状态及允许的副作用。不同方案需要有用的共同契约。需要无关输入数据的算法，可能属于不同操作。小规模封闭选择可以保留为分支或枚举。

单项能力可以使用函数或闭包。相关操作或状态需要共同身份和生命周期时，再使用 trait、protocol 或对象。在选择配置已知的位置确定策略。

## 借用所选条目

下面的 Rust 2021 示例选择得分最高的条目，按输入顺序为每项评分一次，同分时返回最后一项，空切片返回 `None`。结果借用输入。选择过程无需分配，也不复制条目。

```rust
fn highest<T, F>(items: &[T], mut score: F) -> Option<&T>
where
    F: FnMut(&T) -> i64,
{
    items.iter().max_by_key(|item| score(item))
}

struct Item {
    name: &'static str,
    priority: i32,
    size: u32,
}

fn main() {
    let items = [
        Item { name: "a", priority: 2, size: 8 },
        Item { name: "b", priority: 2, size: 3 },
    ];
    assert_eq!(highest(&items, |item| i64::from(item.priority)).map(|x| x.name), Some("b"));
    assert_eq!(highest(&items, |item| -i64::from(item.size)).map(|x| x.name), Some("b"));
    assert!(highest::<Item, _>(&[], |item| i64::from(item.priority)).is_none());
}
```

泛型 `FnMut` 接受带可变捕获状态的闭包。具体实例采用静态分发，可能增加生成代码体积。借用的 `dyn FnMut` 可以动态分发。它不拥有或分配 callable。`Box<dyn FnMut>` 对普通非零大小闭包通过堆分配获得所有权。策略职责和表示方式应分开选择。

## 检查变化成本

比较分发、捕获状态、生命周期及每次求值成本。排序策略中的昂贵 I/O 会明显改变操作成本。操作确需复用且新鲜度契约允许时，再缓存已计算得分。

[工厂](./factory.md)选择或创建行为，[命令](./command.md)表示请求，[状态](./state.md)按对象当前状态及转移规则组织行为。
