---
name: create-verification
description: Use when creating or maintaining verification methods and their supporting artifacts. Not for executing an existing verification plan.
metadata:
  version: "1.0.0"
---

# Create verification

Build a way to answer a specific verification question, together with what someone needs to use it. The object may be software, data, documents, configuration, agent guidance, a physical device, or a working process. Scale the work to the question.

Use this process to establish a method or change what it checks, how it operates, or how it reaches a judgment. Routine execution follows the existing plan. Substituting inputs, assembling commands, or writing a temporary helper within that plan stays part of execution.

## Investigate the object

Recover the request, current requirements, relevant object version, existing decisions, available checks, tools, and permission. Establish what question the method must answer and whether the request creates a missing capability or maintains an existing one.

Resolve discoverable facts through authoritative material and available tools. Ask the user about the uncertainties that remain. Distinguish required behavior, observed behavior, and expectations that still need a decision. Identify what the existing method actually observes and where that leaves a gap.

Proceed when the question and the capability gap have concrete support in the current materials or observations.

## Establish the agreement

Propose a scope that answers the question. Explain choices that change the usefulness, cost, or meaning of the result. Resolve actual uncertainties and consequential tradeoffs with the user, including permission needed for the proposed operations. Carry forward effective decisions.

Save the agreement with the object or its owning task, using its existing conventions. Include what matters here: scope, acceptance criteria and their sources, chosen method and artifacts, lifetime, execution conditions, storage, entry point, completion criteria, and maintenance responsibility. A small task may need only a short note. Settle missing decisions before dependent construction.

Proceed when the construction scope and judgment basis are settled and someone continuing the work can recover them.

## Select the method

Choose how to obtain the relevant facts: inspect the object, exercise it, reason through a model, compare controlled conditions, or arrange human assessment. Combine methods when the question needs different kinds of evidence.

Reuse existing capabilities. Identify the missing inputs, actions, environment, observations, judgment, or instructions, then choose the smallest sufficient artifacts. A query with an explanation or a manual procedure can finish the job. Read [Method selection](./references/method-selection.md) when comparing methods, artifact roles, or lifetimes.

Proceed when the selected method can answer the question and each necessary artifact has a clear purpose.

## Build the method

Create or update the agreed instructions, programs, rules, cases, data, environment configuration, observation tools, or assessment aids within current permission. Use relevant domain guidance for the technical work. Reference commands and configuration at their authoritative locations.

Keep the inputs, expected-result sources, execution conditions, and interpretation with the method. Arrange resource ownership, result storage, and cleanup where needed. Save evidence worth retaining before temporary resources are removed.

For maintenance, read [Maintenance](./references/maintenance.md) and trace the change through the affected criteria, operations, and artifacts. Route product changes through the owning task and its permission.

Proceed when the artifacts support the agreed operations and judgments.

## Check the method

Actually use the method within the agreed scope and permission. Check that its operations work, its observations address the question, and its judgments follow from the criteria. Choose appropriate known-valid and known-invalid cases, counterexamples, controls, or human calibration. Read [Method validation](./references/method-validation.md) when deciding how to establish that the method works.

Keep model assumptions and simulated conditions with the results they support. For failures, determine whether the object violated a requirement, the method was defective, or execution conditions blocked a judgment. Repair method defects and recheck the affected path. Preserve blocked scope, its actual cause, completed results, and the condition needed to continue.

Proceed when proportionate evidence supports the method's usefulness and each result states the scope actually covered.

## Deliver the entry point

Provide the method's location, supported scope, prerequisites, operating instructions, result interpretation, and necessary maintenance information. Save the agreement, consequential choices, and method-check results where the next user can find them.

Place artifacts with their owning object or task. An object-specific Skill is useful when agents need independent discovery and conditional reading. That Skill may guide routine verification. This general Skill handles construction and maintenance.

Finish when a successor can find and use the method, interpret its conclusions, and identify any remaining conditions. Use later execution feedback as evidence for future maintenance.
