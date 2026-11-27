# Session evidence

## Find a recurring problem

Use the authorized project, time window, and session set. For each relevant session, compare the request with the delivered work and record where to find the decisive evidence. Look for three kinds of cost:

- **Efficiency:** What did the user have to ask for again? Which repeated action added work without bringing in new information?
- **Quality:** Which requirement did the artifact miss? For code, inspect the delivered change or the applicable acceptance result. A low review score is a reason to check the artifact.
- **Asset use:** Which instruction was available, selected, injected, read, or acted on? Identify the prompt, hook, step, or resource involved and its observable effect.

Group the same deviation across independent sessions. Report affected sessions out of eligible sessions, with evidence from failures and comparable successes. Count repeated events within one session as events: three reads in one review are three reads and one affected review. Compare what the agent did at the decision in each case. A prompt read in both a failed review and a successful one stays in place while you investigate why their actions differed.

## Locate one deviation

1. Put the original expectation next to the artifact or action actually delivered. Identify the user-visible difference and what the agent got right. Check the evaluator's claim against the artifact, command result, or acceptance rule. If they contradict the review, correct the assessment.
2. Reconstruct only the relevant steps. Identify the host, model, language, active version or file path when available. Distinguish a local file, its availability in that run, selection, injection or reading, action, and final result. A host can inject instructions without a read call. A final reply alone leaves loading unknown.
3. Locate the first observed divergence. Quote the conflicting step or deliverable and preserve what was right. For a possible later change, ask what would have recorded it. With known coverage, use the event or its absence; otherwise report the intervention as unknown. Matching outputs on either side of an unobserved interval do not establish what ran inside it.
4. Annotate each comparison with **what changed together** and **what it can decide**. An explicitly named run is evidence about behavior after selection; exclude it from natural selection rates. When more than one condition changed, the result applies to that combination. Keep their separate contributions unknown. Rank a cause only when an observation distinguishes it from its alternatives.

Choose a next check by the decision it can change. A file difference suggests a passage for comparison. Compare the original with a temporary variant that changes that passage alone, under the same loading conditions. Adopt the change only if the required behavior improves. Repeating an unchanged case can show recurrence; it does not distinguish two causes that both predict recurrence. For a selection question, use natural requests including a near miss.

## Decide what to change

For each failure, give **deviation → disposition → evidence or next check**. Choose the disposition by asking: _if the agent had followed the recorded instruction as written, would it still have produced this error?_

- **Following it produces the error.** Quote the faulty direction and connect it to the action taken. Correct that passage. Where an evaluator contradicted a correct deliverable, correct the assessment.
- **The instruction calls for the right action, or the operative wording is unknown.** Lead with “Keep [asset] unchanged; cause unresolved.” Name the correct action or deliverable to restore now. Put any proposed wording change after the smallest check that could justify it. A matched comparison that changes only the wording and restores the required behavior supports that change for the tested case.
