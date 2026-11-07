# Functional core

Functional Core, Imperative Shell is an approach popularized by Gary Bernhardt. The core computes decisions from explicit inputs. The shell obtains inputs and carries out effects such as I/O, clock reads, persistence, and logging.

## Isolate a decision

Choose a rule whose output can be determined from its inputs. Pass observations such as time and current state as values. Return a result, a rejection, or a description of intended effects. Keep hidden state changes and external observations out of that calculation.

A pure function can have a partial input domain and return an error. Purity describes externally observable behavior. It does not establish correctness, termination, or an inexpensive algorithm.

## Compute a fee

This Python 3.11 example charges for calendar days strictly after the due date. Rates and caps are nonnegative integer cents in one agreed currency. Type-correct inputs are supplied by the caller; the function rejects negative monetary parameters. The shell chooses the business calendar's `today` value.

```python
from datetime import date


def late_fee(due: date, today: date, daily_cents: int, cap_cents: int) -> int:
    if daily_cents < 0 or cap_cents < 0:
        raise ValueError("rate and cap must be nonnegative")
    days = max((today - due).days, 0)
    return min(days * daily_cents, cap_cents)


due = date(2026, 1, 10)
assert late_fee(due, date(2026, 1, 9), 30, 50) == 0
assert late_fee(due, due, 30, 50) == 0
assert late_fee(due, date(2026, 1, 11), 30, 50) == 30
assert late_fee(due, date(2026, 1, 12), 30, 50) == 50
```

The core calculates an amount. Applying it once to an account, recording it, and notifying someone are separate effects. Their ordering and failure outcomes belong to the shell's contract.

## Preserve consistency at execution

A decision based on a snapshot may be stale when applied. Use the required transaction, conditional update, version check, or exclusive owner across the relevant read-decide-write operation. A pure planner alone cannot prevent concurrent updates.

Some operations require several rounds of reading and deciding. Keep each useful decision explicit and let the shell sequence the rounds. If a decision returns commands, define what happens when only some commands complete. See [Command](../design-patterns/command.md).

## Keep the boundary economical

Use local mutation of privately owned temporary data when it preserves the function's external contract. Avoid copying large structures just to imitate an immutable style. Read [Data modeling](./data-modeling.md) for ownership and layout costs.

An I/O operation with little decision logic can remain a direct procedure. The shell needs room to own resource lifetime, transaction completion, and error handling. Its size follows those duties, as described in [Imperative](./imperative.md).
