# Break down the work

Compare doing the work in one piece with the best reason to stop partway. Who could use the intermediate result to decide something, start a dependent action, or pause a risky change in a known state? Keep a step inside its unit if separating it buys none of these things. For example, a correction to a rule and its translation can go together: the meaningful check is that a reader of either version gets the same rule.

## Choose a boundary

- For an uncertain route, name the question, an observation that would distinguish the answers, and what each answer would change. Hand that evidence to the decision maker. Keep the overall goal visible; detail the dependent implementation once the choice is settled.
- For a product change, try one complete use with fewer variations. A first import might cover one file format through to reading the saved record. Include the rejection path if invalid input could corrupt data. With an established contract, a separately usable interface can also make a good handoff.
- For a live migration, split at a state where it is safe to stop. If old records are still changing, finishing a backfill alone does not justify switching reads. Account for concurrent writes, compare actual reads, and retire the old path after its consumers move. When all callers can change together and there is no stored-data obligation, compare the cost of one coordinated change.

Choose the cut that gives useful feedback soon enough to change the next action. Weigh the work lost if an assumption fails against the cost of communicating the contract and joining the results.

## Test the boundary

For each proposed wait, ask which action consumes which result. A draft protocol may unblock client work; an operational service may be needed only for integration. Reserve an exclusive device for the check that needs it. If two units would repeatedly renegotiate the same decision, settle the common contract first or keep that work together.

Walk the recipient's complete use after all handoffs. Give integration, switchover, and removal of any temporary mechanism an owner where they are needed. Merge adjacent units when the handoff changes neither the feedback nor the ability to stop or recover.

When revising a boundary, reopen only the evidence whose inputs, behavior, or environment changed. For example, if a partner still requires the old CSV header, their reader accepting a new-format sample becomes a prerequisite for the export switch. The accepted check that historical files can be imported still stands. Return the affected boundary and its consequence to the plan.
