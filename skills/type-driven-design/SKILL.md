---
name: type-driven-design
description: Use when designing type models or diagnosing and evolving existing models, including data shapes, semantic distinctions, states, and operation contracts.
metadata:
  version: "1.0.1"
---

# Type-driven design

Design types that explain what values mean and how callers use them. Start with an operation, derive the distinctions it needs, and choose representations whose fields and calls carry those distinctions. Static checking enforces the relationships the language and configured tools support.

Resolve the request's endpoint: analysis, a design ready to implement, review, or an authorized change. Reuse established requirements and project conventions. Investigate missing business facts that would change the model. Simple annotation work and checker configuration follow language or quality guidance. Use this process when the difficulty concerns the meaning or organization of the model.

## Start with an operation

Read requirements, representative callers, existing types, and relevant boundaries. Describe one operation through its input, result, and next action. Establish the current difficulty, scope, and behavior to preserve.

For an existing model, read [Existing models](./references/existing-models.md) before choosing a replacement. Establish the cause, then use the common design steps below for the complete target. For Python choices, read [Python](./references/python.md). Read the [worked example](./references/worked-example.md) when a concrete derivation or migration would help.

Proceed when the operation, affected uses, required behavior, and requested outcome are clear.

## Identify the distinctions

Write down the facts the operation needs to distinguish. Select the relevant dimensions:

- Identity versus value equality; units; different parameter roles with the same underlying representation.
- Fields that belong together; mutually exclusive outcomes; states and the operations each permits.
- Omitted input, explicit clearing, pending data, absence, failure, and an empty successful collection.
- Relationships between inputs and outputs; capabilities required by consumers.
- Authoritative facts, derived values, historical snapshots, mutable objects, and responsibility for changes.

Give each distinction a use site. A batch identifier and a source identifier matter when exchanging them would address the wrong object. Two account parameters of the same type still need names that explain their roles. A count of zero needs its own interpretation before choosing a presence check.

Proceed when every required distinction has an operational meaning. Keep unresolved facts with the choices they affect.

## Choose a representation

Write the intended caller usage first. Select the smallest representation that makes it readable:

- Use records for named roles that form one value.
- Use mappings for lookup by actual keys and dynamic key-value collections.
- Use sequences when order or repeated elements matters. Preserve a genuine positional protocol.
- Use variants when each case has its own payload and handling.
- Use distinct value types when swapping otherwise similar values causes a real error.
- Use generics to retain a relationship the caller relies on. Use capability interfaces to state what a consumer needs.

Make fields, construction, and operations explain the same concepts. Keep transport, persistence, internal models, and query projections separate where their meaning, lifecycle, or contracts differ. When a schema owns the shape, identify how other representations are generated or kept consistent.

Compare alternatives only where there is a material tradeoff. Include keeping the current form. Consider hidden conventions at call sites, change scope, conversion work, allocations, copying, and storage layout. Ground performance claims in the actual representation and workload. Remove wrappers whose names or conversions add no useful distinction.

Proceed when each added type or conversion has a specific purpose and representative calls explain the operation.

## Locate the guarantees

For each required property, identify where it is established and maintained:

- Static checking constrains annotated, checked uses according to the language and checker configuration.
- Construction and parsing establish the properties their actual paths check or derive.
- Conversion and restoration preserve known information and expose missing facts.
- Updates and ownership maintain the properties affected by mutation or shared aliases.
- Operations with access to external facts govern existence, concurrency, persistence, and effects.

Trace ordinary constructors, factories, decoders, historical readers, and update paths. A checked factory establishes a property for its output. Inspect other public construction paths before attributing that property to every instance.

Distinguish frozen fields, a read-only interface, deep immutability, and exclusive ownership. A snapshot of a state describes that value. Legal transition history and completed external effects require their own mechanisms.

Place runtime checks at real boundaries and invariant-establishing operations. Internal callers may rely on established preconditions. State the guarantee's scope and the caller's remaining responsibility.

Proceed when each claimed guarantee has a mechanism, covered paths, and clear limits.

## Check the usage

Return to the original operation. Check a valid boundary case, a misuse, and a relevant change, such as an empty success, exchanged identifiers, or an added result case. Derive expected results from the confirmed contract.

Read the types beside their calls. Can a reader explain each value's role? Do branches match real alternatives? Do consumers repeatedly reconstruct rules from keys, positions, or flags? Use the project's applicable checker and runtime methods for the properties each can establish. Follow the current workflow's verification responsibilities.

Proceed when important uses have a concrete explanation, guarantees have proportionate evidence, and remaining tradeoffs are explicit.

## Deliver the result

Match the requested endpoint. Save the model's meanings, key calls, guarantee locations, and consequential open questions in the project's established materials. For existing models, include the cause, complete target, old-to-new mapping, and coherent migration batches from [Existing models](./references/existing-models.md).

For an authorized implementation, migrate types with their producers and consumers, update affected checks and documentation, and remove obsolete internal paths after cutover. A design request finishes with an implementable design. An analysis request finishes with supported conclusions.

Finish when the agreed scope is complete and a successor can explain the model, use its operations, and find the basis for its guarantees.

## Specialist guidance

Use these references when the question needs their detail. The type choices remain part of this process.

- Conflicting concepts or business rules: `domain-driven-design`.
- Module responsibilities, interfaces, or dependencies: `code-design`, especially `approaches/data-modeling.md` and `interfaces.md`.
- Historical choices or continuing causes: `thinking-method` at `references/why.md`. Competing failure explanations: `diagnose`.
- Consumers, stored data, deployment, or recovery impact: `blast-radius`.
- Transition history, concurrency, or temporal properties: `statechart`.
- Quality judgment or checker settings: `code-quality`. Creating or maintaining a verification method: `create-verification`.
- Language or library details: `python-engineering`, `msgspec`, or the corresponding language's guidance.
