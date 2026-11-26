# Model identity

An entity represents continuity through changes. A value object represents a meaning defined by its relevant attributes. Choose by the distinctions the business needs in the current context.

## Identify an entity

Ask whether two records with equal attributes can represent different things, and whether one thing remains the same after its attributes change. Two orders with the same customer, lines, quantities, price, and placement time can be distinct commitments. Cancelling one must leave the other intact. Their identity carries that distinction.

Specify the identifier's scope, how it is created or obtained, and the continuity it represents. An imported order number may be unique only within a seller. A database primary key is a storage identity; check its mapping to business identity. A composite identifier or explicit external-to-internal mapping can preserve distinctions across systems.

Restoration preserves the existing identity. Clarify what happens after deletion, reactivation, merger, or replacement where those actions are part of the business. Reusing an old identifier can incorrectly associate new activity with an earlier entity's obligations.

Identity supports equality of entity references. It does not establish equality of every snapshot of that entity. Compare versions or relevant attributes when a decision depends on which facts are known.

## Define a value

A value object is interchangeable with another value that has the same meaning in its context. State the attributes and comparison rules that establish that meaning. Two amounts of 100 smallest units in the same currency can be equal money values. An amount in another currency needs conversion under an explicit rule before comparison or combination.

Units, precision, rounding, time zones, interval endpoints, and normalization can change equality. In a date-range model, decide whether the end is included. In an address model, decide whether spelling normalization preserves delivery meaning. Primitive field equality is sufficient only when those fields already express the confirmed comparison contract.

Use immutable values or controlled copies so that using a value in one place preserves its meaning elsewhere. Inspect nested collections and shared mutable references. A frozen outer record containing a mutable list still permits changes through that list. Pick the language mechanism that maintains the intended value semantics.

Define valid values from the domain. A balance may be negative; a charge amount can have different rules. A delivery quantity and an adjustment quantity can have different signs. State assumptions beside examples rather than generalizing a convenient restriction.

## Let purpose change the model

A shipping address snapshot describes where a particular delivery was agreed to go. Replacing a customer's address-book entry leaves that historical delivery fact intact. Address-book management may instead treat an address entry as an entity whose identity survives edits.

Both models can describe the same real-world location. They answer different questions and have different lifecycles. Keep an explicit relationship if the delivery needs to remember the source entry. Preserve the snapshot's actual attributes when the entry changes.

In shared-credit modeling, a reservation is a commitment that can later be released and correlated to an order. It usually needs identity for that lifecycle. Its monetary amount is a value. Check the account and currency scope of both before defining operations.

Use [Lifecycle](./lifecycle.md) for identity-preserving restoration and [Bounded contexts](../strategic/bounded-contexts.md) for different models of the same real-world subject.
