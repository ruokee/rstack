# Storage

Choose storage by the operations and guarantees required for each data class. Establish authority using [Data](../data.md), then compare the current arrangement and viable alternatives using [Decisions](../../core/decisions.md).

## Describe the contract

Specify keys and relationships, transactions and invariants, query shapes, read and write rates, item sizes, growth, retention, and tolerated staleness. Include deletion, backup, restore, migration, and operating ownership. Use expected distributions and hot keys as well as totals.

An added store creates integration, synchronization, consistency, and operating work. A feature already supported by the existing database can be sufficient. Introduce another store when its concrete benefit pays that cost.

## Compare models

- Relational storage supports explicit relations, joins, constraints, and transactions. It is a practical candidate for related business facts and invariants. Query plans, indexes, isolation, write contention, and recovery determine whether a particular configuration meets the contract.
- Document storage groups a self-contained record for whole-document access and flexible structure. Cross-document operations, indexes, and transaction scope need specific checking. Document databases can provide transactions; the product and version define their guarantees.
- Key-value storage gives a direct key-based access contract. Conditional writes, ordering, persistence, and transactional scope vary. Complex ad hoc queries can require another index or model.
- Columnar analytical storage favors scans and aggregation across many rows while reading selected columns. Updates, small transactions, ingestion delay, and concurrency have different costs from a transactional row store. Compare the actual workload.
- Search indexes provide term lookup, filtering, and relevance ranking. Index freshness, language analysis, update and delete propagation, and rebuild cost become part of the contract.
- Vector indexes support similarity retrieval over embeddings. Recall, filtering, dimensions, update rate, embedding version, and index memory affect the choice. Approximate retrieval trades work for recall under the chosen algorithm.
- Object storage provides named blobs with defined durability and access semantics. It can be authoritative for document bytes, media, or model artifacts. Metadata queries, object replacement, lifecycle, and access control need their own design.
- Time-series storage organizes timestamped observations for range access, aggregation, and retention. Late data, corrections, downsampling, and label cardinality change correctness and cost.
- Graph storage can make relationship traversal direct. Evaluate the actual depth, fan-out, mutation, transaction scope, and query alternatives before paying for another operational model.

Model labels guide candidates. Product capabilities, limits, consistency, and recovery require the selected version's primary documentation.

## Separate authority from projections

A read model derives facts for a query purpose. State the source, synchronization mechanism, allowed lag, repair, and rebuild. A specialized store can instead own authoritative facts when that is its explicit role. The role follows the contract rather than the storage category.

Constructed example: reporting scans compete with transactional I/O. A derived analytical store can isolate scans while allowing a defined reporting delay. The choice adds change capture, delayed visibility, and repair work. Index or query changes on the current store remain candidates if they meet both workloads' targets.

## Choose retrieval storage

For retrieval-augmented generation, locate raw content, document versions, chunks, embeddings, metadata, permissions, and citation identity. Define how each derived index is rebuilt and how updates and deletions reach it.

Compare lexical, vector, and hybrid retrieval using representative queries. Filtering before retrieval can alter index behavior; filtering afterward can reduce usable recall. Either arrangement must honor the actual access contract. Reranking adds latency and cost. A vector store alone leaves content authority, citation correctness, and answer evaluation unresolved. Read [AI infrastructure](../ai/infrastructure.md) for the wider system.
