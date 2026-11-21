---
name: plan-task
description: Read before investigating or drafting a requested implementation plan, including a small change and its verification. Also use to plan a non-code task, revise an existing plan, judge a split, or identify independent work.
metadata:
  version: "1.0.0"
---

# Plan a task

Give the person taking over a plan they can act on. Start with the requested outcome, who will use it, what must keep working, and where this assignment ends. Reuse decisions already made. A request to carry out the next step of a settled plan belongs to execution.

## Find what can start

Check facts that could change the arrangement. For a change to an existing system, follow the affected user operations to the decisions they share. Check which version, inputs, and public results the recipient can use to verify the change.

Distinguish a missing result from a missing decision. If B needs a result that A knows how to deliver, plan both. Name what B consumes and whether B needs it to start, to check its work, or to release it. If an open choice changes the promised outcome, identify who can decide, what they need, and which work depends on the answer. Plan the settled work. When the assignment itself is to investigate feasibility, plan the investigation through the observation that will let its recipient choose a route.

## Choose the units

Try the whole task as one unit first. Read [Break down the work](./references/breakdown.md) when judging or changing a work boundary, including when the user asks whether to keep an existing split. If the question is just whether existing units can proceed independently, go straight to [Mark optional parallel work](./references/fan-out.md). Use that reference whenever marking such a group in a plan. For a local question, return the decision about those units and the reason.

For each necessary handoff, say what will be ready, who needs it for what, and how they can tell it is usable. Place each prerequisite beside the action it limits. Work back from final use: if every unit passed its own checks, what could still fail when the results meet? Give that check a place in the plan.

## Hand over the check

For an engineering plan, deliver short acceptance scenarios in prose. Give the implementer the starting state, the public operation on the changed build, and exactly what to observe. Fixture builders and assertion code are a separate deliverable when the user asks for them. A scenario that depends on a guessed command, field, or path is not ready to hand over. Look up the public contract or describe the operation in its own terms.

Derive the cases from the promises. For each affected setting, distinguish its default behavior, a supported override, and any enforced boundary. Use inputs large enough for the default to matter. Change one setting at a time; exercise each independent limit just beyond its boundary. Check which observation would fail if that particular rule disappeared.

Walk each affected entry point as if you were the recipient. Start with the **smallest reachable state** in which it actually does the promised work. Trace setup through the real inputs, identifiers, and selection rules. Drop setup left over from another case. Take the before-state **after the last setup change**. Follow the preview when offered, then the real operation. Name both the change that proves the operation took effect and the observation that proves the preserved behavior held. If a correct implementation would fail a check, or doing nothing would pass it, fix that scenario before handing it over.

A small plan can fit in one paragraph. For example, to show ten recent events by default in a viewer: change the default count and its help text together. Open the changed viewer on a history of twelve short, numbered events. Check that the default shows the newest ten, the existing explicit count of three shows the newest three, and the full-history view still shows all twelve.

## Revise a plan

Start with the old plan and the new fact. Identify the assumption that failed and the units that depend on it. Keep their original identifiers. Carry forward accepted outputs and the evidence that still applies. Change only the affected prerequisites, handoffs, checks, or parallel annotations. Say what can resume now and exactly what would release each wait.

Read the revised plan against the original deliverable. What does one item in the finished result represent? Keep that meaning and the agreed completion test. Intermediate records may explain how to produce or check an item; they become deliverables only if the assignment calls for them. When the old plan cites a settled rule by name, carry it forward by name. A new input problem calls for the missing fact, not a new rule or a wider output.

Use the project's existing plan format and location. Finish when the recipient can identify the next action and judge the result of the whole task. Tickets, assignments, and releases follow the user's separate instructions.
