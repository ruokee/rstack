# 观察者

观察者让主题通知已注册订阅者，发布代码无需逐一指明具体响应。主题负责订阅管理，订阅者负责处理器及订阅决定。固定顺序的步骤，其次序和完成状态属于同一操作时，适合直接调用。

## 定义分发语义

说明订阅身份、重复订阅、移除、回调保留、顺序、分发中修改、重入及错误传播。选择同步通知或调度执行。异步分发还需要任务归属、完成方式及队列上限。

## 分发快照

下面的 Python 3.11 实现用于单线程同步回调。每次订阅获得独立令牌，令牌仅属于对应 `Signal`。移除前持续强引用回调。移除未知令牌抛出 `KeyError`。

```python
from collections.abc import Callable


class Signal:
    def __init__(self) -> None:
        self._handlers: dict[int, Callable[[str], None]] = {}
        self._next_id = 0

    def subscribe(self, handler: Callable[[str], None]) -> int:
        token = self._next_id
        self._next_id += 1
        self._handlers[token] = handler
        return token

    def unsubscribe(self, token: int) -> None:
        del self._handlers[token]

    def publish(self, event: str) -> None:
        for handler in tuple(self._handlers.values()):
            handler(event)


signal = Signal()
seen: list[str] = []
first = signal.subscribe(lambda event: seen.append("first:" + event))
signal.subscribe(lambda event: seen.append("second:" + event))
signal.publish("ready")
signal.unsubscribe(first)
signal.publish("done")
assert seen == ["first:ready", "second:ready", "second:done"]
```

每次发布按注册顺序建立快照。订阅变化影响后续快照，也包含嵌套发布。分发过程中移除回调，该回调仍保留在本次已有快照中。嵌套发布立即执行，处理器需避免无界递归循环。

首个回调异常终止本次发布，并按原样传播。之前的效果保留。每次分发按订阅者数量分配快照，以此在处理器修改订阅时保持稳定迭代。

## 管理生命周期

发起订阅的组件需要安排结束时的移除。弱引用改变保留语义，需要定义订阅者消失时的策略。令牌或作用域订阅可以让该责任明确。

进程内回调提供进程内执行。持久化、跨进程投递、确认及恢复需要独立机制。需要这些保证时参见[事件驱动](../approaches/event-driven.md)。

事件描述已发生事实，[命令](./command.md)请求执行操作。观察者分散响应，中介者可以集中协调参与者之间的交互。
