# Observer

Observer lets a subject notify registered subscribers without naming each concrete reaction in its publishing code. The subject owns subscription bookkeeping; subscribers own their handlers and the decision to subscribe. Use direct calls for a fixed sequence whose order and completion are part of one operation.

## Define dispatch semantics

Specify subscription identity, duplicate subscriptions, removal, callback retention, order, mutation during dispatch, reentrancy, and failure propagation. Decide whether notification is synchronous or scheduled. Asynchronous dispatch also needs task ownership, completion, and queue bounds.

## Dispatch a snapshot

This Python 3.11 implementation is for one thread with synchronous callbacks. Each subscription receives a distinct token scoped to its `Signal`. Callbacks are strongly retained until removal. Removing an unknown token raises `KeyError`.

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

Each publish takes a snapshot in registration order. Subscription changes affect later snapshots, including a nested publish. Removing a callback during a dispatch leaves it in that dispatch's existing snapshot. Nested publishing runs immediately; handlers must avoid unbounded recursive cycles.

The first callback exception stops that publish and propagates unchanged. Earlier effects remain. Each dispatch allocates a snapshot proportional to its subscriber count. This cost buys stable iteration while handlers change subscriptions.

## Own the lifecycle

The component that subscribes must arrange removal when the subscription should end. Weak references change retention semantics and require a policy for disappearing subscribers. A token or scoped subscription can make that responsibility explicit.

Process-local callbacks provide process-local execution. Persistence, cross-process delivery, acknowledgement, and recovery require separate mechanisms. Follow [Event-driven](../approaches/event-driven.md) when those guarantees are needed.

An event states what happened. A [Command](./command.md) requests an operation. Observer distributes reactions; a mediator can instead own a coordinated interaction among participants.
