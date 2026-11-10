# Represent domain events

A domain event represents something that happened and matters to domain participants. Choose facts needed to explain decisions, obligations, or reactions. Events can serve a single bounded context as well as integration across contexts.

## Name the fact

A command requests an action, a state record describes current knowledge, an event records an occurrence, and a message transports information. A rejected cancellation command leaves the cancellation fact unestablished. Record a rejection as its own fact only when that occurrence matters to the domain.

Give each event the meaning and facts consumers need. These can include subject identity, quantity, currency, occurrence time, recording time, event identity, and the responsible source. Distinguish time of occurrence from time of local knowledge. Use a stable identifier when the same occurrence can arrive more than once.

In partial cancellation, request acceptance, fulfillment cancellation confirmation, refund obligation, and refund completion have distinct meanings. Name the fact that actually occurred. Request acceptance leaves the later outcomes open. An event used internally to calculate an obligation is a domain event even if it never crosses a network.

## Locate the commitment

A domain decision may produce proposed state and pending events before persistence. For a fact established by the local operation, successful commit establishes the fact. On rollback, discard that operation's pending success events and external success claims. An ambiguous commit result requires checking the operation's authoritative outcome before deciding what happened.

These cases have different outcomes:

- A refused cancellation produces its refusal result. The requested cancellation has not occurred.
- A cancellation whose local transaction fails leaves that transaction's cancellation uncommitted.
- A successfully committed cancellation establishes its fact and any recorded remaining obligations. Notification can still be pending.

An event handler that runs before commit can participate in the same local transaction when that is the chosen contract. External effects triggered at that time can escape a later rollback. Arrange them according to their actual commitment and failure semantics.

An external fact has its own authority. If the settlement provider has confirmed settlement and local recording fails, preserve the provider's established settlement fact. Local recording and reconciliation remain obligations. A local rollback cannot undo the earlier external occurrence.

## Publish a contract

Internal domain events can evolve with the model. An integration event is an explicit contract exposing facts another context needs. Translate internal identities, terms, and states into that contract. A structural schema match still needs the same business meaning, including when the fact becomes true.

When committed facts require reliable publication, persist the business change and its publication obligation atomically, for example as an outbox record in the same transaction. A publisher sends committed records and tracks progress. A crash after sending and before recording progress can cause duplicates. Consumers need stable occurrence identity and a business-appropriate duplicate-handling contract. A duplicate financial effect needs stronger protection than a repeatable projection assignment.

Explain any ordering needed by the business and how consumers interpret incomplete knowledge. Broker delivery alone cannot establish an external financial effect. Detailed transport and transaction mechanisms can use `system-architecture` as optional deeper guidance.

## Preserve history

Events describe occurrences. A later correction or compensation is a new fact linked to the earlier one. Cancellation, reversal, refund, and data correction each have their own business meaning. Explain how a consumer derives current knowledge without rewriting the fact that an earlier action occurred.

Event sourcing uses event history as the authoritative source for reconstructing state. It adds responsibilities for event evolution, replay, and historical interpretation. CQRS separates read and write models. Both are optional choices. A model using domain events can retain ordinary state storage.

Use [Context mapping](../strategic/context-mapping.md) for semantic translation, [Lifecycle](./lifecycle.md) for creation and restoration, and [Validation](../modeling/validation.md) for commit and failure scenarios.
