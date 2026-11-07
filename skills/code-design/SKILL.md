---
name: code-design
description: Use when designing new code or improving existing code structure.
disable-model-invocation: true
metadata:
  version: "1.0.0"
---

# Code design

Design the smallest structure that makes the required behavior clear and keeps its rules enforceable. Work from actual uses, state, dependencies, and costs. A function, type, module, or package can be the right unit of design.

## Establish the problem

Read the requirements, relevant callers, implementation, and existing decisions. State the operation being supported, the reason for changing its structure, and the behavior that must survive. Separate confirmed constraints from assumptions about future use.

Trace one representative operation from input to result. Locate decisions, state changes, external effects, and resource acquisition. For new code, include its integration points. For an existing change hotspot or caller migration, read [Existing code](./existing-code.md).

The question should name a concrete difficulty, such as several callers interpreting one rule, an unclear resource owner, or a state representation that admits invalid combinations. A small change with an adequate existing structure needs only the local design decision.

## Describe the use

Write how a caller completes the operation, including relevant failure and boundary cases. Derive signatures from that use. Read [Interfaces](./interfaces.md) when inputs, errors, ordering, ownership, or required caller knowledge need definition.

Name each invariant and the operation that establishes or preserves it. State who owns mutable state, who can change it, and who acquires and releases resources. Include partial completion, cancellation, concurrency, and observable costs where the operation requires them.

Proceed when the caller can tell what success means, what remains after failure, and which obligations belong to each participant.

## Choose a representation

Choose data shapes and operations before arranging files. Use the target language's direct mechanisms: records for independent values, variants for alternatives, functions for transformations, and objects or modules for state with controlled operations. Add indirection when it contains an actual decision, conversion, lifecycle, or variation.

Explain how each guarantee is enforced. Types can constrain shape and permitted operations. Construction and mutation paths establish value invariants. Shared storage or synchronization must resolve competing writers. Naming and documentation establish conventions that callers must follow.

Try to violate the proposed invariant through a public constructor, mutation, stale observation, or failure between effects. Repair the representation or narrow the claim to its actual guarantee. Include allocation, copying, I/O, buffering, dispatch, and task counts when they affect the requirements.

## Compare the remaining tradeoff

Compare alternatives only where a consequential choice remains. Useful alternatives change responsibility or behavior: a borrowed writer versus an owned output session, a closed set of variants versus an extensible interface, or an atomic operation versus separate steps. Include keeping the current structure when it is viable.

Use the same caller scenarios for each option. Compare required knowledge, enforcement of invariants, change scope, failure handling, resource costs, and verification. Choose one and state the cost being accepted. Resolve missing facts or priorities that would change that choice.

## Make the design usable

Walk the important scenarios through the proposed types and operations. Check that signatures, examples, and prose describe the same contract. Provide the information needed to implement and evaluate the change:

- The chosen structure and the constraint that decides it.
- Caller usage, legal states, invariant enforcement, and ownership of effects and resources.
- Failure outcomes and the caller's next valid action.
- Affected callers and a migration order for existing code.
- Observable checks for the behavior and costs being promised.

An unresolved decision belongs beside the operation it blocks, with the information needed to resolve it. Design detail should match the change's risk and scope.

## Revisit a broken assumption

Repeated type escapes, extra flags, duplicated caller rules, or conflicting writers are evidence to examine the model. Trace the repeated difficulty to a requirement gap, an implementation error, or a structural assumption. An isolated edge case follows its existing contract.

When the structure causes the difficulty, revise caller usage and state ownership using the observed case. Carry the resulting contract through the representation, callers, migration, and checks.

## Read by question

### Principles

- Copies of one rule or representation: [DRY](./design-principles/dry.md).
- Evidence for extracting a common abstraction: [Rule of Three](./design-principles/rule-of-three.md).
- Complexity of use or implementation: [KISS](./design-principles/kiss.md).
- Flexibility for an unconfirmed requirement: [YAGNI](./design-principles/yagni.md).
- Responsibility, substitution, capability, or dependency direction: [SOLID](./design-principles/solid.md).
- Assigning behavior to an owner: [GRASP](./design-principles/grasp.md).
- Callers navigating another module's internal structure: [Law of Demeter](./design-principles/law-of-demeter.md).
- Callers making decisions from another owner's mutable state: [Tell Don't Ask](./design-principles/tell-dont-ask.md).
- Reusing implementation or providing substitutable behavior: [Composition over inheritance](./design-principles/composition-over-inheritance.md).
- Policy contracts, injection, and assembly: [Dependency inversion](./design-principles/dependency-inversion.md).
- Useful capability relative to required caller knowledge: [Deep modules](./design-principles/deep-modules.md).

### Patterns

- Selecting how to construct a product: [Factory](./design-patterns/factory.md).
- Selecting a compatible family of products: [Abstract factory](./design-patterns/abstract-factory.md).
- Accumulating options before valid construction: [Builder](./design-patterns/builder.md).
- Varying a decision behind a stable operation: [Strategy](./design-patterns/strategy.md).
- Subscriber identity and notification semantics: [Observer](./design-patterns/observer.md).
- Translating representation and error contracts: [Adapter](./design-patterns/adapter.md).
- Composing behavior around an existing interface: [Decorator](./design-patterns/decorator.md).
- Coordinating a coherent use of a subsystem: [Facade](./design-patterns/facade.md).
- Representing a request separately from execution: [Command](./design-patterns/command.md).
- Organizing behavior by its current state: [State](./design-patterns/state.md).
- Adding operations across known node kinds: [Visitor](./design-patterns/visitor.md).
- Domain-facing queries and persistence operations: [Repository](./design-patterns/repository.md).
- Coordinating tracked changes and transaction completion: [Unit of work](./design-patterns/unit-of-work.md).

### Structural approaches

- Explicit execution order and local mutation: [Imperative](./approaches/imperative.md).
- Declared rules interpreted by an evaluator: [Declarative](./approaches/declarative.md).
- Identity and state with controlled operations: [Object-oriented](./approaches/object-oriented.md).
- Decisions computed separately from effects: [Functional core](./approaches/functional-core.md).
- Legal data shapes, value invariants, and physical layout: [Data modeling](./approaches/data-modeling.md).
- Facts, notifications, and delivery guarantees: [Event-driven](./approaches/event-driven.md).
- States, guards, and permitted transitions: [State machine](./approaches/state-machine.md).
- Borrowing, transfer, completion, and release: [Resource lifecycle](./approaches/resource-lifecycle.md).
- Scheduling, cancellation, and bounded retained work: [Async concurrency](./approaches/async-concurrency.md).
