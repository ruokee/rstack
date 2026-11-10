# AI systems

Design around the real task and its consequences. A model generates or selects outputs from supplied context. The surrounding system determines which facts are authoritative, which actions take effect, and how work completes or recovers.

## Assign responsibilities

- The model produces an answer, classification, plan, or proposed action. Its output can vary with input, context, sampling, and model version.
- Context assembly selects instructions and evidence for the current invocation. Preserve source identity, relevant versions, and the distinction between authoritative instructions and supplied content under the actual trust model.
- Retrieval finds candidate evidence. It owns indexing, freshness, selection, and source references. The answer still needs to use the retrieved material correctly.
- Tools expose operations with explicit inputs, outputs, errors, and effects. The execution boundary applies adopted permissions and business invariants.
- Execution state records pending steps, attempts, operation identifiers, checkpoints, and recovery responsibility. Business systems own the corresponding durable facts and committed effects.
- Long-term memory retains selected information for later tasks. Define its authority, provenance, correction, expiry, and access contract. A stored summary can omit facts needed to resume an operation.
- A coordinator chooses the next step, dispatches work, joins results, and recognizes completion or stopping conditions. Give it the state and authority needed for that role.

These are logical responsibilities. A single process may own several, provided their contracts remain clear.

## Choose decision freedom

Use a fixed workflow when important transitions can be specified in advance. Individual steps can still use a model. Dynamic planning earns its cost when the task needs decisions that depend on discoveries during execution. Combine fixed business transitions with dynamic research or reasoning where appropriate.

Compare actual completion quality, latency, cost, and recovery effort. Multiple agents can separate independent work or expertise, adding coordination, conflicting proposals, shared-state races, and fan-out. A coordinator must decide how those results affect the authoritative task state.

## Separate proposals from effects

An execution service can mechanically establish requirements such as allowed operations, exact amounts, state-transition preconditions, and duplicate handling. Put each adopted invariant where the effect occurs. Prompt instructions communicate intent; effectful code needs the corresponding mechanism. Human approval, spending limits, and stop conditions come from the system's actual policy or an explicit design decision.

Constructed example: an assistant retrieves refund policy and proposes a refund. Evaluate whether its explanation cites the right policy, covers the relevant conditions, and reaches a justified conclusion. The refund operation separately needs the authorized account, exact amount, valid state, and stable business-operation identity. A fluent answer and successful tool transport leave business completion as a separate question.

If the provider times out after possibly refunding, preserve an unknown state and assign querying or reconciliation to an owner. Resume the same operation under the provider's duplicate and query contract. [Consistency](../consistency.md) explains the external-effect boundary. Recovery must account for committed effects before repeating work.

## Design execution lifetime

Track model calls, context size, tool use, concurrent work, elapsed time, and actual pricing. More steps can also increase context and fan-out, so total cost follows the calls actually made. Model routing, batching, caching, or context reduction need evidence that they preserve required quality.

Separate caller cancellation from stopping active work. Record what may still finish and how the caller discovers its outcome. Checkpoints need sufficient durable state to resume or reconcile pending effects. A restarted coordinator needs to distinguish a proposed action, a submitted action, an unknown result, and a confirmed result.

Resource and stop policies need an executor, observable state, and a defined outcome on exhaustion. Choose failure handling according to the task, such as returning a partial answer, preserving pending work, or transferring responsibility. Use [Resilience](../resilience.md) for budgets and overload behavior.

## Evaluate the complete path

Review the actual model version, prompt, retrieved material, tools, state, and effects against the task. Attribute an error to the responsible mechanism and consequence. Authorship alone leaves correctness open. Quality comparison methods are in [Evaluation](./evaluation.md); hosting and context options are in [Infrastructure](./infrastructure.md). Apply [Security](../security.md) when the task's trust or permission requirements affect the structure.
