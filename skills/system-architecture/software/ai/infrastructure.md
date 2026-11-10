# AI infrastructure

Choose infrastructure for an identified knowledge, behavior, quality, latency, data-location, or cost problem. Use [Decisions](../../core/decisions.md) to retain viable current arrangements and compare lifecycle obligations.

## Locate the constraint

Trace the task through context preparation, retrieval, inference, tools, and result handling. Measure the stage and workload distribution that limits the required result. More model capacity leaves missing source material unresolved. A faster index leaves incorrect tool effects unresolved.

## Choose model hosting

Managed APIs supply a model-serving contract, with provider-specific models, quotas, pricing, version changes, data handling, and availability. The application owns integration, usage, quality, and the recovery behavior it promises.

Self-hosted inference gives control over compatible model artifacts, placement, serving software, and capacity. It transfers responsibility for accelerator memory, throughput, batching, cache, scaling, upgrades, failure, and support. Model license, hardware, numerical format, context behavior, and serving version constrain what can run.

Hybrid arrangements can place different tasks or data classes on different hosts. Routing adds another quality decision and operating dependency. Evaluate route selection, task handoff, and each promised recovery behavior. A gateway can centralize adopted policies and usage accounting when shared integration warrants it, adding its own availability and ownership requirements.

Calculate the comparison from actual assumptions. Include input, cached input, output, embeddings, reranking, tool calls, repeated attempts, and evaluator calls when they occur. Effective task cost is total relevant cost divided by tasks meeting the defined success criteria. For self-hosting, add acquisition or rental, idle capacity, redundancy, engineering, power where relevant, upgrades, and incidents over the chosen lifetime. Compare at the required quality and latency.

## Choose context access

Long context supplies selected material directly to the model. Evaluate usable capacity, attention to relevant facts, latency, price, source identity, and updates. Fitting within a window leaves answer quality to evaluation.

Retrieval selects evidence for the current query. Design content acquisition, versioning, chunking, lexical or vector search, filtering, reranking, and citation references according to actual needs. Measure retrieval relevance separately from grounded answer quality. Existing relational search or an in-process index can be viable. A dedicated vector store needs a measured benefit in recall, filtering, update behavior, latency, scale, or operations. Document count alone leaves that comparison open.

Caches can retain embeddings, retrieved content, model prefixes, or final answers. Define key scope, freshness, sharing permissions, invalidation, and the effect of model or source changes. Prefix caching can reduce repeated processing while preserving the model input's logical content; final-answer caching reuses a prior result and needs its own correctness contract.

## Choose model adaptation

Prompt and context changes can improve task behavior without training. Fine-tuning updates model parameters for an objective supported by suitable training examples. Compare quality and lifecycle cost against prompting, retrieval, and model choice. Retrieval can supply current evidence while fine-tuning adapts behavior. Parameter updates require their own evidence for knowledge accuracy, freshness, and citation needs.

Training infrastructure owns licensed and versioned data, jobs, accelerators and interconnect, checkpoints, artifacts, experiment records, evaluation, and promotion. Managed fine-tuning can assume some obligations under its contract. A self-operated training arrangement needs the actual required control and ability to sustain it. Training and inference have different resource and recovery patterns.

## Select execution support

Compare frameworks by the state, tool contracts, concurrency, cancellation, checkpoint, recovery, and observation capabilities the application requires. Confirm how stored state relates to external effects. Required permissions, approvals, resource limits, and stop outcomes follow [AI systems](./systems.md).

Validate a proposed change on representative tasks using [Evaluation](./evaluation.md). Record the operational owner, adoption work, persisted artifacts, and exit path. Product capabilities and prices need the chosen model, version, service tier, and current primary documentation.
