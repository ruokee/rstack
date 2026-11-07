# 命令

命令将请求表示与执行时刻分离。调用方创建请求，调用器调度或触发，接收者执行操作。GoF 形式通过共同方法封装执行。数据值加独立处理器也可以承担同样的请求角色。

## 选择表示

本地延迟动作可以使用 callable，具有生命周期的行为可以使用对象，可检查的请求数据可以使用记录或枚举。排队、界面动作、历史及调度都可能需要这种分离。简单即时调用可以保留直接形式。

需要序列化或检查内容时，纯数据命令很有用。处理器按实际操作组织。命令值描述意图，构造时应将所请求效果留到执行阶段。

## 表示编辑请求

下面的 Rust 2021 示例使用封闭的文本编辑请求集合。截断采用字节偏移，拒绝超出字符串或位于 UTF-8 字符内部的位置。拒绝时文本保持原样。追加将所提供文本复制到目标拥有的存储中。

```rust
enum Edit {
    Append(String),
    Truncate(usize),
}

fn apply(edit: &Edit, text: &mut String) -> Result<(), &'static str> {
    match edit {
        Edit::Append(suffix) => text.push_str(suffix),
        Edit::Truncate(offset) => {
            if !text.is_char_boundary(*offset) {
                return Err("invalid UTF-8 boundary");
            }
            text.truncate(*offset);
        }
    }
    Ok(())
}

fn main() {
    let mut text = String::from("猫");
    let append = Edit::Append(String::from("!"));
    apply(&append, &mut text).unwrap();
    assert_eq!(text, "猫!");
    assert!(apply(&Edit::Truncate(1), &mut text).is_err());
    assert_eq!(text, "猫!");
    apply(&Edit::Truncate(3), &mut text).unwrap();
    assert_eq!(text, "猫");
}
```

执行时借用请求，因此可以再次调用。重复 `Append` 会重复其效果。消费命令值可以限制该值在本地复用。它不能建立持久化或重复请求的恰好一次处理语义。

## 定义重放义务

持久化命令需要版本化 schema、目标解析方式，以及前提已变化时的处理策略。执行结果与请求意图分别记录。单独保存请求日志不足以说明哪些效果已经完成。

可能重复执行时，在效果边界定义幂等性或去重。捕获活动连接的闭包可以具有有效的进程内生命周期。它不适合作为持久化传输表示。

## 区分撤销

撤销需要足够的先前状态和顺序契约。撤销截断需要被移除的文本。存在后续无关编辑时，撤销旧编辑可能需要冲突检查。事务回滚作用于相应提交之前。补偿则是针对已完成效果的新操作。

事务范围参见[工作单元](./unit-of-work.md)。[策略](./strategy.md)提供算法，命令提供请求。事件记录事实，参见[观察者](./observer.md)。
