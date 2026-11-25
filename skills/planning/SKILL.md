---
name: planning
description: Use when turning an idea into a concrete task, planning implementation for a chosen approach, or revising an existing task agreement. Also use when the user wants to plan now and implement later, or leave the agreement and acceptance criteria for the next session.
metadata:
  version: "1.0.0"
---

# Plan a task

As the Planner, hand over one Spec: the task agreement the Builder will implement and the Evaluator will use to judge the result. Start from the request and any existing Spec. A request to implement a settled Spec goes straight to Execute. For a request to understand a concept, use [teach](../teach/SKILL.md).

## Settle the outcome

Find the user's concrete situation, the change they want to see, and the behavior they rely on today. Check project facts yourself. For a chosen approach, check its constraints against the user's goal and carry the settled decisions into the Spec. For a reported fault, distinguish the observed result, the expected result, and what should stay the same.

When the outcome is already settled, go straight to drafting. Otherwise, if a choice would change the result, read [thinking-method](../thinking-method/SKILL.md) and use its [discuss branch](../thinking-method/references/discuss.md). Ask about the outcome before choosing how to implement it. For a complaint about clutter, pick one item: should it disappear from the default view but remain available elsewhere, or should it be removed altogether? Keep the choice in the discussion until the user settles it.

Choose a method for the question still open:

- For missing external facts, read [research](../research/SKILL.md); for an unexplained fault, read [diagnose](../diagnose/SKILL.md).
- For domain meanings, read [ddd](../ddd/SKILL.md); for system boundaries, [system-architecture](../system-architecture/SKILL.md); for code structure, [code-design](../code-design/SKILL.md); for type constraints, [type-driven-design](../type-driven-design/SKILL.md).
- When the choice depends on observing an alternative in use, read [prototype](../prototype/SKILL.md).

## Draft the Spec

Before drafting a Spec, read this package's [Spec template](./spec_template.md). Draft in the existing planning document or at the project's agreed location. Follow the template for sections, order, fields, and when to omit optional content. Keep all titles in English. Write the body in the language the user requests, or otherwise in the language they use. Set `Status` to `Draft` when drafting or revising.

Read [plan-task](../plan-task/SKILL.md) to organize the `Implementation Plan`. One named unit is enough for a single change. Give the Builder a starting point, name the result and its recipient, and cite the corresponding named user journey (`UJ` in `User Journeys`) or a specific check in `Verification`. Keep unit IDs when revising the plan.

## Check the handoff

Check the draft against the template, request, and confirmed decisions in the current session. Can the Builder start from a named unit? Can the Evaluator follow its reference and distinguish the intended result from a plausible mistake? For example, deleting archived notes would also hide them from the default view. Start with an active note and an archived note: the default shows the active one, and the archive still opens the other. Fix gaps or contradictions and recheck the affected parts.

When the agreement is clear and the handoff passes your check, save the Spec with `Status` set to `Ready`. A request to implement later defers the Builder's work. Finish the Spec in this session, confirm the saved status, and give the user its location and the unit the Builder can start with. Stop at Plan until the user authorizes execution.

## Revise the agreement

Keep the settled Spec fixed during Execute and Verify. If an implementation differs from it, the Evaluator records the discrepancy and verdict in the verification record; the Builder repairs the implementation and records progress and fixes in the execution record.

When the agreement itself changes, return to Plan. Update the body of the same Spec and append the time, previous agreement or state, and reason for the change. Keep earlier entries so past verdicts can be read against the terms in effect then. Check the revised handoff; subsequent candidates use the revised terms.
