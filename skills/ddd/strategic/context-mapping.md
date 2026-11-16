# Map context relationships

A context map explains how existing models touch, influence one another, and evolve through actual cooperation. Identify each model and its applicability before proposing changes. Mark current arrangements and proposed arrangements separately.

## Describe the relationship

For each contact, record the models, exchanged information, identity correlation, semantic translation, influence direction, change negotiation, and integration owner. Explain the meaning of directional arrows or labels in a diagram.

Upstream influence means one side's model or development decisions constrain the other's success. It can exist alongside data moving both ways. HTTP caller direction, event publication, and business influence answer different questions. Mutual delivery dependence can require cooperation even when technical data flows in only one direction.

## Decide whether to integrate

Compare the useful work an integration enables with the translation and coordination it requires. Include repeated work and manual handoffs in the comparison. Separate Ways keeps the models independent when that tradeoff favors separation. Assign each remaining business obligation to someone who can fulfill it.

An existing mixed area may have no consistent internal model boundary. Mark it as a Big Ball of Mud and describe the contacts that are actually understood. Isolate its effects where useful. Treat a wholesale rewrite as a separate decision requiring justification and permission.

## Assign responsibility for meaning

At an integration point, decide which model the consumer will use. Adopting a suitable upstream model is the Conformist choice. It saves translation work and lets upstream decisions shape the consumer's language and evolution. Check the consumer's rules before adoption; a separate model is worthwhile only when its benefits justify maintaining it.

When the consumer needs its own meanings, place semantic conversion in an Anticorruption Layer. Map identities, units, states, failures, and missing information as well as field names. Maintain the mapping when either side changes. Connection and representation handling belong to transport adaptation. One implementation can perform both responsibilities. Cooperative planning with the upstream can coexist with this translation.

For information exchange, agree on field meanings and document them as a Published Language, using an industry standard or a project contract. Each participant maps between that language and its internal model where needed. Budget for schema maintenance and semantic evolution. A shared schema still requires agreement about meaning.

A provider serving several consumers can maintain a common protocol as an Open-host Service. State the intended consumer scope and evolution contract. Handle exceptional consumer needs through dedicated translation when that preserves the common contract. Publishing an API alone leaves these choices open.

Sharing internal domain concepts is a stronger commitment. A Shared Kernel gives both parties control over changes to a small agreed model and its associated code or schema. Keep it understandable and integrate changes together. Accept the resulting coordination and coupled evolution. Shared logging and HTTP utilities are ordinary technical reuse.

## Arrange changes together

Determine whose delivery depends on whom. When each party needs the other to succeed, Partnership calls for joint planning of important changes, interface evolution, and integration. Allocate time to decide together and remove delivery obstacles. Message exchange alone leaves this dependence unspecified.

When the upstream can succeed independently, inspect whether downstream needs receive negotiated commitments in its plans. Customer Supplier cooperation needs agreed deliverables, scheduling, and contract acceptance. Willingness to hear requests starts that negotiation. Features awaiting commitment remain pending.

These choices describe different aspects of the relationship and can coexist or evolve. Select them from actual model ownership and cooperation. Keep desired arrangements distinct from current ones.

## Translate settlement meaning

Constructed case: a provider returns `CLOSED` for both successful settlement and terminated processing. Its detail is `SETTLED` or `ABORTED`. Internally, `Paid` means confirmed settlement of funds.

The anticorruption mapping needs both status and detail:

- `CLOSED` with confirmed `SETTLED` maps to `Paid`.
- `CLOSED` with `ABORTED` maps to a terminated outcome.
- `CLOSED` with missing decisive evidence remains pending confirmation and needs the appropriate query or reconciliation.

Renaming every `CLOSED` to `Paid` reports an unestablished financial fact. Keep the source identity and evidence needed to explain the translation. A local recording failure leaves an externally confirmed settlement intact and creates a local recording obligation.

The provider controls its interface, so its decisions constrain the internal consumer. Bidirectional calls and notifications preserve this influence. If downstream requirements enter a dependable planning process, describe Customer/Supplier cooperation and the still-pending commitments. If the provider refuses changes, compare conforming to its model with retaining a semantic translation. Acceptance of a foreign name must preserve the internal payment meaning.

Use [Bounded contexts](./bounded-contexts.md) for applicability and [Domain events](../tactical/events.md) for published facts and their timing.
