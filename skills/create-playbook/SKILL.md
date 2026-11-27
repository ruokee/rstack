---
name: create-playbook
description: Use when turning existing practice into a reusable workflow, designing a workflow for a new need, or maintaining an existing playbook. Routine execution of a workflow follows that workflow.
metadata:
  version: "1.0.2"
---

# Create a playbook

Create or maintain a reusable description of how a kind of work proceeds. A playbook connects activities through their necessary dependencies, choices, feedback, handoffs, and completion. You are the Agent doing this work. Scale the document to the actual need.

## Investigate the work

Read the requested outcome, relevant rules, existing workflows, working records, and representative results. Establish where this kind of work starts, where it ends, and what difficulty the workflow should address. Reuse effective decisions.

Choose the relevant starting point:

- For existing practice, trace what happened and why. Separate reusable decisions from one-time values and incidental ordering. Retain the conditions that made the practice useful.
- For a new need, derive necessary activities from the intended result, available capabilities, and constraints. Record design assumptions separately from observed history and confirmed requirements.
- For maintenance, read the current workflow and the feedback. Locate the affected decision, activity, or use path before changing it.

Read specialist methods when the work needs them. Use `research` for systematic evidence gathering, `thinking-method` for an unresolved reasoning problem, or `domain-driven-design` for domain meanings and rules. `reflect` can supply lessons from work records; `improve` supports comparison against an agreed improvement goal.

## Establish the working agreement

Investigate who will use the workflow, where it applies, who maintains it, and how those readers currently find methods. Read existing storage rules, directories, navigation, and authoritative project material. An applicable existing convention supplies the answer.

Choose the body location by its maintenance ownership. Reuse an established explicit location for private workflows. The default locations are:

- Personal workflows: `~/.agents/playbooks/`.
- Project or workspace workflows: `.agents/playbooks/` at the corresponding root.
- Public rstack workflows: `../use-rstack/playbooks/`, relative to this entry. Follow that repository's maintenance permission.

Create the needed private directory when first saving a workflow. Keep it independent of installed Skill packages. rstack releases update the public content; private maintainers own private updates.

Decide how a later request will reach the body. Resolve consequential gaps and tradeoffs with the user after checking available facts, such as unclear ownership, scope, or a discovery entry. Save the agreement in the current authorized materials. Obtain project commands, object-specific criteria, and executor arrangements from this environment.

## Design the activities

Work backward from the intended outcome to the inputs and decisions needed to reach it. Include an activity because it contributes to that outcome or resolves a real uncertainty. Connect the activities by their actual dependencies.

Make the following relationships clear where they matter:

- What input allows an activity to start and what result the next activity consumes.
- Which facts select a branch or require a different method.
- Who makes a human decision and where work waits for it.
- Who receives each important handoff, with what result, context, candidate identity, and evidence.
- How new information, failure, or a changed goal affects remaining work and earlier results.
- What ends this kind of work and what must survive a pause for it to resume.

Keep professional methods in their Skills and project facts in their authoritative material. Refer to a Skill by name and state when it is needed. For example, read `create-verification` when establishing or changing a verification method. Execute an existing method under its own instructions. Use `prototype` or `type-driven-design` when the actual design problem calls for that capability. Use `statechart` on an explicit user request for state modeling, interleaving checks, or model maintenance.

## Write the workflow

Write ordinary Markdown that a reader can use from its actual entry point. State applicability, starting inputs, necessary activities, choices, feedback, handoffs, and the finishing condition. Include enough context to interpret each decision and follow any required references.

Save a single-file workflow as `<name>.md`. When a workflow needs separate branch instructions or supporting files, use `<name>/playbook.md` as its entry. Link to the supporting files by relative path and say when to read them. Link directly to the entry file from navigation. Choose headings, fields, step counts, roles, and scripts for this workflow. `writing-for-agents` helps organize agent instructions and reading pointers. `wellsaid` helps clean up their expression.

Separate stable workflow decisions from the current task's values, progress, and permission. Refer to authoritative project facts so readers can obtain the applicable commands and criteria. State which operations need permission at the point where that affects use. A request to design a workflow has its own completion condition. Running the workflow's business operations requires the corresponding execution scope and permission.

### Maintain the right material

Classify feedback before editing. A general method change belongs in its Skill; a workflow change belongs in that playbook; a project fact belongs in project material; a one-run adjustment belongs in the current arrangement. Follow the permission for each affected location.

When renaming, moving, or changing workflow requirements, trace actual navigation, incoming references, and users. Update the body and affected connections together within scope. Existing tasks keep their own candidate identities, effective decisions, and valid results; assess changes against those tasks before revising their arrangements.

For a personalized public workflow, create a private version and retain the source information needed to judge later changes. Use the environment's established version-recording practice. The private maintainer decides how to incorporate future public changes. Public updates maintain public content.

## Make it discoverable

Save the body and necessary references at the agreed location. Connect them to an existing discovery entry when that entry is sufficient. A direct pointer to one workflow can suffice. Add lightweight navigation when the number of workflows or selection needs justify it.

For multiple workflows, provide names, applicability, and body paths. The enclosing navigation can state their maintaining source, ownership, and scope. Keep a name separate from its source and body identity. Where public and private workflows share a name, preserve explicit selection or an established replacement relationship. Form a source-precedence convention only when the environment needs one.

Link any new navigation from a place readers already discover. `use-rstack` can find and use the result through that pointer. Readers can also use the workflow directly under their existing working conventions.

## Check delivery

Walk the workflow from its real discovery entry. Confirm that readers can find and read the intended body and required references. Inspect activity inputs and outputs, branch conditions, feedback, handoffs, permission boundaries, pause recovery, and completion. Follow affected links after a rename or move.

Separate document inspection from execution observations. Exercise the workflow according to the current check agreement and permission. Retain concrete inputs, conditions, outputs, and findings from any actual use. Repair defects within scope and recheck the affected path.

Deliver the workflow location, its discovery entry, applicability, maintenance ownership, checks performed, and any conditions needed for use. Judge successful writing, discoverability, actual usefulness, and completion of this creation request against their respective evidence.
