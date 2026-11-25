---
name: use-rstack
description: Use when choosing a Skill or playbook, connecting activities, or resuming work across activities. Read the relevant specialist Skill directly when the activity is already clear.
metadata:
  version: "1.0.3"
---

# Use rstack

You are the Agent responsible for understanding the request, doing the work, responding to results, and delivering the requested outcome. Use this entry to choose methods. A specialist Skill provides methods for an activity. A playbook describes how activities relate, including dependencies, choices, feedback, and completion.

This entry assumes the complete rstack Skill set for the chosen language is installed. Keep the Skill directories as siblings and preserve the whole `use-rstack` package, including its `playbooks/` public workflow directory. The relative links below work in both the source tree and that installed layout.

## Recover the request

Read the current request, effective decisions, and the context needed for the work. For continuing work, recover the existing arrangement, completed results, candidate identities, evidence, remaining scope, and permission. Reuse what remains valid.

Establish the requested endpoint and the decisions that belong to the user. Project rules, the current goal, and effective permission govern execution. Reading a method grants no additional permission.

## Choose a path

Check whether the existing method still fits the request and current conditions. Keep an applicable arrangement. When a new choice is needed:

- Use a direct operation when the work is already clear and needs no additional method.
- Read the relevant specialist Skill when one activity is sufficient. Use the navigation below to choose it, then read its full body before applying the method.
- Look for an applicable playbook when the work needs related activities. Read its body before adopting it.

## Choose a Skill

Select activities for the current request and its real dependencies. A specific playbook supplies a complete reusable sequence.

### Investigate a question

- [research](../research/SKILL.md): Gather, check, and synthesize sources systematically when the answer needs traceable evidence.
- [feature-map](../feature-map/SKILL.md): Create or update a project map from user-visible behavior to implementation entry points.
- [thinking-method](../thinking-method/SKILL.md): Work through how or why a mechanism works, an analogy, an open question, a model, first principles, hypotheses, or a reasoning difficulty.
- [teach](../teach/SKILL.md): Help the user understand a concept, mechanism, or method, including confusion that remains after an explanation.
- [diagnose](../diagnose/SKILL.md): Investigate the cause of a failure, regression, unexpected result, or conflicting observation.

### Plan a task

- [planning](../planning/SKILL.md): Form or revise a Spec that someone can implement and check.
- [plan-task](../plan-task/SKILL.md): Create or revise a plan for one task, judge a work boundary, or identify units that can run in parallel.

### Resolve a design question

- [system-architecture](../system-architecture/SKILL.md): Decide system boundaries, responsibilities, interactions, operating structure, or system-level technology choices.
- [ddd](../ddd/SKILL.md): Clarify domain meanings and business rules, choose bounded contexts, or design and evolve domain models.
- [code-design](../code-design/SKILL.md): Design code structure or improve existing interfaces, modules, dependencies, and ownership.
- [type-driven-design](../type-driven-design/SKILL.md): Design, diagnose, or evolve type models for data shapes, semantic distinctions, states, and operation contracts.
- [prototype](../prototype/SKILL.md): Answer a design or feasibility question with a disposable implementation that compares alternatives or exposes actual layout, interaction, behavior, or timing.
- [statechart](../statechart/SKILL.md): Model stateful behavior, check state interleavings, or maintain a model on an explicit user request. Ordinary design or review can suggest this method when useful.

### Check engineering work

- [engineering-principles](../engineering-principles/SKILL.md): Select relevant principles while designing, implementing, changing, or reviewing code, documentation, or configuration.
- [blast-radius](../blast-radius/SKILL.md): Trace a proposed or implemented software change to affected consumers and choose behaviors to recheck.
- [code-quality](../code-quality/SKILL.md): Judge code, tests, code designs, refactoring, or migrations, or select and configure formatting, lint, custom rules, and type checking.
- [create-verification](../create-verification/SKILL.md): Create or maintain a verification method and its supporting artifacts. Execute an existing verification plan under that plan's instructions.

### Write for the reader

- [technical-writing](../technical-writing/SKILL.md): Write, revise, or review human-facing technical documents such as READMEs, guides, references, and proposals.
- [writing-for-agents](../writing-for-agents/SKILL.md): Write Agent instructions such as Skills, `AGENTS.md`, prompts, tool/MCP descriptions, and subagent assignments.
- [wellsaid](../wellsaid/SKILL.md): Clean up expression in all output, including replies, documents, code comments, and collaboration messages.

