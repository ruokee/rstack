# 正确性

正确性指在合法输入及执行条件下满足已确认契约。发现需要将具体实现或设计决定与可重现的值、状态转移、失败或允许的交错联系起来。

## 值

检查单位、精度、范围、空值、身份、顺序及表示转换。确认哪一方负责建立前置条件。调用方已经建立所需不变量时，可以构成相关反证。运行时校验遵循项目真实输入契约。

类型注解、不可变字段及命名约定各自提供语言机制支持的保证。宣称不变量保持前，核对构造、修改、别名及访问路径。表示设计见[数据建模](../code-design/approaches/data-modeling.md)或[状态机](../code-design/approaches/state-machine.md)。

## 错误

检查成功、业务拒绝及基础设施失败是否保留消费者需要的区别。错误映射可能丢失重试资格、责任归属，或副作用是否已经发生的信息。请求发出后的超时可能留下结果未定的副作用。

以下完整示例使用稳定 Rust 2021，保留两种已声明的错误分类。`Transport` 必须与业务拒绝保持可区分：

```rust
#[derive(Debug, PartialEq)]
enum SdkError {
    Declined,
    Transport,
}

#[derive(Debug, PartialEq)]
enum PaymentError {
    Rejected,
    Unavailable,
}

fn map_error(error: SdkError) -> PaymentError {
    match error {
        SdkError::Declined => PaymentError::Rejected,
        SdkError::Transport => PaymentError::Unavailable,
    }
}

fn main() {
    assert_eq!(map_error(SdkError::Declined), PaymentError::Rejected);
    assert_eq!(map_error(SdkError::Transport), PaymentError::Unavailable);
}
```

将两种情况都映射为 `Rejected` 会丢失调用方需要的区别。是否重试是项目的独立策略。完整边界契约见[接口](../code-design/interfaces.md)或[适配器](../code-design/design-patterns/adapter.md)。

## 状态

追踪相关的创建、修改及观察路径。检查过期快照、共享可变别名、多写者及非法状态转移。先检查、稍后写入，可能允许其他参与者使前面的检查失效。

多副作用操作需要指出每个失败点之前已经完成的动作及调用方获得的信息。数据库事务覆盖实际参与事务的资源。远程调用及消息需要各自已确认的完成语义。业务规则来自项目，缺失规则使具体判断保持待澄清。

## 资源

提出采用迭代器的接口或修复建议，或判断资源所有权、清理、取消及迭代提前退出机制前，读取[资源生命周期](../code-design/approaches/resource-lifecycle.md)。

检查取得、部分初始化、移交、借用及释放，包含错误、取消、清理失败及超出资源所有者作用域的任务。

区分停止消费、关闭资源及取消在途工作。调用方可以继续持有暂停的迭代器。确定每项保证的所有者及实际完成动作。

## 并发

竞争问题需要给出合法交错及其后果。原子性、锁、事务隔离、取消及任务归属需要对应实际运行时。分别检查活跃操作、排队工作、保留结果及缓冲区的上限。仅在 I/O 周围使用 semaphore，仍可能产生无界数量的等待任务。

调度及容量契约见[异步并发](../code-design/approaches/async-concurrency.md)。审查设计时比较其承诺及表示方式。输入规模无界时，返回前收集全部结果与有界流式承诺冲突。指出该冲突，以及需要改变的契约或表示。

## 成本

分配、复制、重复 I/O、缓存增长及队列保留，需要依据已声明的资源或性能要求形成问题。说明输入规模及造成增长的机制。运行时间或吞吐量结论需要对应测量条件。区分从代码推导的容量判断及实测运行结果。
