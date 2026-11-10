# Boundaries

Draw the system boundary around an outcome and the control available to deliver it. Include external participants whose promises, resources, or decisions constrain that outcome. A boundary states who owes what to whom.

## Allocate responsibility

Distinguish the service provider, the decision maker, the authoritative information owner, the resource holder, and the person accountable for completion. One participant can hold several roles. Separating them reveals missing authority and conflicting obligations.

For every important handoff, specify the input and its identity, acceptance conditions, promised result, completion evidence, visible progress, and exception owner. State when responsibility transfers. A sender's dispatch and a recipient's acceptance are different events. Until acceptance is confirmed, someone must own the unresolved transfer.

Constructed repair example: intake owns the customer promise and the case record. A parts coordinator confirms availability and expected arrival. A scheduler assigns ready work to a repair role. Acceptance confirms the repair result before the case closes. While parts are missing, name who tracks the case, updates the customer, and returns it to scheduling. Sending a request to a supplier leaves the customer obligation with the service unless the agreed contract transfers it.

## Separate boundary types

- A domain boundary preserves a coherent meaning and rules. Different meanings of "completed" can require translation.
- An organizational boundary allocates people, decisions, and accountability.
- An operating boundary defines independently running or failure-isolated work and resources.
- A code boundary controls representation, dependencies, and allowed access.

These can align or differ. A software module can own a domain rule within one process. Several services can still require coordinated releases. Name the independence needed: authority, release, scaling, failure isolation, or replacement.

## Choose coordination

Central coordination can make priorities, shared-resource allocation, and recovery visible. It also creates a decision bottleneck and a dependency on the coordinator. Distributed decisions reduce central waiting when participants have sufficient local information and authority. They add negotiation, conflict resolution, and risk of inconsistent commitments.

A shared capability reduces duplicated work and can centralize scarce expertise. Consumers then depend on its capacity, priorities, contract stability, and recovery. External supply can provide capability sooner while adding procurement, service commitments, data or material transfers, and exit obligations. Compare actual in-house ability, differentiation, full cost, and replacement conditions in [Decisions](./decisions.md).

## Use organizational explanations carefully

Conway's law links system design to communication structure. Use it to investigate recurring coordination and interface difficulties. The organization chart alone leaves domain meaning, physical constraints, and operating requirements unresolved.

Cognitive load includes understanding the work itself, dealing with incidental complexity, and switching between contexts. Team Topologies describes stream-aligned, enabling, complicated-subsystem, and platform teams, with collaboration, service provision, and facilitation as interaction modes. These are lenses for assigning support and reducing avoidable coordination. Their value depends on actual work and authority. Team counts and labels do not determine service boundaries.

Judge an allocation through a case: who can make the decision, who receives unfinished work, who supplies the resource, and who restores the result after a failure? Resolve gaps and contradictory ownership before treating a box on a diagram as a working boundary.
