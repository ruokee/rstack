# Define aggregates

An aggregate groups model elements whose changes need a controlled boundary. Its root supplies the aggregate's identity and coordinates operations that preserve its invariants. Choose that boundary from actual rules and their timing.

## State the invariant

For each important rule, name the facts it covers, every operation that can change them, allowed intermediate states, and the moment the rule must hold. Separate a rule required at every accepted commit from a process allowed to remain pending and an obligation repaired by later reconciliation.

An order can preserve a quantity rule within its own lines. A customer's shared credit rule requires knowledge of all accepted outstanding commitments. An object graph, database foreign key, or shared noun alone supplies insufficient evidence for putting elements in one aggregate.

Give external writers root operations or explicit domain commands. Internal changes pass through the aggregate's rules. A read-only projection can expose internal facts without granting mutation rights. If references expose mutable children, explain how every permitted write path still protects the aggregate.

## Protect shared credit

Constructed case: a customer has a credit limit of 10000 smallest currency units in one fixed currency, with no existing reservations. Orders A and B each request 6000. The confirmed rule is that accepted, unreleased reservations always total at most 10000.

Each order independently checking `its amount <= 10000` accepts both. Their total becomes 12000. That check establishes a single-order bound. The shared-credit decision requires a domain responsibility that can see and decide the common commitment.

A credit account can own the limit and accepted reservations. Give each reservation an identity tied to its customer account and requesting order. Define `reserve`, `release`, and any other commitment-changing operation with their effects. The order records the resulting reservation identity and outcome. Reservation details and totals must agree at the account's commit boundary.

For `reserve(6000)` on the initial account:

1. Read the current authoritative limit and outstanding commitments.
2. Decide whether the additional reservation fits.
3. Atomically persist the accepted commitment and affected account facts under the condition that made the decision valid.
4. Report acceptance only when that operation has committed.

If A and B read version 0, a conditional commit can allow A to reserve 6000 and advance the account version. B's version-0 commit conflicts. B must use current facts for another domain decision; with 4000 available, its 6000 request is refused as insufficient credit. The opposite order has the symmetric result.

A retry of persistence using an already accepted stale decision would repeat the error. Choose the conflict outcome explicitly. The caller may receive a conflict or arrange a fresh decision according to the operation contract.

## Separate responsibility from mechanism

A domain function or method decides from its supplied state. Competing writers require a persistence mechanism such as a conditional update, version comparison, suitable lock, or transaction whose isolation and write conditions protect the shared facts. A transaction label alone leaves its concurrency properties unspecified.

All commitment-changing paths must participate in the chosen mechanism, including release or changes to the limit. State the scope of the guarantee and check the actual mechanism when claiming persistent correctness. A process holding an old snapshot remains possible after a local check.

An allocation model is another candidate when business rules permit distributing bounded portions of credit. It needs a rule keeping the allocations within the total and preserving each portion's authority. For the stated case, one account making the common decision is sufficient.

## Choose a useful size

A large aggregate can increase loading cost, contention, and change coupling. A small one can scatter an immediate invariant across independent decisions. Use the rule and actual access paths to choose. Child records can be stored separately while participating in the same protected operation.

Across aggregates, model pending work and explicit coordination when the business permits intermediate states. If the real rule requires atomic changes, compare a revised aggregate boundary with an appropriate transaction or coordination mechanism and name the cost. Aggregate boundaries and deployment units have separate purposes.

In the partial-cancellation case, `shipped + confirmedCancelled <= ordered` must survive competing shipment and cancellation confirmations. Use the current authority for those quantities and a protected decision over the same units. An accepted request records pending work until fulfillment establishes the cancellation fact.

Use [Domain behavior](./behavior.md) for operation responsibility, [Lifecycle](./lifecycle.md) for persistence contracts, and [Validation](../modeling/validation.md) for cases that distinguish local and persistent guarantees.
