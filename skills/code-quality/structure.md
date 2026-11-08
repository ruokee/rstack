# Structural quality

A code smell is a symptom worth investigating. A structural finding explains which knowledge, responsibility, or dependency causes an actual cost. Check present use and confirmed changes before proposing a different shape.

## Long functions

Look for mixed abstraction levels, unrelated reasons to change, repeated state interpretation, and control flow that obscures a contract. A named extraction is useful when it gives a coherent operation a clear input, result, and responsibility.

A linear sequence, data table, flat dispatch, or necessary test setup can be long and readable. Line count alone gives no reason to split it. An extraction that makes callers reconstruct the original sequence can increase reading cost.

## Duplicated rules

Establish whether the locations express one rule with a shared authority and must change together. Independent product policies may look identical today. Derived or separately versioned representations may require generation or conformance checks rather than one runtime function.

For one rule copied into multiple callers, identify an actual disagreement or synchronization cost. Compare a common owner, generated data, explicit contract checks, and the dependency introduced by sharing. Money and protocol rules warrant careful consistency checks. Their category and occurrence count alone do not choose an abstraction. For full design reasoning, read [DRY](../code-design/design-principles/dry.md) or [Rule of Three](../code-design/design-principles/rule-of-three.md).

## Primitive representations

Strings, numbers, and mappings become a problem when callers repeatedly interpret units, distinguish identities, enforce combinations, or reconstruct legal states. A wrapper is useful when its normal creation and mutation paths actually preserve the required meaning.

Check the language mechanism. Python `NewType` distinguishes uses statically; `TypedDict` describes a static mapping shape. Neither validates arbitrary runtime input. A frozen dataclass restricts normal field assignment. Nested mutable data and unchecked construction retain their own obligations. Rust field privacy can restrict construction to a module, whose constructors and mutations must still enforce the rule. Choose runtime validation according to the project's input contract.

For representation and invariant ownership, read [Data modeling](../code-design/approaches/data-modeling.md), [Object-oriented design](../code-design/approaches/object-oriented.md), or [State machines](../code-design/approaches/state-machine.md).

## Foreign data dependencies

Feature envy means behavior depends on another owner's internal structure or duplicates that owner's decisions. Field-access counts are clues. Public records, reports, mappings, and pure calculations legitimately consume data.

Compare the dependency and caller knowledge before and after moving behavior. A move can exchange field access for callbacks, cycles, or a larger interface. For encapsulation and responsibility, read [Law of Demeter](../code-design/design-principles/law-of-demeter.md), [Tell Don't Ask](../code-design/design-principles/tell-dont-ask.md), or [GRASP](../code-design/design-principles/grasp.md).

## Change diffusion

Shotgun surgery is one conceptual change scattered across owners, creating missed-update risk. Divergent change is one module serving independent reasons to change, causing unrelated edits and interference. Establish the concept and its owner before recommending a split or consolidation.

Protocol adapters, separately deployed consumers, and different storage formats can require several coordinated changes. Show which knowledge could be owned together and which variation is inherent. For responsibility and dependency direction, read [SOLID](../code-design/design-principles/solid.md), [GRASP](../code-design/design-principles/grasp.md), or [Dependency inversion](../code-design/design-principles/dependency-inversion.md).

## Thin wrappers

When reviewing a wrapper's translation of units, errors, or representations, first read [Adapter](../code-design/design-patterns/adapter.md). In OMP, use `skill://code-design/design-patterns/adapter.md`. For an interface coordinating subsystem operations, first read [Facade](../code-design/design-patterns/facade.md).

A wrapper earns its place through a useful name, translation, stable contract, lifecycle, replaceable boundary, or cross-cutting behavior. One implementation can provide any of these responsibilities.

For a suspected middleman, compare the knowledge required of every caller if it is removed. Report indirection when the wrapper adds navigation and propagation cost without an independent responsibility. Check changes to error mapping, units, ownership, and compatibility before suggesting removal.

## Unnecessary machinery

Registries, configuration, parameters, and layers need a current responsibility or confirmed variation. Explain the concrete cost of tracing, extending, or calling them. For simplicity and information hiding, read [KISS](../code-design/design-principles/kiss.md), [YAGNI](../code-design/design-principles/yagni.md), or [Deep modules](../code-design/design-principles/deep-modules.md).

Dead-code claims need entry-point, registration, reflection, and dynamic-reference evidence. Comments become a maintenance issue when they contradict behavior or compensate for an avoidable structure. Public alternatives and necessary format duplication need their real consumer obligations checked.

## Repair direction

Choose the smallest change that removes the demonstrated cost. State the preserved behavior and affected callers. Transformation risks belong to [Refactoring risk](./refactoring.md); complete replacement structures use the design method. The review result remains a finding and recommendation under the current task's permissions.
