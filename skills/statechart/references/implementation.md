# Relate the model to implementation

Read this for existing code, counterexample replay, trace conformance, or model maintenance. A model result and an implementation observation are separate evidence. Connect them through explicit action and state mappings.

## Define the relation

Record the code version and relevant working-tree changes. Locate the call entry, state owner, reads, guards, writes, external effects, and scheduling boundaries for each relevant model action. Include other writers of the same state.

Define a state projection from implementation values to model values. Identify request and version fields, durable versus local state, and observations that are unavailable. Preserve information needed by the properties. A projection that maps both old and current confirmations to "success" loses the distinction needed by `SavedTruth`.

Some implementation steps leave projected state unchanged. Those are stuttering steps at this abstraction. Several implementation steps can realize one model action when their intermediate observations and interleavings are compatible with that abstraction. Conversely, one implementation operation can correspond to several model actions when it exposes relevant intermediate states. State the relation and the guarantee that permits any hidden intermediate state.

A linearization point can justify where an operation takes effect in an abstract atomic model. Locate it using the actual synchronization or storage semantics. An `await` between a check and an update requires examining the interval and all relevant writers. Read [Modeling](./modeling.md) for a concrete over-reservation sequence.

## Replay a failure

Start from the actual model trace. For each step, record the model action, input, implementation entry, scheduling control, observed state projection, and expected model successor.

Use the real relevant runtime mechanism. Control a promise's completion, actor turn, transaction boundary, or message delivery where the implementation allows it. Preserve the requested order rather than relying on a timing sleep to happen to produce it.

A constructed save implementation can expose edit, submit, and acknowledge operations. Drive version 1 submission, edit to version 2, then release version 1's acknowledgment. Record current version, confirmed version, in-flight request, and displayed status after every operation. If the real handler sets saved unconditionally, the old-confirmation path reaches the implementation violation.

A second constructed handler can require the acknowledged request version to equal the current version before showing saved. The same delivery remains possible, but its successor stays pending. A model path demanding a saved successor is excluded by that actual guard. Correct the model's acknowledgment action and retain the guard as the reason for the discrepancy. This is model error for that implementation.

Replay a model-found sequence through all its actions before classifying an implementation bug. If one action is impossible, identify the specific guard, ownership rule, lock, transaction, or protocol fact that excludes it. A failed uncontrolled reproduction needs a better schedule or observation when it has not settled that question.

## Interpret the result

Classify the outcome with its evidence:

- A model defect uses transitions or assumptions that conflict with the intended rules or the actual implementation being modeled.
- An implementation problem has an allowed code path that violates a confirmed promise, supported by its concrete sequence and state values.
- An intentional difference identifies which subject each model describes and the decision or mechanism responsible for the difference.
- An unresolved correspondence names the missing observation or mechanism, affected conclusion, next action, and responsible owner.

For a new design, use a counterexample to revise the proposed rules or mechanism within the design authority. For existing code, preserve the finding and continue an authorized repair. Changing a property requires a current requirement basis. Keep code inspection, executed replay, and model-checker output identifiable in the result.

## Match recorded traces

Correlate requests and actors before ordering events. Translate observations through the state projection, allowing justified stuttering or multi-step mappings. Compare against model paths that satisfy the same initial conditions and environment assumptions. Preserve missing fields and partial-order ambiguity. A matching trace establishes conformance for that observed execution and mapping. Use [Checking](./checking.md) when choosing trace conformance instead of a driving adapter.

## Maintain the relation

Begin from the last code version whose correspondence was actually checked. Record its covered files, functions, state, properties, bounds, assumptions, and rerun entry. A model's latest edit commit is an investigation clue when that checked synchronization point is absent. Reestablish the relation before claiming a new synchronization point.

When covered code changes:

1. Follow moved, renamed, or split operations to their current locations.
2. Find new write paths to guarded state, including background handlers, administrative operations, and callbacks relevant to the task.
3. Compare reads, guards, value ranges, lock coverage, transactions, message ordering, and observable intermediate states against the old mapping.
4. Update the affected model, adapter, or projection from those mechanisms. Keep unchanged requirements and bounds unless their basis changed.
5. Rerun the affected checks and replay the relevant counterexample or discriminating variant under current authorization.
6. Record the checked code version, working-tree changes, updated mapping, commands, and results as the new synchronization point.

For example, moving a reservation function preserves its responsibility. Adding a direct writer or moving the capacity check outside the lock changes allowed interleavings. A passing old model can coexist with that drift. Inspect the new writer and protection interval before accepting the old model's result.

If the intended promise changes, preserve the old and new wording with the current decision evidence. If correspondence work is blocked, keep the previous checked synchronization point and name what the next owner must resolve.

## Hand off

Provide the question, modeled subject, rules, assumptions, model and diagram source, properties, selected check, actual result, counterexample, implementation relation, and next necessary action. Include commands, tool versions, bounds, and result locations for executed checks. For read-only analysis, provide the inspected code and reasoned paths under that evidence type. For a tool blocker, preserve the actual error and the affected check beside the useful completed analysis.

Put durable models in the project's established model or verification location and connect the rerun entry to its ordinary documentation.

Finish when the next reader can distinguish the outcome's evidence, find the artifacts, and continue the permitted work.
