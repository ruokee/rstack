# 测试可靠性

可靠性问题需要指出测试对状态、顺序、时间、环境或调度的依赖，以及这些因素如何在已声明的执行条件下改变结果。说明具体干扰过程及失去的保证。

## 状态归属

每项测试需要拥有其可变状态及资源，包括文件、数据库行、端口、环境、全局状态及后台任务。固定共享目录可能让并行测试覆盖或删除彼此的输出。复用数据库夹具可能让后续测试依赖先前执行。

优先使用测试专属资源，确保断言失败后仍能清理。环境及全局状态补丁也需要在失败时恢复。释放目录或连接前核对仍在使用它的 worker 是否结束。集成场景可以有意共享系统，其隔离及清理契约需要涵盖这种共享。

## 完成条件

固定休眠假设工作会在无关的时长内结束。较慢机器及不同调度可能违反该假设。等待结果、任务完成、事件或明确状态。截止时间约束等待上限。它不能说明操作已经完成。

以下完整 Python 3.11+ 示例拥有自己的目录，等写入任务结束后再读取结果：

```python
import asyncio
from pathlib import Path
from tempfile import TemporaryDirectory


async def write_report(path):
    await asyncio.to_thread(path.write_text, "ready\n", encoding="utf-8")


async def check_report():
    with TemporaryDirectory() as directory:
        path = Path(directory) / "report.txt"
        async with asyncio.TaskGroup() as tasks:
            tasks.create_task(write_report(path))
        assert path.read_text(encoding="utf-8") == "ready\n"


asyncio.run(check_report())
```

TaskGroup 正常退出时，写入任务在断言及目录清理前结束。任务取消不会停止已经运行的 `to_thread` 函数。取消测试需要单独等待或协调线程，再释放其资源。相关归属问题见[资源生命周期](../../code-design/approaches/resource-lifecycle.md)或[异步并发](../../code-design/approaches/async-concurrency.md)。

## 确定性

时钟、时区、随机输入及环境决定断言时，需要控制相应因素。固定随机种子控制该生成器的输入序列。线程及任务交错需要单独控制，或使用对全部允许交错均成立的断言。

并发测试可以使用明确同步强制产生相关竞争。随机化及外部系统测试保留各自声明的执行条件。范围说明可重复性及失败含义。仅凭集成测试身份不足以忽略干扰。

## 依赖语义

需要真实依赖语义时使用真实依赖。fake 或 mock 应保留被测行为依赖的错误、顺序、事务、取消或并发语义。回显预设返回值检查的是准备逻辑。应用与依赖的真实集成应在相关边界验证。

不稳定失败需要指出状态或交错、观察到的影响及对应修复。重跑通过是另一次观察。它不能代替失败原因。隔离处置及永久修改沿用当前流程权限。
