# Model behavior

Read this when building a model from rules, code, or an execution trace. Start with the judgment the reader needs. Keep the state distinctions that can change that judgment.

## Establish the subject

Name the system boundary, actors, state owners, initial conditions, external inputs, and observable effects. Mark the description as intended behavior, current implementation, or one observed execution. Attach each rule to its source and each assumption to the conclusion it affects.

A timeout illustrates why the distinction matters. A caller can stop waiting after sending a command. The remote operation can still succeed. Model local knowledge separately from the external outcome. If code reports failure while the business promise requires knowing whether the operation completed, show the send, timeout, remote completion, and late result path to the decision owner. Resolve the intended promise before changing a property.

A trace supplies an observed path. Code and protocol rules supply other allowed paths. Keep those sources identifiable when extending the model beyond the observation.

## Choose state

A model state contains control labels and relevant data. For an editor, `Dirty` alone loses the distinction between a current save and an old confirmation. Retain:

- The current content version.
- The version last confirmed by the server.
- The identity and version of each relevant in-flight request.
- The status shown to the user.
- External effects already known to have occurred.

Two states can share a label and differ on a property. Split them in the model whenever their data affects the next transition or the judgment. The reader's chart can use a [projection](./views.md).

Choose finite values when using an explicit-state checker. State why the bounds exercise the target race, which larger cases remain outside the model, and what information each abstraction removes. For example, two edits and one request suffice to express an acknowledgment of version 1 arriving after an edit to version 2. Multiple simultaneous requests require request identities and ordering rules beyond that example.

## Define transitions

For every relevant event, specify its source states, guard, state updates, external effect, and unchanged data. Cover inputs that are rejected, ignored, or retained for later processing. State who generates each event.

A small lifecycle can begin in `Pending`, accept `finish` into `Done`, and accept `cancel` into `Cancelled`. Under a chosen rule, repeated `finish` in `Done` is ignored, and `finish` in `Cancelled` is rejected. Write those choices beside the transition description. The decision owner supplies their business meaning.

Separate sending a request from receiving its result. Model a result using the actual identity, version, and protocol guarantees. A cancellation request can change local intent before the remote effect is resolved. Include timeout, duplicate delivery, or late response when the target protocol permits them and they affect the property.

Check a normal path and a boundary path with concrete values before selecting a tool. Reach the preconditions of the target property and each critical action. Read [Properties](./properties.md) to express the commitments precisely.

## Set atomic boundaries

An action represents updates that the model treats as indivisible. Justify that choice using the implementation or proposed mechanism: a synchronous handler with no reentrant access, a lock covering all relevant writers, a supported transaction, or a protocol's atomic operation. Record the mechanism and its actual scope.

Split an action where another actor can observe or change relevant state. An `await`, separate database transaction, message handoff, callback, or unlocked interval can introduce a scheduling point. A single-threaded event loop can interleave handlers across suspension.

For a constructed capacity example, capacity is 1 and requests A and B each need 1. The implementation checks availability, awaits a remote decision, then reserves. Keep a per-request program position and the checked value. This allowed sequence exposes the problem:

1. A reads available capacity 1 and passes the check.
2. B reads available capacity 1 and passes the check.
3. A reserves 1 after resuming.
4. B reserves 1 after resuming, bringing reservations to 2.

A lock covering the check through reservation can exclude this sequence. A lock covering only the final write leaves the stale check possible. A transaction must provide the needed isolation over the actual reads and writes. Use [Implementation correspondence](./implementation.md) to compare the model with those mechanisms.

## Use hierarchy

A compound state contains substates. Specify its initial child, what entering the parent initializes, and which child is active. A transition leaving the parent exits the active child and parent under the chosen semantics. Record the order of exit effects, transition effects, and entry effects that matters to the problem.

For a constructed editor convention, entering `Editing` starts in `Clean`; editing moves to `Dirty`; leaving `Editing` releases its local subscription. Reentering starts in `Clean` unless the model explicitly chooses history. These are this model's rules. Framework implementations need their own versioned semantics.

History remembers an earlier active configuration. Shallow history restores the immediate child; deep history restores nested children. Specify the initial behavior when history is empty and which data or external work survives exit. Use history only when returning to that earlier configuration matters.

An eventless transition runs when its guard becomes eligible under the chosen execution semantics. A delayed transition requires a clock or timer event and rules for cancellation and simultaneous events. Name the abstraction when elapsed time is reduced to a nondeterministic timeout event.

## Use parallel regions

Parallel regions describe simultaneously active dimensions. An editor can be `Online` in the connection region and `Dirty` in the save region. Its configuration is their joint state plus data.

Define shared event delivery, cross-region guards, and coupled updates. For example, submit requires `Online` and no request in flight. Disconnect changes connection state while preserving an outstanding request. Its later confirmation is handled using request identity and version. This choice follows a protocol that permits a late result.

When one event affects several regions, state whether all its effects form one macrostep or can interleave. A product diagram's separate regions leave that choice open until the model specifies it. Include reachable combinations and the initial state of every region.

## Choose event semantics

Record only the semantics needed by the question, with a concrete source for any adopted framework behavior:

- Event queues, ordering, and whether nested events are queued or processed immediately.
- Conflicting transitions, selection priority, and event propagation through parents.
- Internal versus external self-transitions and their entry or exit effects.
- Run-to-completion boundaries and whether external code can reenter during an effect.
- Cancellation of timers, activities, or subscriptions when a state exits.

A Mermaid diagram draws structure. The behavioral rules live in the model and its explanation. Read [Views](./views.md) for flat, compound, and parallel examples.

Finish when relevant inputs have explicit meanings, atomic boundaries have grounds, and concrete normal and boundary paths retain the information needed by each property.
