# Analysis

Understand the current system well enough to answer the requested question. Begin with its purpose and a real piece of work, then investigate the responsibilities and interactions that determine the result.

## Follow actual work

Choose a representative instance and identify its starting point, intended completion, participants, decisions, information, resources, and external effects. Include waiting and partial completion. For services, follow an intake record through acceptance and completion. For facilities, trace an operating demand through equipment and supporting utilities. For software, follow an entry point through state changes and dependencies.

Compare the declared path with actual records. An organization chart describes formal responsibility. Handoff receipts reveal who actually accepts work. Code establishes an implemented path. Operating records show which paths occur under the observed conditions. State the observation window and case selection so readers can judge coverage.

Investigate a discrepancy that matters to the requested result. Constructed example: a process guide assigns missing-parts follow-up to intake, while repair logs show technicians repeatedly contacting suppliers. The current-state account should retain both the formal assignment and the observed work. The discrepancy points to unclear ownership and consumed repair capacity; its historical cause needs separate evidence.

## Locate authority

For each consequential fact or decision, identify who can create it, change it, confirm it, and correct it. Check the actual write or approval path. Distinguish a copy of information from its authority and distinguish coordinating work from owning its completion.

A shared table, a circular dependency, or frequent contact between teams is a signal to investigate. Establish the relevant contract and consequence before calling it a problem. Several writers can be legitimate when their scopes or coordination rules are explicit.

In software, inspect relevant entry points, dependency direction, state stores, schemas, configuration, scheduled work, and deployment. Trace the part needed to resolve the question. For an AI service, include model and context versions, tool execution, usage costs, and persisted progress where they affect operation.

## Explain observed limits

Connect a constraint to a path, resource, or obligation. A queue can result from limited capacity, missing inputs, a batching rule, or blocked authority. Aggregate counts alone leave those causes open. Seek a discriminating observation such as ready work versus blocked work, processing time versus waiting, or resource usage by workload class.

A capacity estimate states its workload, units, boundary, and time window. A hypothetical load change states its premise. Use the actual target or a decision-changing scenario rather than an automatic scale multiplier. Read [Dynamics](./dynamics.md) for stock and flow reasoning.

## Return a current-state account

Provide the system's purpose and boundary, important responsibilities, representative operating path, relevant dependencies, supported limits, and unresolved facts that affect the question. Add a view only when it clarifies these relationships.

Keep current behavior, inferred consequences, and evaluation distinct. Explain why a structure was chosen only when historical records support that claim. An analysis can end with a reliable account and a focused unanswered question. Root-cause investigation and redesign follow the requested scope.
