# Evolve the model

Model evolution follows new domain understanding. Repeated exceptions, duplicated rules, workarounds, unclear explanations, and coupling across unrelated concepts can reveal a missing distinction. Establish the case before choosing a transformation.

## Explain the new knowledge

Describe the old understanding, the case it fails to explain, the new concept or rule, and the source that establishes it. Work with domain participants and implementers to compare meaningful alternatives. A better model should explain the important cases with fewer hidden conventions and support practical implementation.

Distinguish the kind of change:

- Representation improvement preserves an already confirmed business contract while making it clearer or easier to implement.
- Correction repairs an earlier misunderstanding against the relevant rule and historical facts.
- Policy change adopts new business behavior under an authorized decision and effective scope.

These changes can occur together in a migration. Identify which applies to each affected case. Use original cases to check preserved behavior and new cases to explain the added or corrected meaning.

## Evolve cancellation

Constructed case: the old system assumed whole-order fulfillment and stored only `cancelled`. The confirmed model now needs partial shipment, partial cancellation, and staged refunds. Some historical records have traceable line-level fulfillment and refund details.

Represent ordered, shipped, and confirmed-cancelled quantities at the granularity the actual rules need. Keep request acceptance separate from fulfillment confirmation. Represent the refund obligation and its actual completion facts. Preserve `shipped + cancelled <= ordered` and the distinction between confirmed facts and pending work.

Compare an original whole-cancellation case with a case ordering five units, shipping two, and cancelling the remaining three. Whole cancellation remains explainable when all five are unshipped and fulfillment confirms cancellation. The partial case keeps the two shipped units as fulfilled history and the three cancelled units as a separate confirmed quantity. Refund completion follows its accounting facts.

A single boolean cannot determine these histories. `cancelled=false` can coexist with no shipment or a completed shipment. `cancelled=true` can coexist with an outstanding refund or a completed refund. The missing quantities and times need evidence from line records, fulfillment history, payment records, or the responsible domain participant's decision.

Use available traceable details to transform records whose meaning is established. Identify records missing required information, the decision or source needed, and the owner of reconciliation. An explicit unresolved-history representation can preserve the gap where the business permits it. Inventing quantities or refund dates would fabricate facts. New-object defaults are inappropriate evidence for old occurrences.

## Trace the impact

Follow changed concepts into terminology, operations, identity mappings, aggregates, context boundaries, stored fields, events, interfaces, reports, and consumers. Keep a mapping from the previous meaning to the new one and state where it is partial or ambiguous.

Internal model evolution and external contract changes can need different schedules. A consumer of `cancelled` may still assume an all-or-nothing order. State which facts it can correctly receive and what it must change to understand partial outcomes. Versioning a field leaves a semantic incompatibility unresolved until the consumer's interpretation changes.

During coexistence, define each representation's applicable cases, authoritative facts, data and event versions, translation direction, and exit conditions. State which component can accept new actions and how pending obligations stay visible. A richer model may contain distinctions that the older representation cannot express. Define the permitted compatibility scope explicitly.

Concrete backfill, cutover, and recovery mechanisms can use `system-architecture` as deeper guidance. The domain model must first explain which meanings and commitments those mechanisms preserve.

## Keep the learning usable

Update affected language, examples, model expressions, and code mappings together. Retain the adopted decision, its important alternatives, and the knowledge that motivated it in authorized project materials. Let implementation feedback test the model and let new domain evidence reopen the affected decision.

Use [Domain knowledge](../discovery/knowledge.md) for unresolved sources and [Validation](./validation.md) for comparing preserved behavior and new cases.
