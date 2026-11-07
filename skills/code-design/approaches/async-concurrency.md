# Async concurrency

Concurrency gives operations overlapping lifetimes. Parallelism runs computation simultaneously. Choose an execution model from the work, required ordering, resource limits, and runtime. Async is useful when operations can yield while waiting; blocking or CPU-heavy code still needs an appropriate execution context.

## Own the work

Each task needs an owner that observes completion, handles failure, and waits for shutdown. Structured concurrency groups related work into a lifetime that ends after its children finish. A detached task transfers these duties to a longer-lived owner.

Python `asyncio` normally interleaves tasks on one event-loop thread. Rust futures advance when polled. Creating a future alone does not schedule it. A Rust runtime can schedule tasks on one or several threads. Spawning rules, handle ownership, and cancellation behavior depend on that runtime.

Moving blocking work to a thread keeps the event loop available. Cancelling its awaiter does not automatically stop the running thread. Account for that continued work and its resource lifetime.

## Bound independent quantities

Set the needed limits for active operations, live tasks, queued input, and retained results separately. A semaphore bounds its protected region. Creating a semaphore-waiting task per item still retains a task per item.

Fixed workers can pull from a finite nonblocking iterator. An asynchronous producer can feed a bounded queue, where waiting for capacity applies backpressure. Batches fit work that can wait for a whole batch. Ordered output may require buffering behind a slow earlier item; include that buffer in the bound.

## Process with fixed workers

This Python 3.11 example accepts a finite, nonblocking iterable of integers and a positive integer worker count. It creates `workers` tasks, each with at most one active `process` call. The callback completes its item and any owned output before returning. Cancellation of workers belongs to the group or its caller. The callback must not independently cancel its worker.

```python
import asyncio
from collections.abc import Awaitable, Callable, Iterable


async def process_all(
    items: Iterable[int],
    process: Callable[[int], Awaitable[None]],
    *,
    workers: int,
) -> None:
    if workers < 1:
        raise ValueError("workers must be positive")
    pending = iter(items)

    async def worker() -> None:
        for item in pending:
            await process(item)

    async with asyncio.TaskGroup() as group:
        for _ in range(workers):
            group.create_task(worker())


async def main() -> None:
    total = 0
    active = 0
    peak = 0

    async def process(value: int) -> None:
        nonlocal total, active, peak
        active += 1
        peak = max(peak, active)
        try:
            await asyncio.sleep(0)
            total += value
        finally:
            active -= 1

    await process_all(range(1000), process, workers=4)
    assert total == 499500
    assert peak == 4
    assert active == 0


if __name__ == "__main__":
    asyncio.run(main())
```

Workers advance the shared iterator on the same thread before awaiting. The helper retains O(workers) task state and current items. It has no separate input queue or result collection. The caller owns the source's storage and cleanup. The callback owns its internal buffering and any additional tasks.

Pull order follows the iterator. Completion order depends on the callback. A callback that completes without suspension can let one worker consume many items. Async syntax alone does not guarantee fairness. The demonstration explicitly yields to show overlapping calls.

## Propagate failure

Python `TaskGroup` waits for its children. A child's ordinary exception cancels the remaining children, then the group raises collected failures as an `ExceptionGroup`. Exceptions from the group's body can join that group. `KeyboardInterrupt` and `SystemExit` receive special propagation after child shutdown.

A child ending with `CancelledError` is treated as cancelled. It is not handled as an ordinary failure. Independent child cancellation needs a separate application policy when every item must complete. Use `except*` to handle selected members of a failure group while other members propagate.

Failure can leave completed effects and consumed input. The helper provides no rollback or retry. Its caller must distinguish failed, completed, and unstarted work when recovery requires those categories.

## Define cancellation

Python cancellation requests inject `CancelledError` when the task next gets an opportunity to run. An await can complete without suspending, and blocking code prevents the event loop from delivering cancellation. Use `try/finally` or async resource scopes for cleanup, then let cancellation propagate. Further cancellation can interrupt cleanup awaits.

`asyncio.timeout()` and `wait_for()` use cancellation to enforce time limits. Cleanup and cancellation-resistant work can extend elapsed time beyond the nominal limit. A timeout is an observation by the caller. Remote effects may still complete.

Dropping a Rust future drops its stored values and stops polling that future. Spawned tasks and external effects may continue under their own owners. A task handle's drop or abort behavior is runtime-specific. Cancellation safety requires an interrupted operation to leave the state and resource outcome the caller expects.

Check empty input, the actual high-water bounds, processor failure, source failure, and caller cancellation. Observe cleanup and retained effects. Use [Resource lifecycle](./resource-lifecycle.md) for release duties and [State machine](./state-machine.md) when interrupted work has meaningful intermediate states.
