---
name: system-architecture
description: Use when analyzing, designing, evaluating, or evolving a system's boundaries, responsibilities, interactions, or operating structure, including system-level technology choices.
metadata:
  version: "1.0.0"
---

# System architecture

Explain how interacting parts deliver a system's purpose. A system can include software, people, procedures, facilities, and external organizations. Choose structures by their operating consequences and the obligations they preserve.

## Establish the decision

Identify the system, the result it provides, the people it serves, its environment, and the scale of observation. Separate current facts, desired outcomes, hard constraints, preferences, and assumptions. Product behavior and priorities come from the current task's authoritative sources.

Follow one important scenario through participants, decisions, state changes, resources, handoffs, and external effects. For an existing system, use actual records, implementation, and operation. For a new system, derive responsibilities from the intended result. Investigate the parts that can change the decision.

Match evidence to the object:

- Software: relevant code, configuration, data contracts, deployment, and operating records.
- Services: intake, acceptance, queues, completion, rework, and complaints.
- Organizations: decision rights, actual cooperation, waiting, and responsibility transfers.
- Facilities: physical capacity, operating conditions, dependencies, maintenance, and failures.

Describe documented promises, implemented behavior, and observed operation separately when they differ. State the affected judgment and the evidence needed to resolve a consequential difference. Historical intent needs contemporary records.

## Explain the mechanism

Locate responsibility for decisions, authoritative information, resources, acceptance, and completion. Define the obligations at each important handoff, including partial completion, status visibility, and recovery ownership.

Walk the operating scenarios that could change the choice: normal work, relevant load changes, failure, recovery, and transition. Trace each system-level result to a responsibility, interaction, or shared resource. State what establishes a promised guarantee and where that guarantee ends.

Keep an important assumption beside the judgment it supports, with its scope and the consequence of its failure. Check available facts directly. An estimate includes inputs, units, time window, boundary, and formula. Label constructed examples. Check decision-changing product capabilities against primary documentation for the relevant version or date.

Compare candidates where a material tradeoff remains, including keeping the present arrangement when viable. Use the same scenarios to compare results, adoption and operating costs, risks, and future change. Recommend a choice and name its accepted cost. The user decides unresolved conflicts between goals.

## Deliver the requested judgment

- Analysis: present the current structure, important operating paths, and supported constraints. Keep uncertain causes as questions for investigation.
- Design: present the recommended structure, key responsibilities, handoff contracts, operating consequences, and tradeoffs.
- Evaluation: report a concrete violation with its premises, consequences, strongest relevant counterevidence, and repair direction. A sound proposal can receive zero findings.
- Selection: explain how each viable option meets the goal, its adoption and operating obligations, and its exit conditions.
- Evolution: explain affected boundaries, responsibility during transition, cutover conditions, and recovery or retirement.

Use the current task's format and record location. Include only the views and detail needed to support the decision. A reliable current-state account can complete an analysis request. Implementation and delivery follow the current task's scope and permission.

## Read by question

Read the references needed for the current judgment. These are knowledge topics, not a fixed workflow.

### General systems

- Establishing actual operation and its evidence: [Analysis](./core/analysis.md).
- Allocating responsibility, decision rights, and handoffs: [Boundaries](./core/boundaries.md).
- Understanding capacity, queues, rework, and feedback: [Dynamics](./core/dynamics.md).
- Tracing failure propagation and recovery responsibility: [Failure](./core/failure.md).
- Comparing choices against observable goals and costs: [Decisions](./core/decisions.md).
- Replacing capabilities while preserving obligations: [Evolution](./core/evolution.md).
- Choosing a diagram or description for the reader's question: [Views](./core/views.md).

### Software mechanisms

- Comparing styles, deployment independence, and C4 abstractions: [Structure](./software/structure.md).
- Assigning write authority, replicas, caches, and data lifecycles: [Data](./software/data.md).
- Reasoning about partial failure, time, causality, and consensus: [Distributed systems](./software/distributed-systems.md).
- Protecting invariants across transactions, duplicate delivery, and external effects: [Consistency](./software/consistency.md).
- Budgeting timeouts, retries, isolation, overload, and recovery: [Resilience](./software/resilience.md).
- Locating resource limits and evaluating capacity changes: [Scaling](./software/scaling.md).
- Handling backfill, concurrent changes, cutover, and rollback: [Migration](./software/migration.md).
- Evaluating access paths against actual security requirements: [Security](./software/security.md).

### Technology selection

- Choosing a language, runtime, or framework: [Runtime](./software/selection/runtime.md).
- Choosing transactional, document, analytical, search, vector, object, or time-series storage: [Storage](./software/selection/storage.md).
- Choosing a cache, task queue, or event stream: [Messaging](./software/selection/messaging.md).
- Choosing synchronous, asynchronous, streaming, or tool interaction: [Communication](./software/selection/communication.md).
- Choosing hosting and operational responsibility: [Deployment](./software/selection/deployment.md).
- Choosing signals, collection, and response arrangements: [Observability](./software/selection/observability.md).

### AI systems

- Assigning model, context, tool, execution, and memory responsibilities: [Systems](./software/ai/systems.md).
- Evaluating exact contracts and open-ended quality: [Evaluation](./software/ai/evaluation.md).
- Choosing APIs, retrieval, adaptation, and inference infrastructure: [Infrastructure](./software/ai/infrastructure.md).
