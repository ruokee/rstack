# Communication

Choose the interaction contract before the protocol. Establish what the caller must know, when it needs the result, and who owns unfinished work. Use [Decisions](../../core/decisions.md) to compare viable options.

## Define the interaction

Synchronous request/response lets a caller await an outcome. It couples completion time and availability to the dependency. A timeout can leave the outcome unknown after the dependency has acted. An acknowledgment may confirm acceptance while execution continues asynchronously.

Asynchronous interaction separates acceptance from completion. Define durable acceptance, operation identity, pending states, result discovery, failure ownership, and the latest useful completion time. Queues can absorb a burst; persistent overload still requires a capacity or admission decision. Delivery and duplicate effects follow [Messaging](./messaging.md) and [Consistency](../consistency.md).

Streaming exposes successive results or progress. Define framing, order, backpressure, connection lifetime, and what a disconnect means. Resumption requires a cursor or equivalent recoverable state when the contract promises it. A displayed partial answer and a completed business action are separate results.

## Compare protocols

- REST-style HTTP interfaces expose resources and operations through widely supported clients, intermediaries, and debugging tools. Typed schemas and generated clients can supply explicit contracts. Evaluate representation, caching, request size, and performance for the workload.
- RPC gives named operations and structured contracts. Systems such as gRPC offer an IDL, code generation, and streaming, with deployment and client support that depend on transports and versions. Compare browser, proxy, external-client, and operational requirements directly.
- GraphQL lets clients select fields through a schema. It can reduce client-specific aggregation work while moving query planning, field authorization, cost accounting, and resolver efficiency to the server. Mutations still need precise business-effect contracts.
- Webhooks deliver notifications to a callback endpoint. Specify event identity, acknowledgment, redelivery, ordering, and missed-event recovery. A notification's receipt and the reported business event have distinct meanings. Use the actual integration's identity and trust requirements.
- Agent tool protocols such as MCP expose tools, resources, and context. They provide an interaction format; the application still owns business authorization, tool effects, and recovery. Verify the chosen protocol version and host capabilities.

## Complete the boundary contract

Define field meaning, required values, units, errors, deadlines, cancellation, duplicate handling, version compatibility, quotas, and result retention. Separate rejection before execution, known failure, completed success, and unknown outcome where these are possible. State which errors permit repetition and under what effect guarantee.

Cancellation may stop waiting, queued work, or active execution. Name the supported level and the fate of effects already committed. A timeout budget belongs to the whole caller-visible operation, including fan-out and retries. See [Resilience](../resilience.md).

Public compatibility depends on consumer behavior, including strict parsing and generated clients. Check an apparently additive change against the actual contract. Internal protocols also need release coordination when callers cannot update together.

Constructed example: a refund tool returns a timeout after submitting to a provider. Changing REST to RPC leaves that uncertainty. A stable operation identifier, a provider contract, queryable state, and an assigned recovery owner determine the safe next action.
