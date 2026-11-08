---
name: improve
description: Use when iteratively improving an existing artifact against a clear goal through before-and-after comparison.
metadata:
  version: "1.0.0"
---

# Improve

Improve an existing artifact against an agreed goal. Compare each candidate with the accepted version, then keep, revert, or leave the result inconclusive.

Use the host's task workflow, tools, model choices, and authorization. Choose domain methods for the actual artifact.

## Process

### 1. Define the agreement

Read the artifact, the task requirements, and the available results. Establish:

- The main improvement goal and the scope of allowed changes.
- The behavior, facts, interfaces, or other properties that must remain intact.
- How to compare results and what counts as a meaningful improvement.
- When to stop, including any agreed limits on attempts, time, or resources.

For changes to Skills, prompts, or other agent-facing guidance, read [Agent artifacts](./references/agent-artifacts.md) before choosing the comparison method.

Use measurements for measurable outcomes, behavior checks for concrete requirements, and evidence-backed comparisons for qualities that need judgment. Point to the artifact details supporting a judgment. Keep required properties separate from the improvement goal.

Resolve facts from the available material and environment. Ask the user about consequential preferences or tradeoffs that remain open. Reuse an agreement that already answers these questions.

Proceed when you can judge whether a candidate is worth keeping and identify the allowed scope and stopping conditions.

### 2. Establish the baseline

Identify the initial baseline and the current accepted version. Keep enough information to compare and restore the state owned by this work.

Observe the baseline under the agreed method, including the properties that must remain intact. Record its version, inputs, evaluation method, and relevant conditions. Reuse existing results when those conditions match.

Check that the evaluation can distinguish the outcomes that matter. Prefer existing checks and tools; add only the measurement capability the comparison needs. Preserve the original version when it already meets the goal.

Proceed when the starting point is identifiable, recoverable, and supported by comparable observations.

### 3. Choose a hypothesis

Read previous attempts and ground the next hypothesis in the artifact and evidence. Name the change, the mechanism expected to help, and the observation that would support or reject it.

Work on one explainable hypothesis per iteration. One hypothesis may require coordinated edits across several files. When revisiting an earlier attempt, identify the changed condition that makes it worth trying again.

Proceed when the candidate is concrete enough to implement and evaluate under the agreement.

### 4. Compare the candidate

Make the change within the authorized scope, using the appropriate domain methods. Load `writing-for-agents` when editing agent-facing guidance.

Compare the candidate with the current accepted version using the same method and relevant conditions. Check the required properties as well as the intended improvement. Inspect the actual artifact and results, including delegated work.

Account for noise and order effects with enough repeated or interleaved observations to support the conclusion. Keep conditions visible. When the evaluation method is wrong, record the defect, correct the method, and reassess the affected baseline and candidates on the corrected basis. Retain the original records.

Use the host's permitted execution model. Parallel attempts need independent candidate state. Evaluate a combined result before accepting it, even when its parts helped separately.

Proceed when the candidate, comparison conditions, observations, and required-property checks describe the same attempt.

### 5. Decide the outcome

- **Keep:** the agreed goal improves and the required properties hold. Make this candidate the accepted version.
- **Revert:** the candidate fails the agreement. Restore this attempt's changes while preserving other work and the original evidence.
- **Inconclusive:** the evidence is insufficient or conflicting. Preserve the candidate and uncertainty; continue from the accepted version. Identify what evidence would resolve the decision.

An unchanged result with a simpler artifact can count as improvement when simplification is an agreed goal and the relevant behavior holds. Establish that criterion before judging the attempt.

Record the hypothesis, changed artifact, comparison versions, relevant conditions, before-and-after evidence, required-property checks, and verdict in the task's existing record format. A rejected attempt is useful evidence for the next choice.

Finish the decision before starting the next iteration. If progress stalls, recheck the explanation, evaluation, and available approaches before deciding whether another attempt is worthwhile.

### 6. Finish

Stop when the goal and its confirmation requirements are met, the baseline already meets the goal, worthwhile feasible hypotheses are exhausted, an agreed limit is reached, or a concrete blocker requires a decision.

Keep the agreed success criteria. Treat a change of goal as a separate decision with a new comparison basis.

Report the retained result against the initial baseline, the supporting evidence and its conditions, important tradeoffs, and why the work stopped. State whether the goal was met or what remains short of it. Preserving the original artifact is a valid outcome.

Follow the surrounding workflow and authorization for review, commits, merges, publication, or installation.
