# Review a diagnosis

Read the original request and answer. Find the statements that could change a maintenance decision. For each, give the original claim, what the records establish, and the replacement finding. A sound decision can rest on an unsupported reason. For a prediction about removal, use comparable behavior where available and limit the finding to the tested conditions. With files or records from one condition alone, retain provisionally if appropriate, mark the effect of removal unknown, and deliver the concrete comparison that would test it.

Audit each proposed check, including alternatives such as “inspect X **or** use Y.” Name each cited sample: which group is it in, what record establishes that condition, and what other explanation still fits the result? In your findings, identify unsuitable samples and say why.

## Separate independent questions

For every proposed check, finish the sentence “This would establish …” using only what its result could distinguish. Two common questions need different evidence:

- **Who made this change?** Match three pieces of evidence: the same event, an identifiable writer, and the content it actually wrote. Verify the change against the final artifact. Check each alternative source the answer proposes against all three. Before/after artifacts plus an exit code show a change and an execution. Ordinary output counts as write evidence only if it records the actual write. Capturing another event can explain that new event. If the link for the original event is missing, report its writer as unknown.
- **What if we disable the step?** Start with a confirmed enabled/disabled pair on the same representative input. A historical writer can remain unknown. Identifying the writer for one event does not supply the missing disabled outcome. Use [Usage evidence](./usage.md) to test the proposed samples and decision rule against the required output and human rework.

Give one next step per open question. Under **To decide whether to disable it**, give the paired check and its decision rule. If authorship is also disputed, use **To identify the writer in that event** for the missing attributable record. The two checks are independent. End with those checks so a second action list cannot reverse the reasoning in the findings.

## Return the corrected finding

Give a finding that can replace the original claim and retain supported findings. If the answer predicts behavior, describe the comparison even when the current decision is to keep the asset. Specify it with the case's task, participant and artifact; proposing the check is separate from running it:

1. **Hold the requirement fixed; change the means.** The same participant does the same task on an input that calls for the required behavior in both groups. To test dropping a reminder, verify A actually receives one complete copy and B receives zero. The business requirement remains in force in both; retiring it is a separate decision for its owner. For a switchable step, verify A actually ran it and B had it disabled. Name any proposed sample that fails these conditions and explain why.
2. **Acceptance.** Extract both how the work must be done and what must be delivered from the original requirement. For each process requirement, name the record that shows the action taking place; for each output requirement, name what to inspect in the deliverable. Two signatures establish two signatures, for example, not two independent reviews. Where the process is unobserved, leave it unknown rather than substituting a count of outputs.
3. **Compare the work actually performed.** Apply the same process and output criteria to each group, then record how much a person had to add or correct in the ordinary workflow. Keep that rework as an outcome in both A and B. A sample is unusable for the comparison when its input, enabled state or another required condition was not established. If A passes and B regresses, retain A. Consider B for the tested task and model only when both pass and B adds no rework. If both fail, diagnose the common failure; with missing conditions or outcomes, retain provisionally. A single pair supports only that comparison.

For example, to check a claim that removing a rounding note would change an invoice, give the deployed model the same invoice with fractional line amounts twice. Keep the note in A and remove its only copy in B. Verify the inputs, then check each rounding operation, line amount and total against the invoice rules. The same total can hide two offsetting errors.
