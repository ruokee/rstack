---
name: ddd
description: Use when clarifying domain concepts or business rules, defining bounded contexts, designing or assessing domain models, or evolving models as domain understanding changes.
metadata:
  version: "1.0.0"
---

# Domain-driven design

Build a domain model with the people who understand and perform the work. A model selects aspects of a domain for a particular purpose. Make its language, rules, boundaries, and software expression support that purpose, and revise them as understanding grows.

## Work from a case

Establish the business problem, model purpose, participants, and context. Read available project material before asking questions. Keep business agreements, observed work, existing code, assumptions, and proposals distinct. A glossary or test records an interpretation. Resolve consequential disagreements through the relevant evidence or an authorized domain participant.

Trace a concrete case through intent, prior facts, permitted actions, decisions, outcomes, and remaining obligations. Try a refusal, boundary, or partial-completion case that distinguishes competing interpretations. Ask a question with visible consequences, such as whether the unshipped three units of a five-unit order may be cancelled after two have shipped. Keep proposed rules identified as proposals until decided.

Express the concepts, relationships, identity, quantities, time, states, and rules that change the decision. Establish where each meaning applies and who maintains each fact. Preserve different participants' scenarios, responsibilities, and evidence when they disagree.

## Shape the model

Choose boundaries by purpose, meaning, rules, and actual collaboration. Explain subdomains, bounded contexts, teams, modules, repositories, and deployment separately. Compare candidates where their consequences differ. Allocate modeling effort to the knowledge that matters for the current goal.

Give important rules an explicit domain operation or representation. State the facts an invariant covers, its responsible model element, when it must hold, and the mechanism that maintains it. Local object checks, persistence under competing writes, and external effects each require their own explanation.

Use the simplest model that expresses the confirmed contract. Object methods, immutable data with functions, and direct record maintenance can all be appropriate. A terminology question can finish with an accurate definition and discriminating examples. Introduce aggregates, repositories, events, or additional contexts for an actual rule or coordination need.

Use the same cases to connect the model to implementation and to compare revisions. Update affected language, operations, mappings, and historical interpretations. Distinguish a representation change, a correction of misunderstood rules, and a new business policy.

## Deliver the requested result

- Exploration: current understanding, concrete cases, rule sources, and questions that could change the model.
- Language: context-specific definitions, distinguishing examples, aliases or different meanings, and affected expressions.
- Strategic design: domain priorities, model boundaries, relationships, translation responsibilities, and accepted costs.
- Tactical design: identity, legal states, operations, invariants, creation, restoration, events, and guarantee conditions.
- Assessment: a concrete violation of a confirmed rule, its scenario, relevant counterevidence, and a sufficient repair direction. A sound model can receive zero findings.
- Evolution: new understanding, affected concepts, preserved behavior or policy change, migration obligations, and model consumers.

Use the current project's formats and authorized record locations. Keep the result usable by domain participants and implementers. The current task determines implementation permission; its workflow owns coordination, verification, and delivery.

## Read by question

Read the references needed for the current judgment. The topics form a knowledge set rather than mandatory stages.

### Discovery

- Finding rules in work, examples, disagreements, or existing software: [Domain knowledge](./discovery/knowledge.md).
- Clarifying terms, actions, aliases, and context-specific meanings: [Ubiquitous language](./discovery/language.md).

### Strategic design

- Choosing domain priorities and modeling investment: [Subdomains](./strategic/subdomains.md).
- Establishing where a model applies: [Bounded contexts](./strategic/bounded-contexts.md).
- Describing influence, collaboration, and translation across models: [Context mapping](./strategic/context-mapping.md).
- Making a large model understandable through shared concepts: [Large-scale structure](./strategic/large-scale-structure.md).

### Tactical design

- Distinguishing entities, values, and business equality: [Identity](./tactical/identity.md).
- Assigning invariant responsibility and consistency boundaries: [Aggregates](./tactical/aggregates.md).
- Placing behavior and expressing business conditions: [Domain behavior](./tactical/behavior.md).
- Creating, restoring, accessing, and retiring objects: [Lifecycle](./tactical/lifecycle.md).
- Representing facts, commit outcomes, and integration contracts: [Domain events](./tactical/events.md).

### Modeling

- Expressing domain operations in software: [Implementation](./modeling/implementation.md).
- Revising concepts while preserving facts and obligations: [Evolution](./modeling/evolution.md).
- Evaluating meaning and observable guarantees: [Validation](./modeling/validation.md).
