# Dependency inversion

Dependency inversion makes a policy's required contract independent of the detail that implements it. The detail depends on that contract. This can contain vendor, storage, or transport changes while keeping the policy readable in its own terms.

## Distinguish the decisions

- Dependency inversion concerns who defines the abstraction and which source code depends on it.
- Dependency injection supplies a dependency from outside its consumer.
- An [Adapter](../design-patterns/adapter.md) translates an existing contract into the required one.
- Dispatch determines how a particular implementation is selected or called.

Injecting a vendor-specific client can leave policy coupled to the vendor's concepts. An adapter can translate an interface while both interfaces remain owned by the infrastructure. A generic parameter can implement inversion with static dispatch.

## Shape the needed contract

Express the policy's actual operation, including errors, partial results, ownership, and consistency requirements. Avoid reproducing an entire vendor API under new names. A stock reservation needs an atomic reserve operation if correctness depends on concurrent stock; separate read and write methods would leave that responsibility with the caller.

Use a value when the policy needs a value. A calculation that needs one timestamp can receive that timestamp. A long-running operation that must obtain fresh time at several points may need a clock capability. The distinction follows usage and lifetime.

In Rust, a trait bound can describe the capability without a trait object or heap allocation. A borrowed `dyn Trait` selects behavior dynamically and borrows its implementation. In Python, a callable or protocol can describe the same dependency role. Their static and runtime guarantees differ.

## Assemble at the owner

Construct concrete dependencies where configuration and lifetime are known, then pass them to consumers. This composition root may be application startup or a scoped operation. It also determines shutdown order and which dependencies are shared.

Explicit parameters usually make the graph visible. A container can manage genuinely varied scopes or assembly. A global service locator moves dependency discovery into hidden lookups, which makes construction and failures harder to trace.

## Keep the boundary useful

Stable pure helpers and language-library operations often remain direct dependencies. A boundary earns its cost by containing a real policy, conversion, lifecycle, variation, or useful isolation requirement. Check the actual responsibility rather than the number of implementations.

For verification, a substitute must preserve the dependency semantics being tested. In-memory storage may differ in locking, transaction isolation, and failure behavior. Deep patching is a reason to examine both the production boundary and the check's assumptions.

See [Interfaces](../interfaces.md) for the full contract and [YAGNI](./yagni.md) for speculative replacement points.
