# Explore domain knowledge

A domain is an area of knowledge or activity. Domain discovery turns accounts of that work into a model that explains useful decisions. Learn from the people who make, carry out, and answer for those decisions. Include implementers so that discoveries can change software and implementation difficulties can change the model.

## Establish the evidence

Identify the result people need, the participants, and an actual case. Read relevant policies, contracts, examples, forms, operating records, existing models, and code. State what each source establishes:

- An authorized agreement supplies a rule within its scope and effective period.
- An operating record supplies evidence of what happened and when it was recorded.
- Code and tests describe implemented behavior and encoded expectations.
- A glossary supplies the current documented interpretation of terms.
- A suggestion supplies a candidate for discussion.

A conflict needs the sources and their scopes preserved. A new policy can supersede an old document. A surprising observation can expose a workaround or an implementation defect. Find the responsible participant or contract for the affected decision. Avoid choosing authority merely by file location or source recency.

## Reconstruct the decision

Follow one case through the participant's intention, known facts, requested action, enabling conditions, decision, established outcome, and unfinished obligations. Separate an action someone wants, a fact that occurred, and what the current observer knows. Include quantity, time, identity, and responsibility wherever they affect the result.

Compare a normal case with a refusal, exception, partial completion, or competing action. Turn recurring exceptions and unexplained calculations into candidate concepts. An agent can propose a distinction and show its consequences. Domain participants resolve business choices under their actual authority.

A useful open question states the alternatives, a case on which they differ, and who or what can decide. Read available facts first. Ask about the actual gap instead of returning an undifferentiated interview questionnaire.

## Discover partial cancellation

Constructed case: an order contains five units and two are confirmed shipped. The agreement permits cancelling the unshipped portion. Money already collected for a cancelled portion creates a refund obligation. Support says "cancelled" when it accepts the request, fulfillment says it after stopping shipment, and accounting says it after refund completion.

Explain the distinct facts before proposing structure:

- Request acceptance records an intention accepted for processing.
- Fulfillment confirmation establishes which units were cancelled. At the given snapshot, three are unshipped.
- Collected payment and confirmed cancellation determine the refund obligation under the agreement.
- Refund completion establishes discharge of that obligation.

For confirmed quantities, keep `shipped + cancelled <= ordered`. If shipment confirmation competes with cancellation, the decision must use current authoritative quantities and a mechanism that protects the shared rule. An accepted request still has fulfillment and accounting progress to track. The word "cancelled" alone loses those distinctions.

If code permits only whole-order cancellation, record the implementation discrepancy against the agreement. If someone proposes allowing returns of shipped units, record a new proposal. The agreement already answers cancellation of unshipped units. Return eligibility requires its own rule source.

## Use collaborative exploration

EventStorming, associated with Alberto Brandolini, is an optional workshop format for collaboratively exploring complex business domains. Arrange meaningful past-tense facts, then discuss actions, actors, constraints, exceptions, and disputed points around them. Use the emerging story to test possible model boundaries.

Invite participants with different knowledge of the work and let them challenge the story. An agent working alone can analyze material and prepare a candidate timeline or questions. Call that material analysis or a proposed model. A workshop claim requires actual participant interaction.

Event cards help discover domain meaning. Event storage, brokers, event sourcing, and service decomposition are separate design choices. Use the format suited to the current question; preserve disagreements that still need a decision.

## Preserve a usable account

Deliver a model sketch that explains the cases, sources for important rules, and consequential unresolved questions with their decision owners. Put it in the project's existing authorized materials. Continue learning through discussion and implementation feedback. A single conversation describes understanding supported at that time.

Use [Ubiquitous language](./language.md) to turn discoveries into precise expressions, [Bounded contexts](../strategic/bounded-contexts.md) when meanings differ by purpose, and [Evolution](../modeling/evolution.md) when new knowledge changes an existing model.
