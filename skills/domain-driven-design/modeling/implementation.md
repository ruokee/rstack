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

Select supple-design techniques according to the difficulty in using or changing the model.

### Express calculations

Identify the facts a calculation needs, including time and external observations. Pass them explicitly to Side-Effect-Free Functions so the inputs determine the result, leaving external effects to their own operations. Where results need further composition, consider Closure of Operations: inputs and results use the same domain type when the operation naturally stays within it. Adding same-currency money values can yield another money value, with currency and rounding rules explicit. Other operations can return different types when the domain requires them.

An existing mathematical or professional model may supply useful operations. Drawing on Established Formalisms includes accounting, interval algebra, and graph constraints. Check the assumptions against business cases and make the mapping understandable to domain participants.

### State guarantees

Name an operation for the domain action and result the caller needs, such as confirming cancellation of a quantity. Intention-Revealing Interfaces make this purpose visible and return the information the actual contract calls for. Express preconditions, postconditions, and invariants through Assertions, using suitable executable checks or documentation. Identify the facts and write paths covered.

When rules are represented declaratively, trace how the system interprets or enforces them and which paths can bypass that mechanism. Declarative Design needs this execution account. Syntax alone establishes no runtime guarantee.

### Choose concept boundaries

Use cases and successive changes to decide which relationships belong together. Conceptual Contours guide splitting or combining concepts along those distinctions. Uniform class sizes and fine-grained decomposition provide little evidence of meaning. Keep concepts independently understandable where practical through Standalone Classes, values, or functions with few dependencies. Retain domain relationships needed to explain the concept.

Compare the benefit in rule expression or operation composition with each technique's added concepts and mechanisms.

## Match the depth

A simple contact directory can use records, entry identity, and direct operations matching its confirmed rules. It can finish with a clear lightweight model. Complex shared-credit commitments require explicit invariants and concurrency responsibility. Both are proportionate domain modeling.

Assess where rules are expressed and how accepted changes preserve them. A data record with a focused pure transition function can be coherent. A collection of objects with rules scattered through unrelated services can be difficult to maintain despite its class names.

This package supplies the domain methods needed to form implementable operations. Use `code-design` optionally for concrete language mechanisms, interfaces, dependencies, and resource costs. Use [Validation](./validation.md) to check the resulting contract and [Evolution](./evolution.md) when deeper understanding changes it.
