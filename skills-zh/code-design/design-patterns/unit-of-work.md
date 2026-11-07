# 工作单元

工作单元跟踪操作中的变更并协调持久化，让新增、修改及删除对象共享明确的完成边界。ORM session 可能已实现变更跟踪。小型直接 SQL 操作可能只需显式事务。

## 区分阶段

跟踪记录待处理变更，flush 将变更发送到存储并可能暴露约束错误，commit 按后端保证结束事务，rollback 丢弃仍由该事务覆盖的变更。释放连接属于资源清理。

选择一个完成所有者，使作用域匹配业务操作。参与仓储必须使用协调中的事务。一个请求可以包含多个独立工作单元。共享请求本身不能定义原子性。

## 执行单个事务

下面的 Python 3.11 示例在两个已存在、容量为十的货位之间移动库存。调用方提供正整数数量，并独占使用已打开的 SQLite 连接。连接设置 `isolation_level=None`，且没有活动事务。函数拥有事务，调用方拥有连接。

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

第二次移动完成首个更新后，因目标超出容量而失败。SQLite 连接上下文回滚本次事务，并传播错误。之前成功的移动保持已提交状态。外层 `closing` 释放连接，连接自身的上下文管理器负责事务完成。

## 限定保证范围

原子性仅覆盖实际事务包含的资源。远程调用、文件写入或消息发布需要各自的一致性机制。事务隔离决定可能出现的并发观察及冲突。

提交可能在完成前失败，也可能完成后丢失确认。保留后端报告的结果，包括未知状态。之后尝试回滚，无法撤销已经完成的提交。

保存点界定事务内部的部分回滚范围。释放内部保存点不会提交外层事务。独立事务具有独立的可见性及失败后果。

## 复用现成机制

ORM 的变更跟踪及事务机制满足契约时，直接使用。额外的工作单元接口可以明确归属或协调仓储。避免重复实现有效的身份映射或脏数据跟踪。

在存储边界验证提交、回滚及真实并发行为。访问契约参见[仓储](./repository.md)，清理失败参见[资源生命周期](../approaches/resource-lifecycle.md)。
