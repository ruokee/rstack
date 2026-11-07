# Composition over inheritance

Reuse implementation and promise substitutable behavior as separate decisions. Composition assembles behavior through collaborators, delegation, and functions. Implementation inheritance reuses base behavior while tying the derived type to a base contract and extension mechanism.

## Identify the coupling

A subclass can depend on which internal methods its base calls, in which order, and with what state. Changing that sequence can break the subclass while preserving the base's public behavior. This is the fragile base class problem.

A composed owner can depend on a collaborator's explicit contract. It still needs to define ownership, lifetime, error propagation, and shared state. Composition reduces coupling only when that boundary actually contains knowledge.

For example, a compressor can wrap a byte writer rather than inherit from a file. Compression owns framing and finalization; the writer owns its destination. The compressor must specify which failures leave partial output and who completes each resource.

## Select the language mechanism

- A function or closure can supply a small calculation or operation.
- A field can hold or borrow a collaborator with a distinct lifetime.
- A Rust trait describes capabilities; its default methods can share behavior. Rust does not provide class implementation inheritance. Generic composition fixes concrete types at compilation, while trait objects support dynamic dispatch.
- A Python protocol can describe structural capabilities for type checking. A class can satisfy it without inheriting its implementation.
- An abstract base class can provide a deliberate extension contract in languages and frameworks built around subclassing.

Choose runtime replacement only when the operation needs it. Generic composition can avoid dynamic dispatch and separate allocation. A dynamic collaborator can simplify a heterogeneous collection or runtime selection.

## Use inheritance deliberately

Inheritance fits a stable behavioral specialization or a framework's supported extension mechanism. Exception categories can also use a hierarchy when catch behavior relies on that relationship. Check the full [substitution contract](./solid.md), including errors, state, and allowed mutation.

Avoid inheriting broad behavior merely to reuse a helper. Disabling inherited operations usually exposes a mismatch in the promised capability.

## Check the wrapper's role

A wrapper can narrow access, translate a contract, or own a lifecycle even when its methods are short. A wrapper that reproduces its collaborator's entire interface can add maintenance with little benefit. Compare direct use with the actual work the wrapper owns; see [Deep modules](./deep-modules.md).
