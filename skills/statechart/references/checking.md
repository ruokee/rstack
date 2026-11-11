# Choose a check

Read this when choosing a method or interpreting its coverage. Match the checked object and exploration method to the conclusion the reader needs. Use the least costly method that supplies that evidence.

## Walk through a small model

Use a state description, transition list, and small diagram to clarify a simple flow. Input is the stated rules and initial conditions. Apply a concrete normal sequence and the boundary sequence that could change the decision. Output is the resulting states, accepted or rejected events, and unresolved rule choices.

A path that violates a confirmed rule is a counterexample to those modeled rules. Manual exploration covers the paths actually followed. Preserve them so another reader can repeat the reasoning. Start with [Modeling](./modeling.md) and [Views](./views.md).

## Generate operations against code

Stateful property testing generates sequences of operations and executes the implementation. Input includes operation generators, preconditions, initial setup, and an independent oracle or abstract state. Compare observable results after the relevant operations. On failure, shrinking seeks a smaller failing sequence.

Use an existing project framework such as Hypothesis state machines or fast-check commands when it fits. Define reset, identity, errors, and asynchronous completion using the implementation's contract. Record seeds or replay data and the actual schedule. A generated sequential command list explores concurrency only when its driver exposes and schedules the relevant interleavings.

The discriminator is an observable mismatch against the oracle. An oracle copied from the implementation can repeat its error. Sample counts and random exploration describe sampled executions.

## Search an independent model

Model checking explores the transition system supplied by the model. Input includes initial states, named actions, finite constants or domains, environment behavior, and properties. The result can be a completed search, a safety counterexample, a deadlock, a liveness counterexample, an interrupted search, or a tool/configuration error.

Use it for event interleavings, important invariants, and progress assumptions. [TLC](./tlc.md) supplies this package's complete executable path. It checks a finite explicit-state model. Other tools such as Quint or Apalache have their own exploration semantics, bounds, and result contracts; use their documented project setup when choosing them.

A complete finite search supports the configured properties over that model and its explored domain. Connect the model to real code through [Implementation correspondence](./implementation.md) when the question concerns implementation behavior.

## Drive implementation from a model

Model-based testing chooses legal model actions and translates them into real API calls or controlled actor steps. Define an action adapter, a state projection, and the comparison point. Compare the observed implementation state and outputs to what the model permits.

Input includes the model, real implementation, adapter, controllable schedule, and initial setup. Output includes a replayable operation sequence and any mismatch. Validate that the adapter executes the intended calls, that the projection preserves the property, and that the schedule crosses the real suspension or transaction boundaries. A model-only mutation exercises the model's checks. A real-code change or independent failing implementation exercises the adapter and oracle connection.

## Check an observed trace

Trace conformance asks whether an implementation observation can be explained by model behavior. Input includes ordered events, observed fields, correlation identifiers, and the state projection. Account for concurrency ordering, missing observations, stuttering steps, and model actions represented by several implementation steps.

Output is a matching path with stated observation gaps, or the earliest event or state for which no allowed match remains. Sparse logs can leave several possible model paths. Record that ambiguity and the missing observation that would distinguish them. Preserve source timestamps and ordering guarantees rather than inventing a total order from unrelated clocks.

Model-based driving explores chosen implementation executions. Trace conformance assesses the executions present in the recorded input. Both need a trustworthy model-to-observation relation.

## Record search scope

Save the candidate model and configuration, tool version, command, constants, initial conditions, environment, properties, exploration mode, constraints, reductions, completion status, and original output. Include actual state statistics and the full counterexample when available.

Interpret each outcome separately:

- A completed finite search covers the configured properties within its modeled scope.
- Resource interruption leaves a partial exploration. Report the explored portion and properties actually decided by that output.
- A property that fails early has its counterexample. Determine the status of the remaining properties from the checker output; run a separately identified configuration if more evidence is needed.
- Random simulation supplies the runs and sampled schedules actually executed.
- Syntax errors, missing tools, and invalid configurations require repair or the named missing capability before their dependent checks can complete.

State constraints and action constraints prune exploration. Record their predicates and how the tool treats boundary states, property evaluation, and deadlock at that boundary. Keep relevant boundary-state output. In TLC, states beyond a constraint can still be evaluated for invariants while exploration beyond them stops. Interpret the exact tool version and options before making a coverage claim.

Symmetry reduction needs genuinely interchangeable values and properties preserved by that interchange. TLC liveness checking has restrictions on symmetry; use an unreduced configuration for liveness unless the applicable tool semantics justify the combination. A graph projection or a TLC state-equivalence setting also needs its own explanation. Distinguish drawing fewer nodes from exploring fewer states.

## Respond to failure

Use the checker or driver's actual action order and state values. Locate the first safety violation, deadlock state, or recurrent liveness condition. Translate it into the reader's language with [Views](./views.md). For existing code, check whether the full sequence is allowed and replay it under authorization.

When a tool is unavailable, preserve the concrete error, missing capability, affected properties, and next permitted action. Continue useful rule analysis and path reasoning. Deliver them under their actual evidence type. Keep required tool execution open until the capability or an approved scope change resolves it.

Finish when the chosen check answers the requested judgment, or its specific blocker and next owner are recorded with all reachable analysis completed.
