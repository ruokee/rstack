# Build a ubiquitous language

A ubiquitous language is the language of a domain model used within a bounded context in conversation, documentation, diagrams, and software. It includes actions, relationships, quantities, and rules as well as nouns. Its value comes from people using the model to explain work and discover misunderstandings.

## Define meaning in context

For an important term, state where it applies, its distinguishing properties, and an example that separates it from a nearby concept. Use enough detail to distinguish meaning. Keep translation, external names, and historical names traceable where they affect interpretation.

Check what a disagreement represents:

- Synonyms name the same concept in the same context. Select a consistent term and retain useful aliases.
- Homonyms use one word for different concepts. Name their contexts or choose more precise expressions.
- Role differences may describe different views of the same fact. Check whether rules and responsibility also differ.
- Model disagreements imply different decisions or outcomes. Compare concrete cases before settling the term.

Read current project language and relevant implementation. Treat a mismatch as something to investigate. A changed user term may reveal a changed model purpose or new knowledge. A glossary's presence provides navigation; context boundaries require evidence about meaning and actual cooperation.

## Explain cancellation

Constructed case: five units were ordered, two are confirmed shipped, and the agreement permits cancelling the remaining units. Support, fulfillment, and accounting use "cancelled" differently.

Useful definitions in this case are:

- In request handling, "cancellation request accepted" means the request has entered the agreed process. It leaves fulfillment and refund outcomes open.
- In fulfillment, "quantity cancelled" means a confirmed quantity whose remaining shipment obligation has ended. It competes with shipment confirmation for the same unshipped units.
- In accounting, "refund completed" means the required return of collected funds has been confirmed under the accounting contract.

Use verbs in the model, such as `acceptCancellationRequest`, `confirmCancellation`, and `recordRefund`, when they match the project language. Check their preconditions and effects with participants. A global `cancelled` flag collapses facts that occur at different times and have different authorities.

At the initial snapshot, the unshipped quantity is `5 - 2 = 3`. Acceptance of a request for three units still needs fulfillment confirmation. The quantity rule is `shipped + cancelled <= ordered`. Refund obligation depends on confirmed cancellation and relevant collected payment; refund completion is a separate fact.

## Connect expressions to implementation

Speak a scenario using proposed concepts and operations. Ask whether another participant can explain the same outcome from those terms. Follow the corresponding code, fields, rules, and events. If the meaning requires repeated verbal exceptions, revisit the model or its mapping.

Keep language coherent as people change software. Integrate model expressions and compare the same business examples across contributions. Automated checks can expose behavioral fragmentation. Discussion exposes differences in interpretation. The project's development process determines the integration commands and schedule.

Sales orders, fulfillment work, and accounting receivables can refer to related business activity with distinct meanings. Preserve explicit identity mappings and translations across these contexts. A common spelling alone is insufficient reason to share an internal type.

## Record decisions proportionately

Use existing authorized project locations. A glossary holds definitions, context, and useful distinctions. Put full business rules, process descriptions, and implementation decisions in their corresponding materials and link them when helpful. Create a record when there is meaningful content to preserve.

For a lasting choice, retain the decision, reason, material alternatives, and consequences. Follow the project's decision-record convention when one exists. A small update to existing material can be enough. The value is a future reader's ability to understand why the language and model have their current meaning.

Use [Domain knowledge](./knowledge.md) for evidence conflicts and [Context mapping](../strategic/context-mapping.md) for translations between independently evolving models.