### Improve existing work

- [reflect](../reflect/SKILL.md): Examine work sessions for reusable lessons or recurring workflow problems.
- [improve](../improve/SKILL.md): Iterate on an existing artifact against a clear goal through before-and-after comparison.
- [create-playbook](../create-playbook/SKILL.md): Turn practice into a reusable workflow, design one for a new need, or maintain an existing playbook.

## Use a playbook

Start with paths explicitly supplied in the request. Then follow pointers in loaded context and established project, workspace, or user guidance. Also check these locations, using an established explicit alternative where one exists:

- Project or workspace workflows in `.rstack/playbooks/` at the corresponding root.
- Personal workflows in `~/.agent/rstack/playbooks/`.
- Public rstack workflows in `./playbooks/`, relative to this entry in either the source or installed package.

Bound the search to known sources and the current need. Private locations are maintained independently of the installed public package.

A link to an ordinary readable Markdown workflow is enough to provide an entry. Existing navigation may describe several candidates and their applicability. Judge the content against the current request.

Keep the name, maintaining source, body path, and applicability distinct. Public content is maintained by rstack; private content is maintained by its user, project, or workspace. A personal workflow may apply across projects. A workspace workflow may apply to just one project.

If the user specified a workflow, check that specific source and body against the request and current constraints. For other candidates, choose by applicability and effective decisions. Public and private workflows may coexist under the same name. Use an established replacement relationship when one exists. Otherwise keep the source identities separate and resolve a material ambiguity with the user. Matching names alone establish no precedence.

When a default private directory has not been created, or the checked directories contain no applicable Markdown workflow, continue with specialist methods and an arrangement for this request. Read [create-playbook](../create-playbook/SKILL.md) when the requested result includes a reusable workflow or when workflow design itself needs focused work. Saving a new playbook needs a corresponding output requirement.

If a declared or explicitly supplied source fails to load, retain the concrete error and identify the choices or actions that depend on it. Pause those dependent parts until the source problem is resolved. Continue work that has sufficient independent grounds. An absent default private directory is an ordinary first-use condition. The public `./playbooks/` directory ships with this package; if it is missing, record the installation or source problem.

## Apply the method

Read the selected method and relevant project guidance. Bring in the actual object, facts, versions, permission, starting point, and completion criteria. Follow useful pointers at their stated conditions. Obtain project commands and object-specific criteria from their authoritative material.

Execute the current request under that method and the existing working conventions. Collaboration roles, message tools, and verification responsibilities come from the current environment and effective arrangements. When delegating, provide the needed context, inputs, candidate identity, and required result.

Method selection is part of the work. Continue through the authorized remaining scope after an activity ends. Revisit the choice when new facts require a different method.

## Coordinate the work

Use the following rules where the existing method or arrangement needs supplementation. Reuse equivalent arrangements and their valid results.

### Arrange the next activity

For a missing part of the arrangement, identify the next activity, its required inputs, and the result it should produce. Keep the detail proportionate to the work. Carry current values and progress in the task's existing materials; reusable playbooks hold stable relationships.

### Respond to results

Compare each material result or new fact with the goal and remaining scope. Continue, repair, or change the method as needed. Preserve valid results. When changing the arrangement, state the basis and the affected parts, including any evidence whose conditions changed.

### Preserve a pause

When an external dependency or a session boundary requires a pause, save in the existing record:

- Effective decisions.
- Candidate identities and their supporting evidence.
- Remaining work.
- Current permission.
- The continuation point and its dependency conditions.

On resumption, recover that record and compare its conditions with current facts. Reuse the valid parts and adjust the affected ones. If a workflow has changed, distinguish its new guidance from the earlier candidate, decisions, and evidence.

### Judge completion

Before delivery, match every completion condition in the current request to result evidence. Use checks appropriate to that condition and the current permission.

Judge activity completion, candidate acceptance, and request completion separately. A completed prototype can be one result within a request that also requires implementation. When the endpoint is a verified candidate, deliver that candidate. When authorized work extends beyond it, continue to that endpoint. Task status follows its own convention. Release, installation, and other consequential operations retain their own permission requirements.
