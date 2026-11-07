# 函数式核心

函数式核心、命令式外壳是一种由 Gary Bernhardt 推广的方法。核心根据显式输入计算决策，外壳取得输入，执行 I/O、读取时钟、持久化及日志等副作用。

## 分离决策

选择输出可以由输入决定的规则，将时间、当前状态等观察作为值传入，返回结果、拒绝或预期效果的描述。将隐藏状态修改及外部观察留在计算之外。

纯函数可以只接受部分输入域，也可以返回错误。纯度描述外部可观察行为。它不能建立正确性、终止性或低算法成本。

## 计算费用

下面的 Python 3.11 示例对到期日之后的日历天数计费。费率和上限是同一约定币种的非负整数分。调用方保证输入类型正确，函数拒绝负金额参数。外壳按业务日历选择 `today`。

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

核心计算金额。将金额应用到账户一次、记录及通知，属于独立效果。其顺序和失败结果由外壳契约负责。

## 执行时维护一致性

基于快照的决策，在应用时可能过期。围绕相应读、决策、写操作，采用所需事务、条件更新、版本检查或独占所有者。单独的纯规划器无法防止并发更新。

部分操作需要多轮读取及决策。让每项有用决策保持明确，由外壳编排各轮。决策返回命令时，需要定义部分命令完成后的行为。参见[命令](../design-patterns/command.md)。

## 控制边界成本

保持外部契约时，可以修改函数私有的临时数据。避免仅为模仿不可变风格而复制大型结构。归属及布局成本参见[数据建模](./data-modeling.md)。

决策逻辑很少的 I/O 操作可以保留直接过程。外壳需要承担资源生命周期、事务完成及错误处理，其大小由这些职责决定。参见[命令式](./imperative.md)。
