# Model the lifecycle

Creation establishes a new object under the applicable rules. Restoration reconstructs an existing object from recorded facts. Access and retirement preserve the meaning of its identity and obligations.

## Create a new object

State when a new identity comes into existence, what facts are required, and which rules apply at that time. A simple constructor or named creation function can suffice. Use a factory when assembling a complete aggregate or complex value would otherwise expose internal relationships or duplicate construction rules.

A factory produces an internally meaningful result under its inputs. Committing it is another operation. Distinguish a created in-memory order, a persistently accepted order, and a response that tells the caller acceptance has completed. Other operations may observe the order only according to the chosen commit contract.

If creating one object requires an external commitment, describe the pending state and the owner of that obligation. Choose the state and completion meaning from the business contract.

## Restore recorded facts

Restoration retains identity, historical facts, and relevant version information. Loading an existing order reconstructs the same order. It must not emit a new `OrderPlaced` fact merely because code allocated a new object in memory.

Keep new-object defaults and current acceptance rules out of historical reconstruction when they would change recorded meaning. Suppose a former policy accepted orders above an old threshold, and today's threshold is higher. Existing orders keep their established acceptance facts. Whether new actions on those orders use the old policy, current policy, or an explicit exception requires the applicable agreement.

Restoration can check whether storage is intelligible and internally consistent under its recorded schema and history. Inconsistent records need explicit handling through their source or a migration decision. Silently inventing a quantity or rewriting an old status would alter history.

A schema conversion, restoration operation, and domain transition have different responsibilities. Preserve the source version and explain the mapping where meaning depends on it. See [Evolution](../modeling/evolution.md) when a new model needs facts absent from old records.

## Define repository access

A repository gives collection-like access to aggregate roots that need direct retrieval. Use domain criteria and state the meaning of lookup, absence, saving, and conflicts. It can use the existing ORM or data-access facility. Add an interface when it supports a useful contract rather than duplicating an existing one.

Access should provide enough facts for the intended domain decision. A report or read-only projection can query only the needed fields. Loading every complete aggregate for a report adds cost unrelated to its question. Read projections still need clear freshness and interpretation conditions when people use them for decisions.

The repository's persistence contract must identify the transaction owner. Does `save` stage a change or complete a commit? Which version does it compare? What is returned on absence or conflict? A caller coordinating an operation must be able to distinguish a completed commitment from prepared changes.

A Unit of Work tracks related in-memory changes and coordinates their commit in implementations that need that facility. It follows the operation's real atomic boundary. It does not by itself establish a shared-credit invariant across independent transactions.

## Retire deliberately

Deletion, deactivation, expiry, and archival mean different things. State which actions remain available, which identity remains referable, and what happens to outstanding obligations. Deleting a local order record cannot discharge an existing refund obligation.

If reactivation or recovery is allowed, define its identity and applicable policy. Preserve the historical facts needed to explain later decisions. Use the project's storage and retention mechanisms for the resulting requirements.

Use [Identity](./identity.md) for continuity, [Aggregates](./aggregates.md) for concurrent commits, and [Domain events](./events.md) for facts associated with lifecycle changes.
