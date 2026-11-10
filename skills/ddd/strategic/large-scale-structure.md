# Organize a large model

Large-scale structure supplies a few shared concepts for understanding the roles of parts in a large domain model. Use it when people struggle to explain the whole or coordinate meaningful changes. Keep the structure grounded in actual models.

## Let order evolve

Evolving Order lets high-level relationships develop with domain understanding. Adopt constraints that help participants understand responsibility and dependencies. Compare the structure against concrete cases as the model changes. Remove or revise a constraint when it distorts the knowledge it is meant to explain.

A small model with clear operations can already be sufficient. For example, a simple address-book context with direct record updates and explicit entry identity needs no overarching knowledge layer or plugin framework. Added structure should answer an actual question about understanding or collaboration.

## Use a system metaphor

A System Metaphor uses a familiar analogy to make roles and interactions easier to discuss. A reservation model may use a "budget" metaphor to explain a finite resource and accepted commitments. Test the analogy against releases, partial use, and expiry.

Every analogy selects some similarities. State where it stops matching the business. A money budget metaphor may distort a reusable capacity that becomes available after a time window. Retain the model's actual units and rules, and drop the metaphor if it creates more exceptions than understanding.

## Find responsibility layers

Responsibility Layers organize domain concepts by their conceptual dependencies. Constructed example: execution plans depend on resource capabilities, and those capabilities are constrained by operating policies. The layers explain why a decision needs certain knowledge and what other concepts it may depend on.

This structure differs from technical presentation, application, domain, and infrastructure layers. Follow real dependency and change patterns to choose domain responsibilities. A forced layer assignment can obscure a concept spanning the proposed strata; revise the organizing idea when that happens.

## Separate a knowledge level

A Knowledge Level describes configurable rules, roles, or relationships that govern operational objects. The operational level contains actual participants and work. A configurable approval policy might specify which roles can approve particular request categories; individual requests and approvals then follow that policy.

Use this when authorized domain participants need meaningful variation that fixed code represents poorly. Explain what they may configure, the constraints on configurations, the policy version governing each decision, and how existing work behaves after a policy change.

The cost includes a metamodel, interpretation, validation, explanation of results, and version management. A small stable rule can remain a named function. Converting every business object into configurable metadata often makes the underlying concepts harder to understand.

## Extract a component framework

A Pluggable Component Framework lets implementations participate through a mature common abstract model. It suits repeated applications of well-understood domain abstractions with real substitution needs.

State the stable concepts, variation points, integration obligations, and meanings every component must preserve. Name the owner of compatibility and evolution. A shared interface with different interpretations leaves semantic incompatibility unresolved. The framework requires governance, coordinated contract change, and evidence that the abstraction works across its actual uses.

Prefer concrete modeling while the domain is still being discovered. Repeated use can reveal a useful common core. A plugin system planned before meaningful variation is known commits the model to assumptions that later knowledge may overturn.

Use [Subdomains](./subdomains.md) to establish modeling priorities and [Evolution](../modeling/evolution.md) to revisit a structure that new knowledge has invalidated.
