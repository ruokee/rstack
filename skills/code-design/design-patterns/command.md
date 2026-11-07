# Command

A command represents a request separately from the moment it executes. A caller creates the request, an invoker schedules or triggers it, and a receiver performs the operation. The GoF form packages execution behind a common method. A data value with a separate handler can serve the same request role.

## Choose the representation

Use a callable for a local deferred action, an object for behavior with a lifetime, or a record or enum for inspectable request data. Queuing, UI actions, history, and scheduling can each justify the separation. A simple immediate call can remain direct.

Data-only commands are useful when serialization or inspection matters. Keep handlers organized by their actual operations. A command value describes intent; constructing it should leave the requested effect for execution.

## Represent an edit

This Rust 2021 example has a closed set of text-edit requests. Truncation uses a byte offset and rejects offsets outside the string or inside a UTF-8 character. Rejection preserves the text. Appending copies the supplied text into the destination's owned storage.

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

The request is borrowed during execution and can be invoked again. Repeating `Append` repeats its effect. Consuming a command value would restrict local reuse of that value. It would not establish exactly-once processing of persisted or duplicated requests.

## Define replay obligations

Persisted commands require a versioned schema, a way to resolve their target, and a policy for changed preconditions. Record execution outcome separately from requested intent. An audit log of requests alone cannot establish which effects completed.

If duplicate execution is possible, specify idempotency or deduplication at the effect boundary. A closure capturing a live connection has a useful process-local lifetime. It is unsuitable as a durable wire representation.

## Distinguish reversal

Undo requires enough prior state and an ordering contract. Undoing a truncation needs the removed text. Reversing an old edit after unrelated edits may require a conflict check. Transaction rollback applies before the relevant commit; compensation is a new operation for effects already completed.

See [Unit of work](./unit-of-work.md) for transaction scope. [Strategy](./strategy.md) supplies an algorithm, while a command supplies a request. An event records a fact; see [Observer](./observer.md).
