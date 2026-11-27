# Usage evidence

## Define a use

For the asset and time window in question, identify what the host records, which events are covered, and what made a task eligible. Choose the event that answers the question:

- **Skill:** count candidate descriptions presented, selections, and body loads separately. Separate explicit invocation from natural selection when judging discovery.
- **Bundled resource:** count reads of each resource and distinct eligible tasks that read it. Use the resource's reading condition to identify eligible tasks. A migration guide read in the only migration among many Skill invocations has coverage of 1/1 for migrations.
- **`AGENTS.md`:** identify what the host injected and in which scope. A file in the repository tells you what was available on disk.
- **Prompt:** count identifiable invocations or expansions. If both refer to the same use, count that use once.
- **Hook:** report matched events, confirmed executions and events with unknown execution status per window. Attribute an execution record to the event that produced it. For a removal decision, see “Judge the effect of disabling a step” below.
- **Playbook:** identify selection of the workflow and entry into the relevant step. A read of a linked example is a separate event.

Report counts with the unit, window, denominator, and recording coverage. Count every read for event volume and each task or session once for coverage. A zero requires records that would have captured the event throughout the period. Missing event data means unknown. If there were no eligible tasks, report that count and leave the usage proportion undefined.

Compare equivalent windows and task populations. Report absolute volume alongside covered eligible tasks / all eligible tasks. Eight uses in eight releases followed by two uses in two releases indicate fewer releases. Two uses in eight releases call for tracing what the other six did: skipped a relevant step, used another entry, or completed the work without it. Check changes in logging before interpreting a decline.

## Account for context

Report the host's measured context in separate rows: description per injection, body per load, each resource per read. Give each size, count and subtotal for the window. Add measured sizes when they vary. Without measured tokens, report bytes as bytes or give the basis of a token estimate. Billing requires billing data.

When deciding whether to skip a resource, compare the same task with and without that read. Its **additional cost** is the context that disappears when the read is skipped. The description and body cancel if both are loaded either way. Their sizes belong in the total for the full path and the reporting window. State the resource's additional cost separately.

## Judge the effect

Give the routine records their own result, even when the maintainer also supplies comparison cases. Start with one line: **Routine records: eligible coverage = …; additional resource context = …; observed task effect = …**. If the records contain reads but no task decisions, outputs or rework, fill the last field with **unknown**. Then give a separate finding for each comparison. A helpful or harmful result in one comparison belongs to that task. Harder tasks may attract more reads and fail more often.

For a decision about one resource, prefer existing comparable cases with the same task, model, host, Skill version, and other materials. Vary only access to that resource. For pruning a passage, compare the original with the same instructions minus that passage. Judge the required result, behavior to preserve, and human rework across the target models.

- **Helpful:** the material supplied a needed step or avoided a correction. Point to the specific decision and result.
- **No observed difference:** comparable work met the same requirements with similar rework. State the conditions and extra context spent. Recommend skipping or pruning only in that scope.
- **Harmful:** following the material introduced a concrete error, such as using instructions for another version. Identify the offending passage and consequence.
- **Insufficient evidence:** a read is recorded but its effect is unknown, or several conditions changed together. Name the smallest comparison that would distinguish the remaining explanations. Propose a new run only when existing evidence cannot answer the question; obtain authorization before running it.

## Judge the effect of disabling a step

Separate two questions. For **attribution in one event**, connect that input, the actual write and the final artifact. An execution record establishes that the step ran. Configuration locates a possible write channel; when a response body is missing, inspect the actual write. For **the effect of disabling the step**, compare acceptable deliverables and rework for the same task with the step confirmed enabled and disabled. Even a known author of one output leaves the result under a different configuration open.

When reviewing an existing comparison, name each proposed sample and its condition in the finding. A sample with missing execution telemetry stays in the unknown group even if its final artifact can be retrieved. Without a confirmed disabled group, keep the asset pending a comparison and specify a pair that could settle the decision.

Choose an input that calls for the step to do its job, such as an unformatted manuscript for a formatter. Use the same input, operator and other configuration. Confirm execution in A and effective disablement in B. Base the decision rule you give the maintainer on the task's acceptance conditions:

- A passes; B omits a requirement, gets it wrong or needs more human correction: retain the step and name the requirement or work it protects.
- Both pass, and B takes no more human correction: consider disabling the step in this class of tasks. Global removal still needs an account of the other eligible cases and incoming references.
- Both fail: investigate the common failure. Only B passes: locate the error introduced with the step enabled. Acceptance or rework unknown: retain provisionally and identify the missing observation.

State the rule using this task's required deliverable. Matching artifacts might share an error or conceal work someone did for the disabled group. Correct any recommendation to remove the step based on equality alone.
