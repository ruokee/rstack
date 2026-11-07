# Do not repeat yourself

Hunt and Thomas formulate DRY in _The Pragmatic Programmer_: "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." The concern is maintaining one decision consistently. Similar text can express unrelated decisions.

## Identify the shared rule

Ask what requirement each occurrence implements, who owns that requirement, and which changes must reach all occurrences. Price rounding in invoicing and settlement may express one accounting rule. Similar validation in two independently governed products may have different owners and release schedules.

Distinguish duplicated authority from derived representations. Generated clients, cached values, and materialized views can legitimately repeat information. Their source, update mechanism, and freshness contract determine whether they drift. An independently written expected result can provide useful verification of a rule.

## Choose how to keep agreement

- Put a shared calculation or invariant behind one operation when its consumers can use the same contract.
- Generate representations from an authoritative schema when languages or deployment units need separate artifacts.
- For independently versioned consumers, define the versioned contract and verify compatibility. A shared library alone leaves deployed versions free to differ.
- For replicated or cached data, define who writes the authority and how derived state catches up.

Risk raises the importance of explicit authority and verification. It does not dictate a runtime service, shared package, or common inheritance tree. Include release coupling, availability, latency, and ownership in the choice.

## Avoid false commonality

Keep independently changing rules separate even when today's implementation is identical. A helper that needs caller-specific flags and exceptions may have combined different responsibilities. Split it along those responsibilities when that reduces the cost of correct changes.

For example, a customer discount and an employee benefit can both subtract ten percent today. Combining them makes a change to one policy affect the other. A shared rounding operation may still be valid if both policies use the same monetary contract.

Use [Rule of Three](./rule-of-three.md) when commonality is uncertain. Use [Deep modules](./deep-modules.md) to judge whether a common operation reduces caller knowledge, and [KISS](./kiss.md) to compare the cost of the resulting structure.
