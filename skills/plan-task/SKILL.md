---
name: plan-task
description: Use when the user asks how to change something and how to verify it. Read before looking through the project, even for a one-setting change. Also use to make or revise a task plan, judge a split, or identify work that can proceed independently.
metadata:
  version: "1.0.1"
---

# Plan a task

Give the person taking over a plan they can act on. Start with the requested outcome, who will use it, what must keep working, and where this assignment ends. Reuse decisions already made. A request to carry out the next step of a settled plan belongs to execution.

## Find what can start

For a change to an existing system, start a short list of the affected public operations. Fill in their acceptance cases as you trace them to the decisions they share or override. Consult a working usage example for the setup. Once each case can distinguish the requested change from a regression, hand over the plan. An inventory of files, implementation code, or a proposed test suite is rarely the missing part.

What can the recipient do with the materials already in hand? Read a settled rule where it lives. For every proposed wait, name the first action that would give a wrong result without the missing input. Put the wait there: starting, checking, and releasing can require different things. If an open decision changes the promised outcome, identify its owner and the work it holds up. Plan the settled work. If the task is to investigate feasibility, end the investigation at the observation that lets the recipient choose a route.

## Choose the units

Try the whole task as one unit first. Read [Break down the work](./references/breakdown.md) when judging or changing a work boundary, including when the user asks whether to keep an existing split. If the question is just whether existing units can proceed independently, go straight to [Mark optional parallel work](./references/fan-out.md). Use that reference whenever marking such a group in a plan. For a local question, return the decision about those units and the reason.

For each necessary handoff, name the result, its recipient, and how to tell it is usable. Walk back from final use: if a unit silently omitted an item or supplied the wrong one, how would the recipient notice? Check the finished result against the original inputs or another independent source of the expected result. A comparison with the handoff alone can reproduce its mistake.

## Hand over the check

For an engineering plan, hand over concrete cases in prose. Use public operation names, actual setting values, and observable outcomes. Keep shell scripts and output-parsing expressions for requests that need runnable code. Identify the build and the object under test before the first operation that uses them. For example: “Register a device named bench. Save the enrollment handle returned by registration. Suspend the device by that handle using the same build.” A display name identifies the example to the reader; subsequent actions take the identifier their interface accepts.

- **State-changing operations:** Give each entry point its own row: starting state → preview if offered → actual change → state that stays fixed. Choose a starting state in which this entry must act. If it has to preserve selected items, put a protected item and a matching control in that row. Verify that both would be reached without protection. After the last setup step, record the before-state of everything the comparison uses. Derive each row's expected changes from that operation's contract, even when other entries share its implementation. An option that suppresses one effect may leave the others active.
- **Settings change:** Use a row or sentence for each affected mode and setting: input, default result, result with an explicit override. Compare with a plausible wrong default. Hold other settings fixed. Where two limits can bind, use a separate input that crosses each one first; specify the exact items retained and omitted under the applicable unit of measurement. Check each hard limit just outside its range with the other arguments valid. An unchanged interacting setting supplies a check, not another design choice.

Before handing over shared implementation work, read the cases as the recipient would: can they obtain every input from that setup, reach the action, and tell a correct change from a wrong one or no change? For read-only checks, reuse one setup when it still supplies all the observations. Include further cases only when they distinguish a separate promise.

A small plan can fit in one paragraph. Suppose a queue's default batch grows to six and its bulk mode must keep taking twenty. With twenty-one labeled jobs, reset the queue before each observation. The default takes jobs 1–6, an explicit batch of two takes 1–2, and bulk takes 1–20. Trying bulk on just six jobs would also pass if both modes accidentally used the new default.

## Revise a plan

Write a patch to the old plan, using its unit names. Carry forward accepted results with their evidence. For each affected unit give the changed action, what can proceed now, and the fact that releases its wait. Retire or narrow any parallel annotation that depended on the old state.

Keep the original deliverables, acceptance rules, and release conditions at every handoff. A new input problem justifies checking the missing fact at its source. It does not by itself create an extra release route, a deadline, or a new property that otherwise valid inputs must satisfy. Include a decision for the user only when the actual request or new evidence makes the original commitment undecidable. For the last handoff, check both directions: a complete result in the original format passes; a result missing an agreed item fails, even with extra calculations attached.

Use the project's existing plan format and location. Finish when the recipient can identify the next action and judge the result of the whole task. Tickets, assignments, and releases follow the user's separate instructions.
