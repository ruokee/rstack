# Type-system discipline

A useful type removes a decision that consumers would otherwise have to repeat. Start at a use site: which combinations must it distinguish, and which values would violate its contract?

An importer can return `Queued`, `Loaded { rows }`, or `Rejected { reason }`. Each variant carries the evidence its consumer needs. Exhaustive handling makes a new outcome visible at affected uses when the language's checker enforces it. A catch-all branch can conceal that change.

Separate equal primitive representations when exchanging them would change meaning, such as a row offset and a row count. Give them construction and parameter types that preserve the distinction. Additional precision earns its cost where an operation depends on it. Counting an empty collection remains a valid operation; selecting its largest member needs an explicit empty outcome or a non-empty input.

Construction must actually establish the claimed property. A range represented by a start and length needs an enforced nonnegative length and defined arithmetic, including overflow. Renaming an unrestricted number to `Length` leaves those obligations unresolved. Parse external representations through an appropriate [boundary](./boundary-discipline.md). A type assertion erased at runtime affects static checking alone. For numeric conversions, assess value-range changes, failure, and overflow behavior according to the language and operation.

Keep schema-owned shapes derived from that schema when multiple representations are needed. Treat bypassed constructors and unchecked conversions as gaps in the guarantee. Static checking covers the properties that definitions and construction paths enforce. Mutable aliases, concurrent writes, persistence, and external effects need mechanisms that govern their actual execution.
