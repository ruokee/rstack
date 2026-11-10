# Structure

Compare a style by the relationship it changes, the problem it addresses, and the cost it adds. Styles can compose. Domain meaning, code organization, operating isolation, deployment, and team ownership each need their own boundary judgment.

## Compare styles

- Layering separates concerns and controls dependency direction, such as presentation, domain rules, and persistence. It helps contain change when those concerns vary separately. Pass-through layers add navigation and conversion cost. Layers can run in one process.
- A modular monolith deploys together while keeping explicit internal responsibilities and access rules. Local calls and transactions reduce distributed coordination. Releases and process-level resources remain shared. Per-module scaling or crash isolation needs another operating boundary.
- Services can provide independent release, resource scaling, failure isolation, or ownership. Their contracts must preserve those forms of independence. They add network latency, partial failure, data coordination, discovery, and operations. A small team can need isolation; a large team can still share a deployment. Judge the required mechanism and the ability to operate it.
- Event-driven cooperation publishes facts for downstream reactions. It can reduce producer knowledge of consumers and support independent reactions. Event meaning, duplicate handling, order, freshness, and recovery become contracts. A command asks for an action; an event reports an occurrence. Trace the business operation across both.
- A queue separates admission from execution and can retain work through consumer outages under its persistence contract. It supports long jobs and temporary bursts. Users need acceptance and progress semantics, and operators need backlog and redelivery handling. Sustained demand above capacity still accumulates work.
- CQRS separates write and read models to optimize different uses. It adds model and synchronization work, with freshness determined by the chosen mechanism. It can share a database and operate without event sourcing. Guarantee details are in [Consistency](./consistency.md).
- Pub/Sub gives each logical subscription its own delivery path. Competing consumers within a subscription can distribute that subscription's work. Fan-out increases delivery and recovery work. Subscription durability, replay, and ordering depend on the messaging contract.
- A backend for frontend, or BFF, tailors aggregation and interaction to a client. It can reduce client round trips and keep client-specific policy separate. It adds another dependency and can duplicate logic across clients. Keep shared business authority in its appropriate owner.
- A pipeline connects stages through explicit intermediate results. It helps independent processing and replacement when stage contracts are stable. The limiting stage controls sustained throughput. Buffering, serialization, partial output, and restart semantics add costs. A failed stage needs recovery appropriate to committed work.
- A plugin structure puts variable extensions behind a stable kernel contract. It supports real extension needs while adding contract evolution, loading, lifecycle, and fault-containment responsibilities. In-process plugins share process resources and failure consequences unless the runtime provides stronger containment.

Choose a combination that explains the important scenarios with affordable coordination. Internal modularization can reduce a future extraction's scope. It is one option rather than a mandatory stage before a required isolation boundary.

## Describe software views

C4 uses context for the software system and external parties, containers for applications or data stores, components for responsibilities within a container, and code for implementation detail. A C4 container is a logical application or data-store abstraction. It can be deployed in several instances or share a runtime with other applications. The [C4 container definition](https://c4model.com/abstractions/container) separates this abstraction from deployment.

Use deployment views for instances, hosts, regions, network paths, and failure domains. Use sequences for calls, waiting, unknown results, and recovery. Use state views for business progression and authority. Keep responsibility names consistent across them.

Constructed example: an order module and a billing module deploy in one application, with one database transaction coordinating a local invariant. A separately scaled reporting projection consumes committed changes. This combines a modular monolith with asynchronous read processing. The projection's independence leaves the transactional application's authority intact. Explain the actual synchronization and freshness before claiming a guarantee.

For organization and decision rights, read [Boundaries](../core/boundaries.md). For state, read [Data](./data.md). For concrete transport choices, read [Messaging](./selection/messaging.md).
