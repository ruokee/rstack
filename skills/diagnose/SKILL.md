---
name: diagnose
description: Diagnose problems and anomalies when their cause needs investigation. Use for failures, regressions, unexpected outcomes, or conflicting observations across technical and non-technical contexts.
metadata:
  version: "1.0.0"
---

# Diagnose

Investigate a specific deviation, compare explanations, and reach a causal judgment supported by evidence. Apply the process to software, devices, data, workflows, or personal practice using the field's own standards and methods.

Follow the host's workflow, tools, and authorization. For software problems, read [Software diagnosis](./references/software.md) before choosing checks. Use `thinking-method` to help analyze the current problem as needed.

## Process

### 1. Define the problem

Read the existing report, records, and constraints. Identify the object, timing, conditions, expected result, actual result, and impact. Preserve the source of the expectation, such as an agreement, rule, baseline, comparison, or user goal.

Accept the user's reported observation as a fact to investigate. Treat their proposed cause as a hypothesis. Check the records, measurement definitions, and scope used for diagnosis. A normal observation under different conditions retains those conditions.

Distinguish a change in the outcome, a change in how it is observed, and a conflict about what should happen. Establish whether the full request calls for diagnosis, recommendations, mitigation, or repair. Resolve available facts directly; ask only for missing information that changes the investigation.

Proceed when the deviation and the decision this investigation must support are clear.

### 2. Establish observations

Choose evidence paths for the actual conditions; combine them when useful:

- **Repeatable:** use a check that captures the reported symptom. Reuse suitable existing evidence. Repeat a run to resolve a specific uncertainty, and narrow the trigger enough to distinguish current explanations.
- **Intermittent or fluctuating:** preserve sample counts, occurrence counts, observation windows, and conditions. Use enough repetitions, stratification, or interleaved comparisons for the decision. One normal run adds one normal sample. Record how forced conditions change the phenomenon.
- **Historical or one-off:** reconstruct the timeline, state, original artifacts, and comparable cases. Look for traces that the competing explanations would leave.
- **People or workflows:** compare concrete events, handoffs, constraints, and participants' accounts. Attribute statements about intent to their sources; other explanations remain hypotheses.

Preserve evidence locations, times, and conditions. Check input populations, metric definitions, and observation coverage. Separate observations, interpretations, and recommendations; repeated accounts of the same record are one evidence source.

For every independent problem with quantitative evidence, record the following checks before comparing its explanations:

1. Make a field list from the source, recording what each value counts and its unit. Identify the observation unit used by each denominator. For interval records, the affected-unit count is the number of distinct intervals containing events. Keep event counts, counts of distinct affected units, and exposure in separate fields. Mark missing fields explicitly as unknown.
2. Establish which quantities the records identify by constructing different data arrangements consistent with the known fields. If a quantity changes between them, retain it as unknown. Before statistical inference, state the sampling model and the evidence supporting its assumptions. When these premises are missing, do not compute p-values, model-based probabilities, or confidence intervals. Record the gap and use descriptive quantities.
3. Evaluate each quantity separately from its required fields. Calculate an event rate as all events / exposure, including repeated events within one observation unit. Calculate an affected-unit proportion from distinct affected units / total units. Keep that proportion unknown when the distinct count is missing. Report identified quantities with units for relevant groups and the overall observation.

Proceed when the applicable measurement checks are recorded and observations support an initial comparison. Otherwise identify the next useful evidence and how to obtain it. Keep explanations provisional where essential facts are missing.

### 3. Compare explanations

Trace relevant mechanisms and changes. For each materially different explanation, state the candidate cause, how it produces the symptom, the conditions it requires, and observations that would support or contradict it. Rank explanations by the available evidence and their ability to account for the problem.

Compare affected and unaffected cases, before and after states, inputs, and waiting versus processing time. Investigate measurement differences, population changes, or shared external factors when they could explain the result.

A trigger, persistent condition, and amplifying factor may act together. Describe their relationship when the evidence supports it. Follow causal questions to observable links at the depth needed for the current decision.

Proceed when the next check addresses a specific judgment. Direct evidence may already support a conclusion.

### 4. Run discriminating checks

Before each check, state its possible outcomes and how each would change the explanations. Prefer low-cost, low-impact observations that affect the next action. Existing records, direct observations, boundary measurements, normal cases, and small experiments are all usable.

For an indirect signal, establish how the observation relates to the proposed mechanism and which alternatives could produce it. An absent record is evidence only when the observation would have captured the event.

Keep each experiment focused on an interpretable causal question. Hold important conditions comparable when varying a factor. Suspected interactions need comparisons that distinguish combined effects. Record changed conditions and adjust the conclusion's scope.

Use the available tools to obtain evidence. Check permission and impact before restarts, state clearing, production instrumentation, stress tests, or interventions involving people. Keep a recovery path for temporary changes. When ongoing harm needs immediate mitigation, act within authorization, preserve evidence that can be obtained in time, then continue investigating.

Update explanations from actual results: support, reject, retain, or add a mechanism. An explanation surviving elimination still needs positive evidence. After a change restores normal behavior, identify which conditions it actually changed, especially after a restart or reset.

Record the question, hypotheses, conditions, observations, and changed judgment in the task's existing materials. Withdraw temporary changes motivated by refuted hypotheses while preserving other work. When progress stalls or evidence conflicts, revisit the problem definition, observation method, or model.

Continue while feasible checks can materially improve the decision. Stop when the explanation is sufficiently supported for that decision, behavior is established as consistent with the agreement, remaining explanations imply the same action, essential evidence is genuinely unavailable, or an agreed investigation boundary is reached. A failed check calls for other useful methods within the current permissions. Equivalent actions can support a recommendation while the cause remains unresolved.

### 5. Deliver the diagnosis

State the original problem, causal mechanism, key evidence and conditions, and consequential open questions. Explain how multiple factors interact when applicable. Use one evidence-backed conclusion status:

- **Confirmed cause:** direct mechanism observations or discriminating comparisons explain the symptom and important conditions, and evidence weakens the main alternatives.
- **Best-supported explanation:** it fits the available evidence better than alternatives, with consequential competing causes or mechanism links still open.
- **Unresolved cause:** evidence supports multiple explanations or essential facts are missing. Name the next discriminating evidence and the concrete conditions for obtaining it.

Explain confidence through evidence and gaps. Numerical confidence requires an actual estimation basis. When domain expertise is needed, name the capability required for the remaining judgment.

Report diagnosis, recovery, temporary mitigation, and permanent repair as separate states. A diagnosis-only request ends here. If the full request includes repair, carry the causal findings and testable predictions into an evidence-backed change, then check the original use path, conditions, and important unaffected behavior. Follow the project for regression checks and delivery.

Before finishing, resolve temporary changes owned by this investigation. State what remains for continued observation and why. A blocked result includes established findings, surviving explanations, missing evidence, and access conditions so the investigation can resume.
