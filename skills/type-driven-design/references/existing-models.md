# Existing models

Use this branch when a model causes failures, obscures meaning, or repeatedly makes changes difficult. Establish the cause before selecting a replacement. Then complete the target design for the agreed scope before dividing the implementation into batches. For a concrete application, read the [batch import example](./worked-example.md).

## Trace the difficulty

Start with an observed failure or a specific recurring maintenance problem. Record the required behavior and its source, actual input, affected operation, and consequence. Trace values through construction, conversion, storage, restoration, and consumption. At each relevant point, identify the meaning being used, the declared representation, and the authoritative fact behind it.

Keep a working use as a control. For example, populated import success can work while zero-row success receives conflicting interpretations. Compare those paths with the same business contract.

Treat broad dictionaries, `Any`, casts, optional fields, and repeated unpacking as investigation signals. A finding needs an actual consequence within the confirmed requirements. Dynamic keys and genuine positional protocols can be correct models.

Proceed when the problem and a valid comparison path are traceable through the affected uses.

## Compare causes

Distinguish these explanations where they fit the evidence:

- The model merges concepts or permits combinations that consumers must repeatedly interpret.
- One implementation mishandles an otherwise clear model.
- A conversion loses information that the producer supplied.
- The checker cannot express or infer a relationship that runtime operations already preserve.
- The underlying information genuinely has an open or dynamic shape.

Choose observations that distinguish the leading explanations. If a reason exists before serialization and disappears afterward, inspect that adapter. If multiple consumers assign different meanings to the same empty payload, compare their branches and the outcome contract. Consider whether fixing the conversion while retaining the model resolves the original operation.

Explain the current mechanism separately from the reason the model was originally chosen. Attribute historical goals and constraints to records. Identify the protocols, callers, or stored data that keep it in use today, then judge its current fit against current requirements. Use `thinking-method` at `references/why.md` for deeper historical reasoning and `diagnose` for competing failure mechanisms.

Proceed when the proposed cause explains the failure and the working control, with important alternatives addressed. A supported decision to keep the model is a valid outcome.

## Design the whole target

Use the common process in [Type-driven design](../SKILL.md) to complete the target for all related uses in scope. Cover:

- Type meanings, identity, value equality, states, missing information, relationships, and required capabilities.
- Caller operations, valid combinations, outcomes, and errors.
- Construction, parsing, restoration, modification, and mechanisms that maintain each guarantee.
- Internal, transport, persistence, and projection boundaries, including schema ownership.
- Every old-to-new mapping, split, merge, deletion, and information gap.
- External obligations, historical reads, affected producers and consumers, and relevant resource costs.

Separate a clearer representation from a correction to business understanding and from a policy change. Carry confirmed behavior into the mapping. Historical observations alone do not establish a requirement to retain a bug.

For missing historical information, record the gap and the authoritative source needed to resolve it. Derive new values only from traceable facts. Where facts remain missing, expose that condition through the agreed error or resolution process. Defaults must have a business basis. A new required field creates no historical evidence for its value.

Proceed when the complete scoped target accounts for every affected operation and representation. New facts discovered during implementation update the affected design and batches.

## Divide by usable operations

Use `blast-radius` when tracing direct callers, dynamic uses, stored data, or deployment relationships requires more detail. Divide the target along actual dependencies. Each batch includes the relevant types, producers, consumers, and boundary conversions.

For each batch, state:

1. Its starting representation and intended target.
2. Authoritative data and responsibility for updates.
3. Producers, consumers, and conversion locations that change together.
4. Required paths that remain usable during the intermediate state.
5. Completion evidence and the old paths removed at cutover.

Switch callers together when they can share a delivery. Independent releases or live historical protocols may require a transition. Limit that transition to the real boundary, name its owner and conversion direction, and state its removal condition. A permanent external protocol adapter remains while the protocol remains.

For coexisting representations, make the authoritative writer and synchronization responsibility explicit. Assess information loss and recovery separately for code, already-written data, and external effects. Preserve the facts needed for the actual recovery method.

Proceed when every intermediate state has coherent production and consumption, and the batches reach the complete target.

## Finish the change

Under implementation permission, migrate each batch and return to its original operation. Reuse existing checks and update those whose contract changed. Compare valid inputs, meaningful boundaries, errors, state, ordering, serialization, historical restoration, and relevant cost. Static and runtime evidence cover different properties. Follow the current workflow's verification roles.

For a design-only request, provide the implementable target and batch plan. For a diagnosis-only request, provide the supported cause and necessary repair scope.

For a complete migration, finish when all scoped producers and consumers use the target, affected documentation and checks agree, obsolete types and aliases are removed, temporary conversions have reached their removal conditions, and the original problem is resolved on its actual path. Retain adapters that still serve a confirmed external contract.
