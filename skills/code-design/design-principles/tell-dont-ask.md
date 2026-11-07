# Tell rather than ask

Tell Don't Ask places a state-changing decision with the owner able to preserve its invariant. Callers request the operation instead of reconstructing its rule from exposed fields. This concentrates both the rule and responsibility for enforcing it.

## Put the rule at the update

For an account debit, checking available funds, checking a hold, reducing the balance, and recording the debit belong to one defined operation. Every caller should receive its success or rejection outcome. Separate reads followed by public field writes let callers omit steps and race with other writers.

An object method can enforce the rule for state it exclusively controls. A persisted balance requires the storage update to enforce the corresponding concurrency condition. Moving a check into a method alone leaves a read-then-write race unchanged.

Inspect every mutation path. Private representation and controlled operations can keep callers within the contract. A public setter or separately writable copy can bypass that control.

## Keep useful queries

Reporting, rendering, serialization, and read models need data. Expose values or snapshots suited to those consumers and state their freshness. Queries remain useful even when the underlying state has invariants.

A pure function can also compute a decision from explicit inputs. The effect owner must validate that the inputs remain applicable when applying the decision, or provide a transaction or version check that establishes it. See [Functional core](../approaches/functional-core.md).

## Choose the right scale

A batch operation can enforce the same rule over many records while avoiding one remote call per object. Give the rule to the authority that can apply it at the required scale and consistency boundary. Object proximity alone is insufficient.

Keep expensive queries and effects visible in the API. A property that unexpectedly performs I/O hides a cost callers need to control. A data transfer record can remain transparent when another owner applies the business operation.

Read [GRASP](./grasp.md) to choose the owner and [Object-oriented](../approaches/object-oriented.md) for controlled state operations.
