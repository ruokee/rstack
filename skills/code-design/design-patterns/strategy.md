# Strategy

A strategy supplies a varying decision or algorithm to a stable operation. The operation owns its workflow; the strategy owns the selected behavior. Selection can happen at compilation, configuration, or each call.

## Define interchangeability

Specify inputs, outputs, errors, state, and permitted effects. Alternatives need a useful common contract. Algorithms needing unrelated input data may belong to different operations. A small closed choice can remain a branch or enum.

A function or closure is sufficient for one capability. Use a trait, protocol, or object when related operations or state need one identity and lifetime. Resolve selection where its configuration is known.

## Borrow the selected item

This Rust 2021 example selects the highest-scoring item. It calls the scorer once per item in input order, returns the last item on a tie, and returns `None` for an empty slice. The result borrows the input. Selection allocates nothing and copies no item.

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

The generic `FnMut` accepts closures with mutable captured state. Concrete instantiations use static dispatch; they can increase generated code size. A borrowed `dyn FnMut` can provide dynamic dispatch without owning or allocating the callable. `Box<dyn FnMut>` adds ownership through a heap allocation for ordinary nonzero-sized closures. Choose the representation separately from the strategy's role.

## Check the cost of variation

Compare dispatch, captured state, lifetime, and the cost of each evaluation. A ranking strategy with expensive I/O changes the operation's cost substantially. Cache a computed score only when the operation requires reuse and its freshness contract allows it.

[Factory](./factory.md) selects or constructs behavior. [Command](./command.md) represents a request. [State](./state.md) organizes behavior selected by the object's current state and transition rules.
