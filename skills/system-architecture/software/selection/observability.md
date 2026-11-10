# Observability

Select evidence for the system results and operational questions that matter. Monitoring evaluates known signals and conditions. Diagnostic evidence also needs to support questions that arise during an incident. The scope follows the actual system and response responsibilities.

## Define the question

Start with a result such as completed checkout, delivered notification, or recoverable refund. Define success, the observation boundary, time window, and required delay or reliability. A service-level indicator measures a defined outcome; a service-level objective sets its target. Error-budget and release policies follow the system's adopted reliability decisions. See [Resilience](../resilience.md).

Separate the observed symptom from candidate causes. A latency increase can come from dependency waiting, local saturation, or work distribution. Choose evidence that distinguishes explanations and leads to a useful action.

## Select signals

- Metrics summarize rates, distributions, saturation, and backlog over time. Define units, denominators, aggregation, labels, and missing-data behavior. Tail latency needs a suitable distribution measurement. Averaging per-instance percentiles loses the fleet-wide distribution.
- Logs record event-level facts. Structured fields can connect operation identity, state, version, and failure reason. Choose what is needed to reconstruct the relevant transition, with the system's actual data-handling and retention rules.
- Traces connect spans of a request or workflow. Define context propagation across asynchronous boundaries, sampling, and how business operations map to spans. A sampled trace can explain an observed path. Population rates need an appropriate sampling or counting method.

Telemetry standards and common identifiers can reduce instrumentation coupling to a backend. A backend change still needs compatibility checks for queries, dashboards, alerts, retention, and data export.

## Design sampling and cost

Define the question's time horizon, collection frequency, retention, and acceptable loss. Head sampling chooses before the outcome; tail sampling can choose after more outcome information, with buffering and resource cost. Rare failures may need targeted retention. Document the selection bias when interpreting a sample.

High-cardinality metric labels create many series and associated memory, storage, and query work. Put unbounded per-operation detail in a suitable event or trace store when that meets the question. Price ingestion, indexing, retention, export, and operator time alongside application overhead.

## Make alerts actionable

An alert needs a signal, window, trigger, responsible responder, and feasible action. User-visible symptoms support direct outcome alerts. A cause signal can justify earlier action when it predicts harm with useful lead time.

Constructed example: free disk is declining and the projected exhaustion precedes the response time needed to add capacity. A named operator can act before writes fail. The forecast needs the actual consumption pattern and a documented action. A fixed percentage with no consequence or response leaves its purpose unclear.

Include deduplication, routing, escalation, and recovery criteria as required by the response model. An alert that repeatedly demands no action consumes attention needed for useful signals.

## Connect evidence to recovery

Record who identifies the affected operation, finds its authoritative state, and chooses recovery. Runbooks can capture known actions; incident evidence can expose missing instruments or incorrect assumptions. Select managed or self-operated backends by signal support, query needs, integration, cost, reliability, and ownership using [Decisions](../../core/decisions.md).

For AI systems, successful tool transport, business completion, and answer quality are different observations. Read [AI evaluation](../ai/evaluation.md) for semantic judgments.
