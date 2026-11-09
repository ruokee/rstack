# Rust correctness

Error mapping and field-visibility checks for Rust code.

## Error mapping

This complete example uses stable Rust 2021 and preserves two declared error categories. `Transport` must remain distinguishable from a business refusal:

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

Mapping both variants to `Rejected` would lose the caller's required distinction. Restore distinct mappings and preserve required cause information. Whether to retry is a separate project policy.

## Field visibility

Rust private fields restrict the visibility of direct construction and field access. Code allowed to construct or mutate those fields must still enforce the rule. Trace actual construction, mutation, and nested mutable data before judging whether an invariant is preserved. Choose runtime validation according to the project's input contract.
