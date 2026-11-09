# Structural quality

A code smell is a symptom worth investigating. A structural finding explains which knowledge, responsibility, or dependency causes an actual cost. Check present use and confirmed changes before proposing a different shape.

## Long functions

Look for mixed abstraction levels, unrelated reasons to change, repeated state interpretation, and control flow that obscures a contract. A named extraction is useful when it gives a coherent operation a clear input, result, and responsibility.

A linear sequence, data table, flat dispatch, or necessary test setup can be long and readable. Line count alone gives no reason to split it. An extraction that makes callers reconstruct the original sequence can increase reading cost.

## Duplicated rules

Establish whether the locations express one rule with a shared authority and must change together. Independent product policies may look identical today. Derived or separately versioned representations may require generation or conformance checks rather than one runtime function.

For one rule copied into multiple callers, identify an actual disagreement or synchronization cost. Put a jointly changing rule with its responsible owner, using a shared function or declarative data when callers can share that dependency. Separately deployed consumers may need generation or explicit conformance checks, which add build or checking work. Money and protocol rules warrant careful consistency checks. Their category and occurrence count alone do not choose an abstraction.

## Primitive representations

Strings, numbers, and mappings become a problem when callers repeatedly interpret units, distinguish identities, enforce combinations, or reconstruct legal states. A wrapper is useful when its normal creation and mutation paths actually preserve the required meaning.

Check the language mechanism. Python `NewType` distinguishes uses statically; `TypedDict` describes a static mapping shape. Neither validates arbitrary runtime input. A frozen dataclass restricts normal field assignment. Nested mutable data and unchecked construction retain their own obligations. Rust field privacy can restrict construction to a module, whose constructors and mutations must still enforce the rule. Choose runtime validation according to the project's input contract.

Use a distinct value type when it prevents a demonstrated unit or identity mix-up, or an enum or record when it makes required combinations explicit. Keep checks at the responsible construction or mutation boundary. Extra types also introduce conversions and interfaces; choose them for the actual rule they enforce.

## Foreign data dependencies

Feature envy means behavior depends on another owner's internal structure or duplicates that owner's decisions. Field-access counts are clues. Public records, reports, mappings, and pure calculations legitimately consume data.

Compare the dependency and caller knowledge before and after moving behavior. Move a decision to the owner of its rule and state when that reduces internal coupling, or expose a stable query containing only the data the caller needs. A move can exchange field access for callbacks, cycles, or a larger interface.

## Change diffusion

Shotgun surgery is one conceptual change scattered across owners, creating missed-update risk. Divergent change is one module serving independent reasons to change, causing unrelated edits and interference. Establish the concept and its owner before recommending a split or consolidation.

Protocol adapters, separately deployed consumers, and different storage formats can require several coordinated changes. Bring a scattered common rule under one owner when that removes missed-update risk. Separate independent responsibilities when that reduces demonstrated interference, keeping each invariant with the state and rules that enforce it. Explain the new dependency or interface cost and which variation is inherent.

## Thin wrappers

Compare the source and public contracts for accepted values, units, precision, error categories, required cause information, ownership, and observable effects. For a coordinating interface, trace the operations and order it promises, including partial failure and cleanup. These translations and coordination duties can justify a wrapper even with one underlying implementation.

A wrapper earns its place through a useful name, translation, stable contract, lifecycle, replaceable boundary, or cross-cutting behavior. One implementation can provide any of these responsibilities.

For a suspected middleman, compare the knowledge required of every caller if it is removed. Report indirection when the wrapper adds navigation and propagation cost without an independent responsibility. Check changes to error mapping, units, ownership, and compatibility before suggesting removal.

For a demonstrated translation defect, repair the responsible mapping while preserving the public contract. For a responsibility-free forwarding layer with proven navigation cost, simplify it only after accounting for all affected callers and their contract obligations. Further boundary design can use `code-design/design-patterns/adapter.md` or `code-design/design-patterns/facade.md`.

## Unnecessary machinery

Registries, configuration, parameters, and layers need a current responsibility or confirmed variation. Explain the concrete cost of tracing, extending, or calling them. When unused variation points cause that cost, prefer the direct operation or dependency that meets current contracts. Preserve extension points required by real consumers; simplification trades speculative flexibility for less maintenance.

Dead-code claims need entry-point, registration, reflection, and dynamic-reference evidence. Comments become a maintenance issue when they contradict behavior or compensate for an avoidable structure. Public alternatives and necessary format duplication need their real consumer obligations checked.

## Repair direction

Choose the smallest change that removes the demonstrated cost. State the preserved behavior and affected callers. Transformation risks belong to [Change safety](./change-safety.md). Complete replacement structures can use code-design. The analysis result remains a finding and recommendation under the current task's permissions.
