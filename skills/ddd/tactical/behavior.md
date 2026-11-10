# Place domain behavior

Place a rule where the knowledge needed to explain and maintain it is explicit. Entity methods, value operations, named functions, and domain services are possible expressions. Judge the resulting contract and responsibility.

## Assign the operation

An entity can own behavior tied to its identity and lifecycle. A value can own a calculation over its meaning. A domain service expresses a significant domain process or transformation that fits neither naturally. Give the service a domain name, required facts, result, and rule conditions.

Application coordination obtains inputs, loads current facts, invokes the domain decision, arranges persistence, and requests effects. Infrastructure performs storage or external communication. A domain rule can require an external fact; make that fact and its freshness requirements visible to the decision.

For shared credit, the account decides whether another reservation fits the limit. A request handler coordinates reading the account and committing the reservation. A persistence mechanism protects against competing commitments. Splitting these roles can preserve one coherent domain operation.

A cross-entity operation does not automatically need a service. First examine which aggregate owns the shared invariant. A service using independent stale snapshots still needs a mechanism for the actual consistency requirement.

## Express a specification

A specification states whether a candidate meets a business condition. Distinguish the requirement, the candidate, and the process that finds or constructs candidates. Following Evans and Fowler's Specifications, this idea supports several uses:

- Selection finds candidates that meet a condition.
- Validation checks whether a chosen candidate is eligible.
- Construction-to-order seeks a candidate that satisfies a stated requirement.

Constructed example: a delivery promise requires a route arriving by an agreed deadline and supporting the parcel's temperature range. The route specification expresses those constraints. A route finder searches possibilities. A concrete route describes the selected journey and its actual reservations.

A named predicate is enough for a fixed condition. Parameters support known variation, such as a deadline or temperature bound. Composite specifications support meaningful combinations with conjunction, alternatives, or negation when participants actually need that flexibility. Composition adds interpretation, explanation, and execution costs. Keep a simple rule simple.

A specification that describes an acceptable route has a different responsibility from the actual route. Avoid turning every property of the candidate into a configurable rule system. Use a separate representation only when it makes a real requirement clearer or reusable.

## Preserve rule semantics

Compare the meanings of inputs across in-memory checks, database filters, and external calculations. Check units, time zone, rounding, missing values, effective dates, and which facts are included. Logical expressions that look alike can select different candidates when these conditions differ.

A search result describes eligibility at the facts used for that search. If availability or commitments can change before execution, the operation needs the guarantee required at acceptance time. State whether the decision is advisory, reserves capacity, or commits an obligation.

For partial cancellation, a predicate can identify unshipped units at a snapshot. Actual confirmation must preserve the shared quantity invariant against shipment changes. Eligibility and the accepted commitment have different moments of truth.

## Choose an expression

An object method can enforce a local transition. A pure function can take immutable facts and return a refusal or proposed new state with pending events and obligations. Coordination then commits or rejects that decision under its persistence conditions. Both approaches can express the same domain contract.

Evaluate whether rules have a clear owner, accepted changes preserve them, and consumers understand outcomes. Field-only records with rules scattered across unrelated handlers can make maintenance difficult. Immutable records with focused domain functions can keep the rules explicit and coherent.

Use [Aggregates](./aggregates.md) for shared invariants, [Implementation](../modeling/implementation.md) for software expression, and [Lifecycle](./lifecycle.md) for committing decisions.
