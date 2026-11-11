---
name: statechart
description: Model stateful behavior, explain statecharts, check properties with TLA+/TLC, and relate counterexamples to implementation.
disable-model-invocation: true
metadata:
  version: "1.0.0"
---

# Statechart

Turn stateful behavior into an explicit model, express its promises, choose a proportionate check, and show the result in the reader's language. Use this Skill on an explicit request for state modeling, state-interleaving checks, or model maintenance. Ordinary design or review can suggest it when useful.

Simple questions can finish with a transition description, small diagram, and concrete walkthrough. TLA+/TLC supplies the complete executable path when searching interleavings or progress matters.

## 1. Define the question

Read the request, rules, existing models, relevant code, and observations. Name the reader's decision and whether the model describes intended behavior, current code, or one observed run. Keep requirement sources, implementation facts, and modeling assumptions identifiable.

Identify initial conditions, actors, state ownership, external events, and promises. Show conflicting rules through the concrete path whose meaning the decision owner must resolve. For example, a timeout can end local waiting while an external operation later succeeds.

Proceed when the question, subject, rule sources, and expected result are clear. Tie each missing fact to the judgment it affects.

## 2. Build the model

Read [Modeling](./references/modeling.md) when building or extracting behavior. Define control states and relevant data, initial states, events, guards, updates, external effects, and rejected, ignored, or deferred inputs. Retain versions, request identities, owners, in-flight work, and known external outcomes wherever they affect a property.

Separate request dispatch from result delivery. Justify each atomic action using the actual synchronous, lock, transaction, or protocol boundary. Preserve interleavings across suspension and other externally visible boundaries. For hierarchy or parallel regions, specify entry, exit, shared events, coupling, and cross-region guards. Ground queueing, priority, history, timers, and run-to-completion in the chosen system's semantics.

Proceed when relevant events have explicit meanings, the abstraction preserves each property's required information, and concrete normal and boundary paths can be followed.

## 3. State the promises

Read [Properties](./references/properties.md) when expressing or reviewing properties. Write each promise in natural language, then choose its semantics: a state invariant, an action property, a safety condition, or a liveness condition. State environmental response and scheduling assumptions for progress.

Distinguish unintended deadlock, legal termination, and waiting for external input. Guard any legal terminal keep action by its actual condition. Check that critical actions and property antecedents are reachable. Change a promise only with current requirement evidence.

Proceed when each property has a meaning, source, conditions, and expression location, with appropriate safety, liveness, and deadlock checks.

## 4. Choose the check

Read [Checking](./references/checking.md) when selecting a method or interpreting coverage. Use manual paths for small rule questions, existing stateful tests for generated implementation operations, an independent model for interleaving search, a model-based driver for real-code comparisons, or trace conformance for recorded observations.

For TLA+/TLC, read [Run TLC](./references/tlc.md) and all four example files linked there. Preserve finite domains, environment assumptions, properties, tool versions, commands, constraints, reductions, and full output. Record completed search, violation, interruption, configuration error, and skipped or undecided properties according to actual results. Preserve a concrete tool error with the missing capability and continue the available analysis.

Proceed when the requested check has an outcome tied to its exact model, configuration, and explored scope, or a specific blocker and continuation owner.

## 5. Show the result

Read [Views](./references/views.md) when drawing or interpreting a statechart. Supply editable Mermaid source using reader-facing labels. Identify it as a model summary, reachable-state projection, or actual counterexample path. Explain each important guard, mark, and omitted edge.

Preserve distinctions between satisfying and violating states that share a label. Retain joint conditions across parallel regions. Validate a claimed path against concrete underlying states. Report actual counterexample numbers, actions, key values, and the first violation; for liveness, include the infinite continuation.

Proceed when the reader can judge the behavior, locate the decisive state or cycle, and trace the view to its model and check record.

## 6. Connect to implementation

Read [Implementation correspondence](./references/implementation.md) for existing code, counterexample replay, or model maintenance. Locate each relevant action's entry, reads, guards, writes, external outcomes, and permitted schedule. Define the state projection, stuttering steps, and any multi-step correspondence, with grounds for hiding intermediate states.

Replay a counterexample under authorization when assessing real behavior. Distinguish a model defect, implementation problem, intentional difference, and unresolved correspondence. Keep code analysis, executed replay, and model output identifiable. For model maintenance, inspect moved operations, new state writers, protection scope, transactions, and message rules. Bind synchronization records to the code version and working-tree changes actually checked.

Proceed when the result has a supported classification and next necessary action. Product changes follow the current request's permission.

## Deliver

Provide the question, subject, rule basis, environment assumptions, state model, properties, editable view, chosen check, result, counterexample, implementation relation, omitted scope, and unresolved decisions as applicable. Executed checks include artifacts, versions, commands, bounds, and original evidence. Keep persistent models and rerun instructions in the target project's established locations, separate from temporary runs.

Finish when the next reader can find the evidence, understand the judgment, and continue the authorized work. Optional deeper guidance includes `ddd` for business rules, `system-architecture` for authority and guarantees, `code-design` for representation, and `code-quality` for quality judgment.
