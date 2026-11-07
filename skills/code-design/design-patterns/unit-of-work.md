# Unit of work

A Unit of Work tracks changes during an operation and coordinates their persistence. New, modified, and removed objects share a defined completion boundary. An ORM session may already implement change tracking; a small direct-SQL operation may need only an explicit transaction.

## Separate the stages

Tracking records pending changes. Flush sends changes to storage and can expose constraint failures. Commit ends the transaction under the backend's guarantees. Rollback discards changes still covered by that transaction. Releasing a connection is resource cleanup.

Choose one completion owner and a scope that matches the business operation. Participating repositories must use the coordinated transaction. A request can contain several independent units of work. Sharing a request does not itself define atomicity.

## Exercise one transaction

This Python 3.11 example moves stock between two existing bins with capacity ten. The caller supplies positive integer units and exclusive use of an open SQLite connection with `isolation_level=None` and no active transaction. The function owns the transaction, and the caller owns the connection.

```python
import sqlite3
from contextlib import closing


def move_stock(db: sqlite3.Connection, source: int, target: int, units: int) -> None:
    with db:
        db.execute("BEGIN")
        db.execute("UPDATE bins SET qty = qty - ? WHERE id = ?", (units, source))
        db.execute("UPDATE bins SET qty = qty + ? WHERE id = ?", (units, target))


with closing(sqlite3.connect(":memory:", isolation_level=None)) as db:
    db.execute("CREATE TABLE bins (id INTEGER PRIMARY KEY, qty INTEGER NOT NULL CHECK (qty BETWEEN 0 AND 10))")
    db.executemany("INSERT INTO bins VALUES (?, ?)", [(1, 8), (2, 8)])
    move_stock(db, 1, 2, 2)
    assert db.execute("SELECT qty FROM bins ORDER BY id").fetchall() == [(6,), (10,)]
    try:
        move_stock(db, 1, 2, 1)
    except sqlite3.IntegrityError:
        pass
    else:
        raise AssertionError("capacity violation must fail")
    assert db.execute("SELECT qty FROM bins ORDER BY id").fetchall() == [(6,), (10,)]
```

The second move fails after its first update because the target would exceed capacity. SQLite's connection context rolls back that transaction and propagates the error. The earlier successful move remains committed. The outer `closing` releases the connection; the connection's own context manager handles transaction completion.

## Bound the guarantee

Atomicity covers only resources enlisted in the actual transaction. A remote call, file write, or message publication needs its own consistency mechanism. Transaction isolation determines which concurrent observations and conflicts are possible.

Commit can fail before completion, or its acknowledgement can be lost after completion. Preserve the backend's reported outcome, including unknown results. A subsequent rollback attempt cannot undo a commit that already completed.

Savepoints delimit partial rollback inside a transaction. Releasing an inner savepoint does not commit the outer transaction. An independent transaction has separate visibility and failure consequences.

## Reuse the available mechanism

Use an ORM's change tracking and transaction facilities when they satisfy the contract. An additional Unit of Work interface can clarify ownership or coordinate repositories. Avoid duplicating a working identity map or dirty tracker.

Verify commit, rollback, and actual concurrency behavior at the storage boundary. Read [Repository](./repository.md) for access contracts and [Resource lifecycle](../approaches/resource-lifecycle.md) for cleanup failures.
