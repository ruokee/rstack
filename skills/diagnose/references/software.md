# Software diagnosis

Apply the general diagnostic process to the actual software and user path. Follow project rules for tools, changes, tests, and delivery.

## Capture the symptom

Reuse the user's failure evidence and suitable existing checks. Choose the closest executable observation that distinguishes the reported failure from correct behavior: an existing test, CLI command, API request, UI interaction, trace replay, or a small temporary probe. Assert the relevant result; a successful exit can miss the symptom.

Exercise the real entry point and relevant conditions. A web or terminal failure needs observations from that interface. A lower-level check can isolate a mechanism while the original path remains the repair's confirmation target.

Improve the feedback where it matters: specificity, speed, and stability. Narrow inputs, state, versions, or paths only as far as needed to distinguish current causes. Record the load or timing changes used to expose intermittent behavior and their effect on its frequency.

## Choose evidence

- **Live behavior:** observe runtime state at the boundary where explanations predict different outcomes. Use a debugger, targeted logs, or an approved probe. Preserve timestamps, inputs, versions, configuration, and relevant state.
- **Existing traces:** preserve the original artifact, locate the failing interval, correlate events with code and state, and compare a normal case where available. Account for missing events, sampling, and clock differences.
- **Performance:** establish a comparable workload and baseline. Measure latency, throughput, resource use, and waiting time as relevant; profile the suspected cost. Separate elapsed time from active work, and preserve warmup, cache, concurrency, and sample conditions.
- **Regression history:** compare relevant changes and mechanisms. Bisect when versions, inputs, or paths can be divided meaningfully. A suspected commit identifies a change to explain; verify how it produces the symptom.

Use a temporary probe when existing signals miss the question. Scope it to one prediction, identify its output clearly, and remove or restore it after use. Instrumentation, fault injection, stress, hot changes, and production access retain their actual side effects and permission requirements.

## Follow the mechanism

Trace from the observed failure through the relevant callers, data, and state ownership. Compare what each candidate cause predicts at those boundaries. Check whether the same mechanism affects other in-scope callers or inputs. Broader repair needs its own scope decision.

Seek positive evidence for the surviving mechanism. A restart, cleared cache, or changed timeout can alter several conditions at once. Recovery after such an action leaves its causal contribution to be distinguished.

When reproduction is unavailable, use the historical evidence path and retain the missing facts in the conclusion. Tool or access failure requires trying other useful authorized observations before declaring a blocker.

## Confirm an authorized repair

Change the mechanism supported by evidence. Revert investigation-owned changes made for refuted explanations. Keep mitigation, causal confidence, and permanent repair distinct.

Reuse an effective existing regression check. Add one under the project's test permissions when it can exercise the actual failure pattern at the right layer. Confirm that its observation distinguishes the original failure from the intended result; a mock echo or a check of an internal detail can miss the consumer's problem.

Return to the original interface, triggering conditions, and expected result after repair. Also exercise the important behavior that should remain intact. Retain the before-and-after observations with their versions and conditions.

Complete the project's quality checks. Remove temporary probes and restore investigation-owned state, preserving artifacts needed for the diagnostic record. Commit order, review, integration, and installation follow the surrounding workflow.
