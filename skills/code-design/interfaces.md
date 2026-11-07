# Interfaces

An interface is the complete knowledge needed to use a module correctly. It includes behavior, errors, ordering, ownership, and observable cost as well as types. A module can be a function, object, package, or coherent group of operations.

## Write the caller first

Start with a real operation and its surrounding lifetime. Write the shortest caller that performs it correctly. Include a relevant failure path. Derive the parameters and return values from what the caller supplies, owns, and needs afterward.

For example, `write_report(out, rows)` can borrow a caller-owned stream. `save_report(path, rows)` can own opening and closing a file. The latter has a distinct lifecycle responsibility. Each contract still needs to specify encoding, formatting, partial writes, and failure behavior where applicable. Closing the file releases a resource. Reversing an incomplete write requires a separate mechanism.

## Define the whole contract

- Describe the input domain, units, identity, ordering, and output guarantees. State which participant establishes required preconditions.
- Distinguish an expected domain outcome, a rejected input, and an infrastructure failure when callers respond differently. Preserve causes needed for diagnosis.
- Describe the state after each failure: unchanged, partially completed, or unknown. Specify whether the operation can be repeated safely and what establishes that property.
- Identify borrowing, ownership transfer, shared ownership, and leases. State when access ends and who completes, cancels, or releases the operation.
- Include observable work: blocking, I/O, allocations, copying, retained buffers, task creation, and result size. A streaming input paired with a fully collected output still retains the output.
- State required call order, configuration, thread or task affinity, and concurrency guarantees. Identify the operation at which a shared update takes effect.
- Treat public wire formats, names, errors, and ordering as compatibility commitments where consumers depend on them.

Keep the contract as small as the operation permits. An optional control belongs in the public interface when a real caller needs it.

## Locate each guarantee

Separate what is represented from what is enforced. A variant can associate data with a state. A private constructor can restrict creation. A checked transition can preserve an invariant. A transaction can coordinate competing updates within its actual isolation rules.

A language's type annotation may serve static checking alone. An immutable record protects its own fields according to that language's rules. Neither mechanism should be credited with validating arbitrary external input or coordinating independent writers.

Check every accessible construction and mutation path. State the authority of the stored value and whether a caller holds a live object, snapshot, or identifier. This decides whether a decision made from a read is still valid at the following write.

## Choose the boundary

Hide decisions that callers should not have to repeat: protocol conversion, a policy, a lifecycle, or coordinated ordering. A single implementation can carry any of these responsibilities. An adapter specifically translates between contracts. An implementation of an interface may need no translation.

Consider removing a layer. Determine which work disappears and which work moves into every caller. Keep a boundary that reduces total required knowledge or gives a rule one effective owner. Inline a layer that merely renames an operation without serving a current responsibility.

Choose a function, a stateful object, an explicit session, or an extension interface according to the required lifetime and variation. Dependency injection can expose a useful replacement point. Stable implementation details can remain internal to the module.

## Check real use

Exercise success, relevant failure, and lifecycle scenarios through the proposed public operations. Compare the observed state with the promised postconditions. Use type checks for static guarantees and runtime evidence for effects, cleanup, and costs. A substitute must reproduce the dependency semantics needed by the scenario.

For migration, read [Existing code](./existing-code.md). For caller knowledge, read [Deep modules](./design-principles/deep-modules.md). For translation, read [Adapter](./design-patterns/adapter.md).
