# Define bounded contexts

A bounded context states where a particular model and its language are defined and applicable. Establish it from the purposes, meanings, rules, and relationships people actually use.

## Find the model boundary

Follow a real subject through different participants' decisions. Compare what the subject means, which facts matter, legal operations, lifecycle, and responsibility. Different screens or roles can be views of one model. Conflicting meanings or rules can justify separate models.

Constructed example: sales treats a customer as a buyer with ordering preferences. Settlement treats a customer as a party with billing identity and payment terms. Both can run in one process while maintaining distinct models and an explicit identity relationship. A universal `Customer` that permits settlement rules to be changed by a sales preference update mixes responsibilities.

Conversely, two repositories can implement one agreed model. Check how participants maintain language and rule consistency. Repository count records code organization. It cannot decide conceptual boundaries by itself.

For a candidate boundary, describe the model's purpose, participants, concepts, facts or decisions it owns, contact points, and unresolved ambiguities. Exercise it with cases that cross its edge. Explain how an internal change affects the other model and who maintains any translation.

## Keep the distinctions useful

A subdomain describes knowledge and activity in the problem space. A bounded context describes a model's applicability. A team is a collaboration arrangement. A module organizes implementation concepts. A repository stores development artifacts. A deployment unit determines how software operates and is released.

Explain their actual mapping. Several subdomains can be mixed in one existing model. One subdomain can have models for different purposes. One context can contain several modules and sources of change. One process can host several contexts, and a context can span deployment units.

A glossary location or a technical layer supplies clues about organization. Establish the context through meaning and rule consistency. A proposed boundary can require changing collaboration as well as code; name those costs.

## Maintain coherence

People inside the context need to keep using and refining a common model. Compare new behavior against shared cases, integrate implementation changes, and update expressions when meaning changes. Agreement requires continuing communication among domain participants and implementers.

Separate models cost translation, identity correlation, and coordinated change at their contact points. A shared model costs agreement and consistent evolution over its full scope. Compare these costs when deciding whether to separate, share a limited part, or improve the current model.

Rich domain objects and transaction scripts are both possible inside a context. Match the modeling depth to rules and actual complexity. Drawing a context boundary imposes no mandatory service, database, or class hierarchy.

## Handle an existing mixed model

Map the actual terrain first. When concepts are tangled, describe the mixed scope and known integration points. Preserve uncertainty about internal boundaries instead of drawing clean boxes unsupported by the system. A limited boundary around the mixed area can make its contact with another model explicit.

For partial cancellation, support's request acceptance, fulfillment's stopped quantity, and accounting's completed refund have different purposes and authorities. They suggest possible order, fulfillment, and settlement contexts. Check actual rules, shared model use, and cooperation before finalizing those boundaries. Even within one context, the three facts still need separate meanings.

Use [Context mapping](./context-mapping.md) to describe existing cooperation and translation, and [Subdomains](./subdomains.md) to decide which knowledge deserves deeper modeling.
