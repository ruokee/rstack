# Law of Demeter

The Law of Demeter, also called the Principle of Least Knowledge, limits how much a unit knows about another unit's internal structure. Its object-oriented formulation favors interaction with the receiver, arguments, created objects, and direct components. Use it to examine structural coupling.

## Find the borrowed knowledge

Suppose shipping code follows an order to its customer, then to the customer's current address. The caller knows the object graph and has also chosen which address represents the shipment. An operation that returns the order's agreed shipping destination can own that decision.

Trace a structural change through consumers. If changing an internal relationship forces unrelated callers to change, ask which meaningful operation should hide that relationship. A long access chain is a clue. The number of dots is not the criterion.

## Distinguish public structure

Transparent records, document trees, and wire formats intentionally expose structure. Traversing them is appropriate when that structure belongs to the consumer's contract. It still creates schema coupling; translate once when many consumers should be insulated from a changeable external representation.

Fluent APIs, iterator pipelines, and builders can express a designed sequence through stable operations. Check what each step returns and whether it exposes internals. A chain can have a coherent public contract.

## Add a meaningful operation

Prefer a question or action in the caller's terms, such as determining a shipping destination or reserving inventory. Keep traversal and any associated rule with its proper owner. A projection that deliberately narrows a stable public view can also be useful.

Adding forwarding methods for every field merely redistributes navigation. Evaluate the rule, compatibility obligation, or access boundary each method owns. For deep mocks, examine whether the production caller knows too much or the check is coupled to internals.

See [Deep modules](./deep-modules.md) for information hiding, [GRASP](./grasp.md) for responsibility, and [Tell Don't Ask](./tell-dont-ask.md) for decisions over owned state.
