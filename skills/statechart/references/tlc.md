# Run TLC

Read this when choosing TLA+/TLC. Also read the complete [AsyncSave.tla](../examples/AsyncSave.tla), [safe.cfg](../examples/safe.cfg), [buggy.cfg](../examples/buggy.cfg), and [unfair.cfg](../examples/unfair.cfg) before running or modifying the example. Read [Properties](./properties.md) for fairness and deadlock semantics.

## Prepare the run

The example baseline is TLA+ Tools [v1.7.4](https://github.com/tlaplus/tlaplus/releases/tag/v1.7.4), using its `tla2tools.jar`. Use an installed Java runtime compatible with that release and record `java -version`. Its actual compatibility is established by running the tool.

Use Bash for the commands below. Replace the two absolute paths with the installed package directory and a new authorized result directory. `SKILL_DIR` contains `SKILL.md` and `examples/`. `RUN_DIR` holds this run's copied examples, tool, logs, and metadata. Choose a fresh result directory for each run.

```bash
export SKILL_DIR='/absolute/path/to/statechart'
export RUN_DIR='/absolute/path/to/authorized-new-run'
mkdir -p "$RUN_DIR"
cp -R "$SKILL_DIR/examples" "$RUN_DIR/examples"
```

If an existing `v1.7.4` JAR is available, set `TLA2TOOLS_JAR` to its actual absolute path. Otherwise, with download permission, obtain the fixed release inside the result directory:

```bash
mkdir -p "$RUN_DIR/tools"
curl --fail --location --max-time 120 \
  --output "$RUN_DIR/tools/tla2tools.jar" \
  https://github.com/tlaplus/tlaplus/releases/download/v1.7.4/tla2tools.jar
export TLA2TOOLS_JAR="$RUN_DIR/tools/tla2tools.jar"
```

Run from the copied examples directory. Save Java's version; each full TLC log also records TLC's version. Preserve the JAR source with the run record.

```bash
cd "$RUN_DIR/examples"
java -version 2>&1 | tee "$RUN_DIR/java-version.txt"
set -o pipefail
```

Missing Java, a failed download, or a JAR loading error leaves that dependent check blocked. Keep the actual error and required capability, then continue the model and rule analysis that is available.

## Understand the model

This is a constructed asynchronous editor. Version 0 starts confirmed and displayed as saved. `MaxVersion = 2` bounds editing. At most one request is in flight, and every acknowledgment refers to that request. The protocol permits an edit while waiting. It models reliable delivery with nondeterministic delay; fairness governs eventual execution. Loss, multiple in-flight requests, remote conflicts, and elapsed-time bounds lie outside this example.

The variables are:

- `current`, the latest local version.
- `acknowledged`, the last confirmed request version.
- `inflight`, the submitted version or `NoRequest = -1`.
- `saved`, the display's claim.

`vars` is the tuple of all four variables. `Init` sets their initial values. Each named action has a guard, primed next-state assignments, and `UNCHANGED` for values it preserves.

`Edit` increases the version and marks it pending. `Submit` fills the empty request slot when content is pending. `Ack` confirms the in-flight version and clears the slot. With `BuggyAck = FALSE`, it shows saved only when that version equals current. With `BuggyAck = TRUE`, it shows saved on every confirmation. Both variants share all other rules.

`Quiescent` preserves state only when versions agree and no request remains. Editing can still resume below the finite bound. This action represents legal inactivity; deadlock checking remains enabled.

`Next` is the disjunction of named actions. `UnfairSpec` is `Init /\ [][Next]_vars`, allowing Next steps and stuttering. `Spec` adds `WF_vars(Submit)` and `WF_vars(Ack)`. Finite edits and these weak-fairness assumptions permit pending content to catch up to a truthful saved state.

`TypeOK` constrains the domains. `SavedTruth` is a state invariant. `PendingEventuallySaved` is a leads-to temporal property. Configuration `INVARIANT` entries check state predicates; `PROPERTY` checks the temporal formula. `SPECIFICATION` chooses the fair or unfair specification. `CONSTANTS` fixes the finite edit bound and acknowledgment variant.

## Check the correct variant

Run each check block separately in Bash with errexit disabled, since the two following configurations intentionally find violations. The `PIPESTATUS` line immediately after Java's pipeline saves TLC's actual exit code. A successful `tee` alone is not the check result.

```bash
java -cp "$TLA2TOOLS_JAR" tlc2.TLC -workers 1 \
  -config safe.cfg -metadir "$RUN_DIR/safe-states" AsyncSave.tla \
  2>&1 | tee "$RUN_DIR/safe.out"
printf 'TLC exit=%s\n' "${PIPESTATUS[0]}" | tee "$RUN_DIR/safe.exit"
```

`safe.cfg` selects the fair `Spec`, `MaxVersion = 2`, and correct acknowledgment. It checks `TypeOK`, `SavedTruth`, and `PendingEventuallySaved`. Expect a completed finite search with those checks satisfied. Preserve the actual state statistics, completion message, and exit status from this run.

## Find the old confirmation

```bash
java -cp "$TLA2TOOLS_JAR" tlc2.TLC -workers 1 \
  -config buggy.cfg -metadir "$RUN_DIR/buggy-states" AsyncSave.tla \
  2>&1 | tee "$RUN_DIR/buggy.out"
printf 'TLC exit=%s\n' "${PIPESTATUS[0]}" | tee "$RUN_DIR/buggy.exit"
```

`buggy.cfg` keeps the same fair specification, edit bound, and property list while selecting `BuggyAck = TRUE`. Expect a `SavedTruth` violation. Interpret the checker's actual trace, retaining its numbering and action locations. The decisive sequence edits to 1, submits 1, edits to 2, and acknowledges 1. The reached state has `current = 2`, `acknowledged = 1`, `inflight = -1`, and `saved = TRUE`.

This early invariant failure leaves the run incomplete for properties whose checking did not finish. Record their actual status. The shared `PROPERTY` declaration is a request to check it, rather than evidence that it completed.

## Find the fairness gap

```bash
java -cp "$TLA2TOOLS_JAR" tlc2.TLC -workers 1 \
  -config unfair.cfg -metadir "$RUN_DIR/unfair-states" AsyncSave.tla \
  2>&1 | tee "$RUN_DIR/unfair.out"
printf 'TLC exit=%s\n' "${PIPESTATUS[0]}" | tee "$RUN_DIR/unfair.exit"
```

`unfair.cfg` uses the same correct acknowledgment, edit bound, invariants, and progress property as `safe.cfg`. It selects `UnfairSpec`, dropping submission and acknowledgment fairness. Expect a temporal-property violation with pending content and an infinite continuation without the required confirmation. TLC may express that continuation as stuttering or a repeated cycle. Keep the actual prefix, suffix, and version values.

The enabled actions explain the fairness gap: work can remain possible without being scheduled. Compare the fair run against this unchanged property. A deadlock is a different outcome, concerning the enabled next-state relation.

## Interpret the evidence

Keep deadlock checking on. The `-deadlock` option disables it, so omit that option for this tutorial. Each configuration has its own `-metadir`; the original package remains the source, and all generated files belong to the run directory.

Retain the model and configuration copies, Java and TLC versions, release source, commands, full output, exit status, finite constants, configured properties, search mode, and actual state statistics. Classify completed search, property violation, deadlock, interruption, and configuration error separately. If a run stops early, identify which conclusions its output supports before arranging an additional separately recorded check.

This example uses explicit-state checking with one worker and no added state constraints, action constraints, symmetry, or graph projection. If changing any of those settings, preserve their effect on coverage. Use [Checking](./checking.md) for that interpretation.

Present a [reader view](./views.md) with the actual counterexample sequence and first violation. For an implementation claim, perform the separately authorized [mapping and replay](./implementation.md). The three example runs exercise the model layer.

Finish when the selected run has a recorded outcome tied to its exact input and scope, and the reader can rerun it from the copied examples and saved command.
