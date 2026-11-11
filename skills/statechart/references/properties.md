# Express properties

Read this when stating or reviewing what behavior must preserve. Write the promise in the reader's words, give its requirement source, then choose an expression with the right semantics.

## State invariants

A state predicate refers to one state. An invariant must hold initially and in every reachable state under the selected specification. Type invariants also detect a model that leaves its intended value domain.

In the [save example](../examples/AsyncSave.tla):

```tla
SavedTruth == saved => acknowledged = current
```

The promise is "Whenever the display says saved, the confirmed version equals the current version." The model needs both versions and the display value. Register it with `INVARIANT SavedTruth` in TLC configuration.

## Action properties

An action predicate relates the state before a step to the state after it. Unprimed variables refer to the before-state; primed variables refer to the after-state. A rule about how much a balance changes needs both values and the operation's amount.

To require confirmations never to move backward, a temporal expression can constrain each step:

```tla
AckNeverDecreases == [][acknowledged' >= acknowledged]_vars
```

Use `PROPERTY AckNeverDecreases` for that temporal formula. Explain whether a business operation maps to one model action or several. A property about the completed operation may need operation identity and intermediate state rather than a bound on every implementation microstep.

## Safety

Safety says that a bad event never happens. A violation has a finite bad prefix. State invariants express many safety requirements. Some requirements need history, such as "a released lease never writes again." Add meaningful history or ownership epochs when the present state otherwise forgets the fact needed to detect the violation. Explain the new state and update it in the relevant actions.

Keep the requirement fixed while diagnosing a failure. Revise it only with evidence that the intended promise changed. A checker failure can expose a model error, an implementation error, or a difference between the two.

## Liveness

Liveness says that progress eventually happens under stated conditions. In TLA+, `[]P` means always, `<>P` means eventually, and `P ~> Q` means that every occurrence of P is eventually followed by Q.

The save example uses:

```tla
PendingEventuallySaved ==
    (acknowledged < current) ~>
        (acknowledged = current /\ saved /\ inflight = NoRequest)
```

This promises eventual confirmation and a truthful saved display after pending content exists. It allows later edits before reaching that condition. The example permits at most `MaxVersion` edits, reliable confirmations, and one in-flight request. Its fair specification requires submission and acknowledgment to progress. With an unlimited stream of edits, this particular catch-up promise would need different assumptions or a per-version formulation.

A finite timeout in a test needs an application timing contract. An eventuality in a model supplies no elapsed-time bound by itself. A liveness counterexample is an infinite behavior, usually represented by a finite prefix and a repeated cycle or a stuttering suffix.

## Fairness

`WF_vars(A)` requires execution when a nonstuttering A step remains continuously enabled. `SF_vars(A)` also covers an action that becomes enabled infinitely often. Explain why the scheduler or environment supplies the chosen condition.

The save example's `Spec` uses weak fairness for `Submit` and `Ack`. Once edits stop, pending work makes submission continuously possible when the request slot is free. An outstanding request makes acknowledgment continuously possible. Finite editing plus those assumptions permits the system to catch up.

`UnfairSpec` retains the same initial states, transitions, and property while dropping those scheduling promises. It permits an edit followed by stuttering forever with work pending. Compare [safe.cfg](../examples/safe.cfg) with [unfair.cfg](../examples/unfair.cfg). This is the intended liveness distinction.

Apply fairness to the action whose progress the system actually guarantees. Fairness of a broad disjunction may let one branch run forever while another starves. Strong fairness can exclude realistic starvation; its use requires a corresponding guarantee.

## Deadlock

TLC's deadlock check asks whether the modeled next-state relation offers a successor. This is separate from liveness checking. The stuttering allowed by `[Next]_vars` in the temporal specification still permits temporal behaviors; TLC's enabled-successor check can report a deadlock in `Next`.

Classify a state with no work:

- A legal end or quiescent state can have a guarded `UNCHANGED vars` action.
- Waiting for input needs the environment's permitted event actions, or an explicit boundary that treats external input as outside the current check.
- An unintended nonterminal state with no enabled successor is a deadlock finding.

The save example permits `Quiescent` only when versions agree and the request slot is empty. Its display truth is checked separately. A global unconditional keep action would make every state have a successor and hide unintended deadlocks. Keep deadlock checking enabled while expressing legal stopping conditions explicitly.

To check this distinction, use a disposable model variant that disables the only progress action in a pending, nonterminal state. The checker should reach that state and report deadlock. A legitimate quiescent state should still have its guarded successor. Preserve the variant's change and actual result with the check record.

## Check reachability

Inspect the initial state, reachable event guards, and property antecedents. A model that never creates pending work can satisfy `PendingEventuallySaved` vacuously. Reach a pending state, reach a submission, and demonstrate the old-confirmation interleaving when assessing this example. A witness can be a concrete path or an authorized temporary reachability probe.

For each property, record its natural-language meaning, formula or predicate, environment conditions, and check result. Early termination can leave other configured properties undecided. Use [Checking](./checking.md) to report those outcomes and [TLC](./tlc.md) to run the complete example.
