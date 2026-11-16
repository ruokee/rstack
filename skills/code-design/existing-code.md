# Existing code

Improve structure to make a concrete operation or change easier. Begin with the affected callers and rules. Preserve the required observable behavior throughout the chosen migration.

## Identify the cost

Trace a reported difficulty or an actual recent change. Look for repeated interpretation of one rule, callers depending on internal structure, state with competing owners, or unrelated changes passing through one module. Record the behavior involved and the work the current structure makes necessary.

Line count, file hops, and a pattern name are investigation clues. The reason to change a boundary is its effect on correctness, caller knowledge, runtime cost, or the scope of future changes supported by current evidence.

## Separate contracts from accidents

Describe the required inputs, outputs, ordering, errors, partial effects, and resource behavior. Distinguish intended behavior, compatibility obligations, and known defects. A structural refactor preserves its behavioral contract. A deliberate correction changes that contract explicitly.

Identify where requirements are enforced and which callers depend on them. An internal type can be private yet still carry an important invariant. A public method can expose incidental behavior that the project has no obligation to preserve.

## Trace dependency responsibility

Investigate the responsibility a proposed boundary would carry:

- Who defines the contract? Translate an external interface when the caller needs different concepts. Preserve protocol details that the product intentionally exposes. Separate policy from mechanics where doing so contains change.
- What must remain coordinated at runtime? Follow resource lifetimes, state owners, and failure outcomes. Responsibilities in one process may still need separate rules and resources. A network boundary brings latency, partial failure, and state that can change independently, including within one team's systems.
- What evidence supports replacement? Compare setup and maintenance costs, then check the behavior a substitute must reproduce. Concurrency, transactions, and cleanup need the semantics relevant to the scenario. Lower setup cost can justify a replacement point when those semantics hold.

Use [Interfaces](./interfaces.md) to write the proposed caller usage. Explain which existing work moves behind the boundary and who owns it afterward. Consider retaining the current structure, removing indirection, or adding a boundary according to the actual difficulty.

## Keep a change coherent

Move one rule and its enforcement together. For example, configuration parsing can yield syntax values, one interpretation step can apply defaults and precedence, and execution can consume the resulting settings. Callers should agree on which representation they receive.

Preserve distinct lifetimes and consistency boundaries when moving code. Copying mutable state into a new module can create a second authority. Moving a query behind a helper can conceal repeated I/O. Check these effects in the caller's full operation.

## Complete the migration

Enumerate affected producers, consumers, constructors, persistence formats, and documentation. Choose a switch order that keeps valid intermediate states. A coordinated replacement can be simpler when all consumers move together. Independently released consumers may require a deliberate compatibility period.

Migrate all consumers within the chosen cutover and remove obsolete paths. Give any compatibility path an actual obligation and a removal condition. Preserve unique behavior coverage when updating checks. Assertions tied solely to a discarded internal shape should leave with that shape.

Run the same representative operations after the change, including the failure path that motivated the boundary. Check observable outcomes, resource behavior, and relevant costs. Repeated exceptions to the proposed design are evidence to revisit its assumptions.
