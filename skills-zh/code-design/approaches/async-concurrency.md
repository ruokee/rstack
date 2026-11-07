# 异步并发

并发让操作拥有重叠的生命周期，并行让计算同时执行。根据工作内容、所需顺序、资源上限及运行时选择执行模型。操作能够在等待时让出执行权时，异步有用。阻塞或 CPU 密集代码仍需要合适的执行环境。

## 负责工作

每个任务需要一个观察完成、处理失败并等待关闭的所有者。结构化并发将相关工作放进统一生命周期，等子任务结束后再退出。分离任务则将这些责任交给更长期的所有者。

Python `asyncio` 通常在单个事件循环线程上交错执行任务。Rust future 在被轮询时推进。单独创建 future 不会将其调度执行。Rust runtime 可以在单线程或多线程上调度任务，派生规则、句柄归属及取消行为取决于该运行时。

将阻塞工作移到线程，可以保持事件循环可用。取消等待方不会自动停止正在运行的线程。需要安排持续工作的归属及资源生命周期。

## 分别约束数量

分别设置活动操作、存活任务、排队输入及保留结果的所需上限。信号量约束保护区域。每条输入都创建一个等待信号量的任务，仍会为每条输入保留任务。

固定 worker 可以读取有限的非阻塞迭代器。异步生产者可以向有界队列写入，等待容量向生产者施加背压。允许等待整批完成的工作适合批次。有序输出可能需要等待较慢的先前条目，并缓存后续结果。该缓存也应计入上限。

## 使用固定 worker

下面的 Python 3.11 示例接收有限的非阻塞整数可迭代对象及正整数 worker 数量。它创建 `workers` 个任务，每个任务最多执行一个 `process` 调用。回调完成条目及自己拥有的输出后再返回。worker 的取消归组或调用方负责。回调不得独立取消自己的 worker。

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

worker 在同一线程上推进共享迭代器，再执行等待。辅助函数保留 O(workers) 的任务状态及当前条目。它没有独立输入队列或结果集合。调用方负责来源的存储及清理，回调负责内部缓存和额外任务。

取出顺序遵循迭代器，完成顺序取决于回调。回调直接完成而未挂起时，一个 worker 可能连续消费多项。单独的 async 语法不保证公平性。演示显式让出执行权，以展示重叠调用。

## 传播失败

Python `TaskGroup` 等待子任务结束。子任务的普通异常会取消其他子任务，然后将收集的失败作为 `ExceptionGroup` 抛出。组正文的异常也可能加入其中。`KeyboardInterrupt` 和 `SystemExit` 在子任务退出后采用特殊传播规则。

以 `CancelledError` 结束的子任务被视为取消。它不按普通失败处理。要求每项工作完成时，独立子任务取消需要另外的应用策略。使用 `except*` 处理失败组中选定的成员，其他成员继续传播。

失败可能留下已完成效果及已消费输入。辅助函数不提供回滚或重试。恢复需要区分时，调用方应记录失败、完成及未开始的工作。

## 定义取消

Python 取消请求会在任务下次取得执行机会时注入 `CancelledError`。await 可能直接完成而未挂起，阻塞代码会妨碍事件循环交付取消。用 `try/finally` 或异步资源作用域清理，再让取消继续传播。后续取消可能打断清理内部的等待。

`asyncio.timeout()` 和 `wait_for()` 使用取消实施时间限制。清理及抵抗取消的工作可能让实际耗时超出名义限制。超时是调用方的观察，远程效果仍可能完成。

drop 一个 Rust future 会 drop 它保存的值，并停止轮询该 future。已派生任务及外部效果可能在自己的所有者下继续执行。任务句柄的 drop 或 abort 行为由运行时定义。取消安全要求被中断的操作留下调用方预期的状态及资源结果。

检查空输入、实际数量峰值、处理器失败、来源失败及调用方取消，观察清理和保留效果。释放责任参见[资源生命周期](./resource-lifecycle.md)，被中断工作具有有意义的中间状态时，参见[状态机](./state-machine.md)。
