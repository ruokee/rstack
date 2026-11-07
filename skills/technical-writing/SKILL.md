---
name: technical-writing
description: Write, revise, or review human-facing technical documents around readers' tasks, with clear structure and checked technical details.
disable-model-invocation: true
metadata:
  version: "1.0.0"
---

# Technical writing

Organize technical material so readers can complete a task, look up a fact, or understand a decision. Use this process for READMEs, tutorials, how-to guides, reference material, explanations, proposals, and technical reports. Scale the work to the requested change.

## Identify the reading task

Read the request, existing document, and relevant material. Establish the reader's goal and prior knowledge, the subject's version and status, the requested operation, and the authorized output location. Distinguish drafting, local editing, restructuring, translation, and review.

Use the context to resolve these choices. Ask only for missing information that would change the result. Keep local edits within the affected reading path. For review-only requests, deliver findings and suggested locations for changes.

Proceed when the document's purpose and the change boundary are clear. Use `writing-for-agents` for instructions whose readers are agents. Ordinary replies, commit messages, PR descriptions, and product UI text follow their own conventions; use this process when the request calls for a technical document.

## Check the technical content

Ground claims in the supplied material, implementation, specifications, and observed results. Separate implemented behavior, proposals, explanations, and recommendations. Attribute historical reasons to records that support them. Keep the subject, version, state, conditions, and evidence scope with each claim.

Check details that affect a reader's actions or judgment: prerequisites, names, parameters, types, defaults, units, input, output, limits, errors, and side effects. Resolve disagreements by checking the version, configuration, date, and subject of each source. Put unresolved facts beside the affected content, with their practical impact and the source needed to resolve them.

Reuse existing investigation. Use `research` when a specific evidence gap needs systematic source gathering or comparison. Use `thinking-method` when a mechanism or tradeoff needs analysis. Continue supported work while the affected claim awaits its missing evidence.

Proceed when key claims have sources, known conditions are preserved, and remaining gaps have a clear effect on the document.

## Arrange the content

Choose an organization from [Document types](#document-types). List what readers need for their task, then order it. Preserve an existing structure that already works.

Give first-time users the purpose, prerequisites, and shortest complete path. Give returning users stable categories and lookup points. Give decision-makers the problem, constraints, alternatives, evidence, and recommendation.

Keep one main maintenance location for each piece of content. Put short explanations beside the step that needs them and link longer independent material with descriptive text. Split files when readers, purposes, maintenance sources, or length create an actual conflict. File moves and bulk restructuring follow the current authorization.

Proceed when each section serves a clear reader need and necessary background connects to the relevant steps or claims.

## Write the document

Put conditions and prerequisites before the actions they govern. Use ordered steps for sequences. State who acts, what changes, and how readers recognize the result. Keep relevant failure branches close to the action, with the evidence readers need to choose their next step.

Use real identifiers, commands, paths, flags, and units from the material. Keep one term per concept and explain necessary aliases. Make pronouns, modifiers, alternatives, and scope unambiguous. Preserve technical meaning through translation, using natural syntax in each language.

Use the smallest complete example that demonstrates the behavior. Identify placeholders and explain replacement values before use. Label illustrative fragments and their omissions. Separate commands, expected output, and explanations. Follow the language's and project's code formatting conventions. Formal STE compliance requires the specified full standard and dictionary.

Before composing or revising prose, read `wellsaid` through the host's Skill mechanism unless its full guidance is already in context. It owns general expression and author voice. Keep technical conditions and evidence qualifications through that cleanup.

Proceed when the requested content is written and readers can connect the instructions, examples, and results.

## Check delivery

Follow the finished document in the reader's order:

1. Find the current task or fact from the entry point.
2. Check that prerequisites and conditions appear before dependent actions.
3. Compare names, commands, examples, versions, parameters, limits, and results with their sources. Give changing statistics or directory claims an applicable version or regeneration method when needed.
4. Check links, headings, code blocks, lists, tables, and diagrams in the intended format.
5. Update affected entry points, repeated descriptions, and translations within the authorized scope.

Run relevant examples and observe their results when execution is authorized and the required environment is available. Writing about an operation does not authorize executing it. Distinguish source checks, syntax or build checks, actual runs, and reader trials in the evidence. State a real execution blocker beside the affected result.

Finish when the agreed reading task is covered, key facts are accurate, and applicable conditions and remaining blockers are clear. Return the document location and checks performed, or review findings with evidence and suggested locations. Changes to other Skills, task management, delivery, and installation follow their own scope and permissions.

## Document types

Use the four [Diátaxis](https://diataxis.fr/) needs to choose the purpose of a content unit. They can guide a section or a document. Create the structure the current material needs.

### Tutorial

Help a learner gain a skill through practice. Start with the outcome and learning prerequisites. Choose one complete path, give observable results at useful stages, and explain essential concepts where they are used. Link longer background and alternative routes. Completing the exercise is an observable result; a judgment about mastery needs evidence of the learner's performance.

### How-to guide

Help a reader with relevant background complete a task. Organize by the goal, prerequisites, actions, results, and necessary branches. Link foundational setup when it lies outside the current task. Include failure handling that helps the reader choose the next action.

### Reference

Help readers look up exact details. Follow the stable structure of the interface, configuration, command, or object. Include relevant types, defaults, ranges, units, conditions, and errors. Keep version and implementation status with the facts. Use examples to clarify fields or behavior, and link tutorials or design explanations for those reading needs.

### Explanation

Help readers understand a mechanism or decision. Center one question and develop the concepts, relationships, and reasoning needed to answer it. Give relevant background, constraints, alternatives, and supported tradeoffs. Distinguish recorded decisions, the author's analysis, and current recommendations. Link procedural and interface details.

### Composite document

Organize READMEs, RFCs, design documents, and research reports around their overall purpose. A README can move from purpose to a short usage path and reference links. An RFC can move through the decision problem, constraints, alternatives, consequences, and open decisions. A research report can present conclusions, evidence, disagreements, and recommendations.

Give each section a clear purpose and keep the reading path continuous. Reuse dedicated pages where they exist. A small document can retain several needs in clearly separated sections.
