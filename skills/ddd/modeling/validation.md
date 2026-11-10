# Validate a domain model

Evaluate a model against confirmed business meanings, rules, and observable behavior. Pattern names, directory layout, class count, and preferred programming style are weak substitutes for those criteria.

## Establish the contract

Identify the model purpose, authoritative rules, examples, and conditions that could change the result. Keep current implementation and proposed policy separate from the rule being checked. Investigate conflicts through [Domain knowledge](../discovery/knowledge.md).

Choose cases that discriminate between interpretations: normal work, refusal, exact boundaries, partial completion, and relevant orderings or competition. State the expected result from the agreement and inputs. Permit different valid implementations of that result.

## Match the evidence

- Meaning: domain participants can use the model to explain the same case and distinguish its important facts.
- Expression: operations, states, and results describe legal behavior, refusal, and remaining obligations clearly.
- Local behavior: the implementation preserves its rules over the inputs and changes it controls.
- Persistent behavior: the actual transaction, constraints, and competing writers maintain the claimed commitment conditions.
- Cross-boundary behavior: translation and handoffs preserve meanings, identities, and outstanding obligations.

A calculation can exercise a local transition. A claim about database concurrency needs evidence from the relevant mechanism and execution conditions. A model run shows how the guidance was used under its supplied case and environment. Match each conclusion to that observation.

## Exercise decisive cases

For partial cancellation, distinguish request acceptance, fulfillment confirmation, and refund completion. With five ordered and two shipped, the initial unshipped quantity is three. Competing shipment and cancellation decisions must preserve `shipped + confirmedCancelled <= ordered` at the required commitment point.

For shared credit, start at zero reserved with a 10000 limit and two 6000 requests in one currency. Independent per-order checks admit a 12000 total. A valid shared decision accepts at most one under those facts. With a versioned account, the stale competitor conflicts and a decision on current facts refuses 6000 against the remaining 4000. Check the actual persistence conditions for a persistent guarantee.

For settlement translation, compare `CLOSED + SETTLED`, `CLOSED + ABORTED`, and `CLOSED` with missing detail. Only confirmed settlement supports internal `Paid`. Preserve the terminated and unresolved outcomes and distinguish transport changes from semantic translation.

For lifecycle, restore a persisted order under historical rules and verify identity and facts remain intact. Loading must not create another placement event. Apply new policy to historical objects only under the relevant agreement or migration contract.

For event timing, compare refused cancellation, a failed local commit, and a successful commit awaiting publication. Also examine externally confirmed settlement followed by a failed local save. The provider's established fact survives; local recording remains due.

For evolution, compare original whole-order cases and new partial cases. Determine which historical records have adequate detail and which need an explicit decision or further source. Preserve outstanding consumer and migration obligations.

## Preserve sound alternatives

Compare an object method and an immutable state transition function under the same business cases and persistence guarantees. Either can be a sound model. A simple address book can remain direct record maintenance with meaningful identity and operations.

A single-process system can contain different customer models for sales and settlement. Multiple repositories can maintain one model. Evaluate meaning and actual consistency arrangements before assigning contexts.

A critical but standard settlement capability can be generic while proprietary pricing is core. A clear model can retain its current structure. Additional knowledge levels or plugin frameworks need a real variation or coordination problem.

## Report a usable judgment

For a finding, state the violated confirmed rule, concrete input and sequence, observed or derived consequence, relevant counterevidence, and sufficient repair direction. Separate a business question from an implementation defect. A sound model can receive zero findings.

Record the candidate, producer, scope, inputs, conditions, observed results, and evidence location. State a consequential gap beside the affected conclusion and identify the evidence or decision needed. After repair, recheck the affected cases and reuse still-valid evidence under its original scope.

Executable examples, formal tests, business experiments, and model-use observations follow the current project's workflow and permissions. Their coverage should match the behavior being claimed.
