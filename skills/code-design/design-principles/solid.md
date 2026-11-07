# SOLID

SOLID collects five object-oriented design principles associated with Robert C. Martin. Use them to examine responsibility, behavioral contracts, and dependency direction. Their questions also apply to functions and modules. The target language determines the implementation mechanism.

## Single responsibility

Group behavior that changes for the same reason. Separate rules controlled by different requirements when combining them makes changes interfere. Cohesion matters more than the number of operations in a class or function.

For example, invoice calculation, document layout, and storage format can change independently. Each can have its own contract while one use-case operation coordinates them. Splitting every arithmetic step into an object would scatter the calculation's responsibility.

Ask which rule changed in recent work and how far its consequences spread. A module that coordinates several steps can still have one coherent responsibility.

## Open closed principle

Protect a stable operation from a known direction of variation. An extension mechanism fixes a contract so that new implementations can satisfy it. Its usefulness depends on the stability of that contract and the cost of changing existing consumers.

A closed enum with exhaustive matching makes a known set of variants visible and makes added variants require attention at affected matches. An extensible interface lets new implementations supply behavior without updating each consumer. The choice depends on whether variants or operations are expected to change independently.

Choose a function parameter, generic parameter, trait, protocol, registry, or configuration according to the actual variation and language. A plugin protocol is justified by an actual extension obligation. An implementation count is insufficient to establish that obligation. See [YAGNI](./yagni.md).

## Liskov substitution

Behavioral substitution requires an implementation to satisfy the contract consumers were given. It must accept the promised input domain, preserve invariants and permitted histories, and deliver the promised results and failure behavior. A subtype must not strengthen preconditions or weaken postconditions.

For example, a read-only collection cannot satisfy an interface promising mutation merely by exposing a mutation method that always fails. A writer that permits partial writes is valid under a partial-write contract. It is invalid under a contract promising complete output on success.

Type compatibility checks only the properties represented in the type system. Timing, resource ownership, error meaning, and aliasing behavior need explicit contracts and appropriate checks. Reusing implementation and making a substitution promise are separate decisions; see [Composition over inheritance](./composition-over-inheritance.md).

## Interface segregation

Describe the capabilities a consumer actually needs. A reader of records should be able to depend on reading without also receiving transaction administration or deletion responsibilities. Separate interfaces when the consumers and obligations differ.

Choose the smallest coherent capability, rather than an interface per method. Some operations must stay together because they share a session, invariant, or lifetime. Too many isolated interfaces can hide that relationship and burden assembly.

A callable can represent one operation. A trait or protocol can represent related capabilities. Concrete parameters remain appropriate for stable internal collaboration.

## Dependency inversion

Let policy define the contract it needs from a detail. Make the detail implement that contract so that its changes can remain behind the policy boundary. The runtime call can still go from policy to detail while the source dependency points toward the policy's contract.

Passing a concrete vendor client from outside is dependency injection. Translating its response is adaptation. Neither action alone determines who owns the abstraction. Read [Dependency inversion](./dependency-inversion.md) for contract ownership and assembly.

## Apply the principles together

Judge the complete operation. Splitting responsibilities can introduce extra coordination. An extension interface can weaken exhaustiveness. Narrow capabilities can complicate shared lifetimes. Abstraction can add dispatch and allocation costs depending on its representation.

Choose the structure that protects the required behavior with the least unnecessary knowledge and machinery. Use [GRASP](./grasp.md) to assign responsibility and [KISS](./kiss.md) to compare the total complexity.
