# Static review

Start at the entry the intended reader receives. Pick a task the asset claims to support and follow it to the deliverable. At a branch, ask what tells the reader to take it. At each action, check that its inputs and instructions are available before they are needed. If a sentence permits two materially different actions, describe both and say where their results diverge. For a reference, resolve the path from the referring file in the distributed package. Quote the link and give the missing path if the reader would get stuck.

## Review a repeated rule

Quote both passages. Compare when each applies, who acts, what they must do and what they must deliver. Preserve any condition or requirement unique to either passage. If both prescribe the same action, choose one owner, point the other entry to it and check that a reader starting at either entry reaches the rule in time. Explain what could drift if the copies were edited separately.

If the rules conflict, show the case in which the reader would act differently. Check which requirement governs that case. If the choice belongs to the maintainer, name the decision they need to make before consolidating the text.

Finish every finding about duplication with two separate answers. Fill in the details from the reviewed task, even when the comparison still needs to be run:

- **Two copies → one:** Name the owner, the reachable pointer and the complete requirement that survives. This checks consolidation. Both versions still tell the reader what to do.
- **One copy → zero:** Take the consolidated version as A. Make B identical except that the reader receives zero copies of the instruction. Check the entire task input for another copy before proposing B as the comparison. In the answer, specify A (one), B (zero), the same target model and representative task for both, and which actions and deliverable must match. If a model name is unknown, use the model deployed for the task. With files alone, recommend retaining A. Use [usage evidence](./usage.md) when a behavioral comparison is available.

Dropping a reminder leaves the underlying requirement in force. Retiring the requirement itself is a separate decision for its owner.
