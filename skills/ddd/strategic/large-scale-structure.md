# Organize a large model

Large-scale structure supplies a few shared concepts for understanding the roles of parts in a large domain model. Use it when people struggle to explain the whole or coordinate meaningful changes. Keep the structure grounded in actual models.

## Explain dependencies

Start with a decision people find difficult to place. Identify the knowledge it needs and the responsibilities that supply it. In a constructed example, an execution plan depends on resource capabilities, which operating policies constrain. Responsibility Layers can make these conceptual dependencies visible. Technical presentation, application, domain, and infrastructure layers describe a different division. Let actual dependencies and changes guide the domain structure. Revise a proposed layer when a meaningful concept crosses it.

A familiar comparison can help participants discuss those roles. With a System Metaphor, test the comparison against concrete cases. Calling reservations a "budget" may explain finite resources and accepted commitments. Examine release, partial use, and expiry too. Money may be a poor analogy for capacity that becomes available again after a time window. Keep the real units and rules explicit, describe the mismatch, and abandon a metaphor that creates more exceptions than understanding.

## Locate business variation

Ask who needs to change which rules, roles, or relationships. A Knowledge Level separates configurable policy from the operational objects governed by it. For example, authorized participants can configure which roles approve particular request categories; individual requests and approvals follow that policy. Use this separation when fixed code expresses the required variation poorly. Specify configurable properties, configuration constraints, the version used for each decision, and the effect of a policy change on work already in progress.

Account for the metamodel, interpretation, validation, result explanation, and version management. Small stable rules can stay in named functions. Turning every business object into configurable metadata can obscure the underlying concepts.

If variation instead involves substituting implementations across repeated uses, consider whether a mature shared domain model supports a Pluggable Component Framework. Identify stable concepts, variation points, integration duties, and meanings every component must preserve. Give compatibility and evolution an owner. Matching interfaces with conflicting interpretations still require semantic repair. Include governance and coordinated contract changes in the cost, supported by evidence from real uses.

While discovering the domain, work with concrete models. Repeated application can reveal a common core. Designing plugins before meaningful variation is understood commits the model to assumptions that later knowledge may invalidate.

## Revisit the organizing rules

Compare the organizing concepts with business cases whenever understanding changes. Keep constraints that clarify responsibilities and dependencies. Revise or remove those that distort the model. This continuing adjustment is Evolving Order.

A simple address book can already be clear with entry identity and direct record updates. It needs no overall knowledge level or plugin framework. Introduce large-scale structure for a concrete difficulty in understanding or cooperation.

Use [Subdomains](./subdomains.md) to establish modeling priorities and [Evolution](../modeling/evolution.md) to revisit a structure that new knowledge has invalidated.
