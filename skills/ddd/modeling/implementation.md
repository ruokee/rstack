# Express the model in software

Model-driven design keeps domain understanding and software expression in active correspondence. A model must explain the business cases and support a practical implementation. Implementation feedback can reveal a missing distinction or an awkward abstraction.

## Start with a domain action

Write how a caller expresses a confirmed action, including its inputs, prior facts, success, refusal, and remaining obligations. Then choose a representation that makes that contract clear.

Constructed partial-cancellation contract: five units are ordered, two are confirmed shipped, and unshipped units may be cancelled. A request for three units can be accepted for processing. Fulfillment confirmation establishes cancelled quantities under `shipped + cancelled <= ordered`. Collected payment for the cancelled portion creates a refund obligation under the stated agreement.

One implementation can expose methods on an order or fulfillment aggregate. Another can use immutable quantity facts and a pure decision function that returns a refusal or proposed new state and pending facts. Coordination loads the authority's current state, invokes the decision, and persists under the required concurrency condition. Both implementations need a successful protected commit before claiming a locally established fact.

A discriminated result can distinguish refused, accepted-for-processing, and confirmed outcomes. The type excludes the variants its definition makes impossible. Imported data, unsafe construction paths, competing writes, and external actions require their applicable runtime or persistence mechanisms.

## Separate responsibilities

Keep domain meaning and rules understandable apart from UI, transport, persistence, and application scheduling. Layers, ports, or modules can establish that separation. Use the project's structure and existing mechanisms. A new directory hierarchy earns its place through clearer responsibilities.

Organize modules around cohesive domain knowledge and use the model's language. Inspect where a rule changes before reorganizing code. Stages such as `load`, `validate`, and `save` can be useful coordination structure. A problem exists when the same domain rule is fragmented or inconsistently repeated across stages.

Keep the modelers connected to implementation and domain participants. Jointly revisit concepts when implementation requires unexplained exceptions or when an important business distinction disappears in code.

## Make operations understandable

The following supple-design techniques support a model that people can use and change:

- Intention-Revealing Interfaces name the domain purpose and effect, such as confirming cancellation of a quantity. State what the caller can rely on. Return information according to the actual operation contract.
- Side-Effect-Free Functions isolate calculations or decisions from external effects. Their stated inputs determine their results. Make current time or external facts explicit when the rule depends on them.
- Assertions express preconditions, postconditions, and invariants in project-appropriate executable checks or documentation. State which write paths and facts they cover.
- Standalone Classes, or independently understandable values and functions, keep a concept intelligible with few dependencies. Preserve necessary domain relationships when independence would distort meaning.
- Closure of Operations supports composition when an operation's inputs and result have the same domain type. Adding money values in the same currency can produce another money value. The operation needs explicit currency and rounding rules. An arbitrary operation need not be forced into closure.
- Declarative Design expresses rules in a form an execution mechanism interprets or enforces. Explain the mechanism and any bypass paths. A declaration's syntax alone establishes no runtime guarantee.
- Drawing on Established Formalisms borrows a system of concepts such as accounting, interval algebra, or graph constraints. Verify that its assumptions match the business, and preserve the participants' understanding of the mapping.
- Conceptual Contours follow meaningful relationships and patterns of change. Split or combine concepts where cases and successive changes expose a real distinction. Uniform class size or fine decomposition is a weak substitute for that evidence.

Each technique has a cost in concepts and mechanisms. Choose it for an observable benefit in expressing rules or combining operations.

## Match the depth

A simple contact directory can use records, entry identity, and direct operations matching its confirmed rules. It can finish with a clear lightweight model. Complex shared-credit commitments require explicit invariants and concurrency responsibility. Both are proportionate domain modeling.

Assess where rules are expressed and how accepted changes preserve them. A data record with a focused pure transition function can be coherent. A collection of objects with rules scattered through unrelated services can be difficult to maintain despite its class names.

This package supplies the domain methods needed to form implementable operations. Use `code-design` optionally for concrete language mechanisms, interfaces, dependencies, and resource costs. Use [Validation](./validation.md) to check the resulting contract and [Evolution](./evolution.md) when deeper understanding changes it.
