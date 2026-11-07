# Data modeling

Data modeling defines meaning, identity, legal shapes, and transformations. Start with the operations and invariants the data must support. A convenient serialization format is one constraint among them.

## Choose the logical shape

- Use records for fields that exist together and have independent values.
- Use variants for mutually exclusive cases with different required data. Derive a status label from the variant instead of storing a separately writable label.
- Give identifiers and units distinct types when confusing them would violate a real contract. A type alias can improve vocabulary while retaining the same underlying type; a newtype can enforce a distinction.
- Separate a stored authority from a snapshot, projection, or derived value. Define how derived data stays current when it is retained.
- State numeric range, precision, rounding, and missing-value semantics at the boundary that owns them.

For example, a payment can be pending, paid with a receipt, or failed with a reason. A closed sum type associates each payload with its case. Several independent booleans and optional fields would admit combinations the contract never uses.

## Separate shape from validity

A well-shaped value can still violate a domain rule. A floating-point number can be non-finite. A date range can end before it starts. An identifier can refer to a missing record. Enforce each required property at the owner that has enough information.

Distinguish static guarantees, runtime parsing, checked construction, controlled mutation, and caller preconditions. Rust enums constrain variants at compilation. Public variants still permit direct construction. Python annotations support static checking. They do not validate arbitrary runtime input.

Immutable values can preserve an established invariant by restricting mutation. Nested mutable objects and shared aliases need their own policy. Immutability alone does not establish validity at construction.

Restoring an observed state from storage and authorizing a transition into that state are different contracts. Read [State machine](./state-machine.md) when the permitted history matters.

## Make transformations explicit

Identify the representations produced by parsing, validation, normalization, computation, and serialization. Combine stages when they share one useful contract; keep distinct meanings visible when later consumers need the difference.

For monetary input, define the currency, accepted decimal syntax, rounding point, and overflow behavior before converting to integer units. Rounding each row and rounding an aggregate can produce different results. Avoid letting the runtime's incidental numeric defaults choose a business rule.

## Choose physical layout from access

Logical shape and physical layout are separate decisions. An array of structures keeps each record's fields together. A structure of arrays can improve a scan over only a few fields, at the cost of coordinating parallel arrays and record updates.

Inspect actual representation. A Rust `Vec<Record>` stores its records contiguously, while each record's owned strings may refer to separate allocations. A Python list stores references to objects. Merely replacing dictionaries with typed records is insufficient evidence of cache locality or memory density.

Measure representative access, allocation, copying, and retention. Borrow data when its lifetime permits it. Move owned values when ownership changes. Use bounded batches for large inputs, and justify in-place mutation through its ownership contract.

See [Object-oriented](./object-oriented.md) for controlled state and [Functional core](./functional-core.md) for explicit transformations.
