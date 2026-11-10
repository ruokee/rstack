# Attribution

This package combines original material with adaptations of the sources below. Preserve this notice and [LICENSE](./LICENSE) when redistributing the package. Original additions and contributions adapted from MIT sources use MIT. Content adapted from Eric Evans's reference retains CC BY 4.0; the MIT grant does not replace that license. Redistributed documents containing both kinds of material retain both applicable notices.

## Domain-Driven Design Reference

Eric Evans, Domain Language, Inc., _Domain-Driven Design Reference, Definitions and Pattern Summaries_, version 2015-03. © 2015 Eric Evans.

- [Original PDF](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf).
- [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).
- [Legal code](https://creativecommons.org/licenses/by/4.0/legalcode.en), including the applicable disclaimer of warranties and limitation of liability in Section 5.

This package summarizes and reorganizes definitions and pattern explanations, adapts them into English and Chinese guidance, and supplies constructed examples. It generalizes object-oriented expressions to include functional models and qualifies statements about consistency, declarative guarantees, and events by their actual mechanisms. Original examples and additional explanations accompany these adaptations. Attribution identifies the source of the material; endorsement is a separate matter requiring permission.

Adapted definitions and pattern explanations retain CC BY 4.0 in the entry [SKILL.md](./SKILL.md) and these references:

- [discovery/knowledge.md](./discovery/knowledge.md): collaborative modeling, hands-on modelers, and learning through implementation.
- [discovery/language.md](./discovery/language.md): ubiquitous language and continuous model integration.
- [strategic/subdomains.md](./strategic/subdomains.md): core domain, generic subdomains, vision, highlighted core, cohesive mechanisms, segregated core, and abstract core.
- [strategic/bounded-contexts.md](./strategic/bounded-contexts.md): bounded contexts and coherent model use.
- [strategic/context-mapping.md](./strategic/context-mapping.md): context maps and the nine relationship patterns.
- [strategic/large-scale-structure.md](./strategic/large-scale-structure.md): evolving order, system metaphor, responsibility layers, knowledge level, and pluggable component framework.
- [tactical/identity.md](./tactical/identity.md): entities and value objects.
- [tactical/aggregates.md](./tactical/aggregates.md): aggregate roots, invariants, and controlled change boundaries.
- [tactical/behavior.md](./tactical/behavior.md): domain services and explicit operation contracts.
- [tactical/lifecycle.md](./tactical/lifecycle.md): factories and repositories.
- [tactical/events.md](./tactical/events.md): domain events and their distinction from system messages.
- [modeling/implementation.md](./modeling/implementation.md): model-driven design, separation of domain responsibilities, modules, and the eight supple-design techniques.
- [modeling/evolution.md](./modeling/evolution.md): refactoring toward deeper insight and model implementation feedback.
- [modeling/validation.md](./modeling/validation.md): observable rule assertions and coherent model expression.

The CC BY 4.0 material is supplied as-is and as-available, subject to the warranties disclaimer and liability limitation in Section 5 of its legal code. Retain the attribution, source and license links, and modification information when sharing it or further adaptations. Original contributions use the MIT grant in LICENSE to the extent they are separately copyrightable; that grant permits recipients to comply with CC BY 4.0 for the adapted material.

## MIT sources

Matt Pocock's [domain-modeling](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/domain-modeling), including its glossary and decision-record guidance, supplies active terminology exploration, edge-case discussion, code comparison, and proportionate recording. Adaptations appear in the entry, discovery references, and model evolution. Fixed directory layouts and templates have been replaced by project-specific recording conventions. Copyright (c) 2026 Matt Pocock. MIT License.

Lauren Tan's [principle-model-the-domain](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/principle-model-the-domain/SKILL.md) in pstack supplies explicit state representation and organization around domain knowledge. Adaptations appear in modeling/implementation.md, with guarantees limited to the mechanisms that establish them. Copyright (c) 2026 Lauren Tan. MIT License.

Original material and additional MIT-licensed contributions: Copyright (c) 2026 Ruokee. The full MIT terms and all three copyright notices are in [LICENSE](./LICENSE).

## Conceptual references

[Specifications](https://martinfowler.com/apsupp/spec.pdf), by Eric Evans and Martin Fowler, informs tactical/behavior.md's explanation of selection, validation, construction-to-order, and implementation choices. This package uses its own explanations and examples. The paper's code and diagrams remain in the original source.

[EventStorming](https://www.eventstorming.com/), associated with Alberto Brandolini, informs discovery/knowledge.md's optional collaborative exploration method. This package provides an original short introduction. Official illustrations, course content, and workshop material remain in their original sources.
