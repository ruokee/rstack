# Rust 正确性

Rust 代码的错误映射及字段可见性检查。

## 错误映射

以下完整示例使用稳定 Rust 2021，保留两种已声明的错误分类。`Transport` 必须与业务拒绝保持可区分：

```rust
#[derive(Debug, PartialEq)]
enum SdkError {
    Declined,
    Transport,
}

#[derive(Debug, PartialEq)]
enum PaymentError {
    Rejected,
    Unavailable,
}

fn map_error(error: SdkError) -> PaymentError {
    match error {
        SdkError::Declined => PaymentError::Rejected,
        SdkError::Transport => PaymentError::Unavailable,
    }
}

fn main() {
    assert_eq!(map_error(SdkError::Declined), PaymentError::Rejected);
    assert_eq!(map_error(SdkError::Transport), PaymentError::Unavailable);
}
```

将两种情况都映射为 `Rejected` 会丢失调用方需要的区别。恢复不同映射，并保留契约所需的原因信息。是否重试是项目的独立策略。

## 字段可见性

Rust 私有字段限制直接构造及字段访问的可见范围。可访问字段的构造和修改代码仍需实施规则。核对构造、修改及嵌套可变数据的实际路径，再判断不变量是否保持。运行时校验由项目输入契约决定。
