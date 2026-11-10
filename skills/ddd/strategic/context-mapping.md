# Map context relationships

A context map explains how existing models touch, influence one another, and evolve through actual cooperation. Identify each model and its applicability before proposing changes. Mark current arrangements and proposed arrangements separately.

## Describe the relationship

For each contact, record the models, exchanged information, identity correlation, semantic translation, influence direction, change negotiation, and integration owner. Explain the meaning of directional arrows or labels in a diagram.

Upstream influence means one side's model or development decisions constrain the other's success. It can exist alongside data moving both ways. HTTP caller direction, event publication, and business influence answer different questions. Mutual delivery dependence can require cooperation even when technical data flows in only one direction.

## Choose cooperation deliberately

### Partnership

Both sides depend on successful delivery by the other. Coordinate important plans, interface evolution, and integration. Shared success requires time for joint decisions and resolving delivery obstacles. Two systems exchanging messages alone establishes insufficient evidence for this relationship.

### Shared Kernel

The sides explicitly share a limited domain model and its associated implementation or schema, with joint control of changes. Keep its scope intelligible and integrate changes so meanings remain coherent. The cost is close cooperation and coupled evolution. A shared logging or HTTP utility library represents ordinary technical reuse.

### Customer Supplier

The downstream's requirements enter the upstream's planning through a real negotiation and commitment process. Agree on deliverables, schedule, and acceptance of the contract. The upstream can otherwise succeed independently. Listening to a request makes negotiation possible; an uncommitted feature remains pending.

### Conformist

The downstream adopts the upstream model where that model is acceptable. This reduces translation and gives the upstream control over important expressions and evolution. It can be reasonable when maintaining a separate model yields too little value. Check whether adoption preserves the downstream's actual rules.

### Anticorruption Layer

The downstream expresses upstream capabilities through its own domain model. Translate meaning, identities, units, states, and failure or missing-information cases. The cost is maintaining a semantic mapping as either model changes. It can coexist with a cooperative upstream relationship.

A transport adapter handles connection and representation details. An anticorruption layer earns its domain role by preserving meaning. One implementation can perform both jobs when their responsibilities remain clear.

### Open-host Service

The upstream offers an explicit protocol for multiple consumers. Maintain a coherent shared contract and its evolution. One consumer's unusual need may use a dedicated translator to preserve that contract. An API's existence alone leaves openness and intended consumer scope unspecified.

### Published Language

Participants exchange information in an explicitly documented language with shared meaning. Translate to and from internal models as needed. This can be an industry standard or a project-defined contract. Schema maintenance and semantic evolution are its cost. A shared schema still needs agreement about what its fields mean.

### Separate Ways

Keep contexts independent when integration value is lower than its cost. Account for actual duplicate work or manual handoffs. Required obligations still need an owner wherever they are performed.

### Big Ball of Mud

Mark an existing area where models and rules are mixed and internal boundaries are inconsistent. Describe known contact points and isolate its influence where useful. This records the actual terrain. A wholesale rewrite requires its own justification and permission.

Patterns can combine and evolve. Select them by actual collaboration and model decisions. Explain a desired change separately from the current relationship.

## Translate settlement meaning

Constructed case: a provider returns `CLOSED` for both successful settlement and terminated processing. Its detail is `SETTLED` or `ABORTED`. Internally, `Paid` means confirmed settlement of funds.

The anticorruption mapping needs both status and detail:

- `CLOSED` with confirmed `SETTLED` maps to `Paid`.
- `CLOSED` with `ABORTED` maps to a terminated outcome.
- `CLOSED` with missing decisive evidence remains pending confirmation and needs the appropriate query or reconciliation.

Renaming every `CLOSED` to `Paid` reports an unestablished financial fact. Keep the source identity and evidence needed to explain the translation. A local recording failure leaves an externally confirmed settlement intact and creates a local recording obligation.

The provider controls its interface, so its decisions constrain the internal consumer. Bidirectional calls and notifications preserve this influence. If downstream requirements enter a dependable planning process, describe Customer/Supplier cooperation and the still-pending commitments. If the provider refuses changes, compare conforming to its model with retaining a semantic translation. Acceptance of a foreign name must preserve the internal payment meaning.

Use [Bounded contexts](./bounded-contexts.md) for applicability and [Domain events](../tactical/events.md) for published facts and their timing.
