# 资源生命周期

资源具有有效使用期限，以及释放或完成义务。文件、锁、连接、租约、子进程及任务各有完成规则。明确所有者、可用期限、释放顺序及可观察的失败行为。

## 说明归属

- 所有者控制最终释放。返回拥有的值，可以将责任转移给调用方。
- 借用方在约定期限内使用资源。所有者继续负责释放。
- 租约提供对池拥有资源的临时访问。释放租约时，按池的契约归还或丢弃资源。
- 共享所有权需要释放协议。引用计数跟踪所有者。它不会同步访问或打破所有权环。

归属和可用性是不同属性。写入失败后，借用流仍归所有者持有。后续操作是否成功，取决于底层故障。出错后的连接在归还复用前，可能需要回滚、重置或丢弃。

## 明确完成契约

下面的 Rust 2021 示例借用任意 `Write` 实现，原样写入每个字符串并追加换行。调用方控制刷新及最终释放。`save_lines` 拥有缓冲文件，创建或截断目标，在返回成功前显式刷新。运行程序时传入输出路径。

```rust
use std::fs::File;
use std::io::{self, BufWriter, Write};
use std::path::Path;

fn write_lines<W: Write + ?Sized>(out: &mut W, lines: &[&str]) -> io::Result<()> {
    for line in lines {
        writeln!(out, "{line}")?;
    }
    Ok(())
}

fn save_lines(path: &Path, lines: &[&str]) -> io::Result<()> {
    let file = File::create(path)?;
    let mut out = BufWriter::new(file);
    write_lines(&mut out, lines)?;
    out.flush()
}

fn main() -> io::Result<()> {
    let mut bytes = Vec::new();
    write_lines(&mut bytes, &["hello", "世界"])?;
    bytes.write_all(b"done\n")?;
    assert_eq!(bytes, "hello\n世界\ndone\n".as_bytes());

    let path = std::env::args_os().nth(1).expect("pass an output path");
    save_lines(Path::new(&path), &["hello", "世界"])
}
```

错误通过 `io::Result` 传播，较早的写入可能保留。保存失败可能留下截断或部分写入的文件。`BufWriter` 在 drop 期间可能再次尝试写入，并忽略该次尝试的错误。成功路径上的显式 `flush` 使刷新失败可被观察。

刷新将缓冲内容交给底层文件。持久化存储及原子替换需要各自的操作和文件系统前提。Rust `File` 的 drop 忽略关闭错误。因此，析构完成与显式检查完成操作属于不同契约。

## 使用作用域清理

Rust RAII 将清理绑定到所有者的 drop。局部值通常在退出作用域时 drop，包括栈展开。进程 abort、终止、主动泄漏的值及引用环具有不同的行为。`Drop` 实现执行同步清理，缺少结果返回通道。

Python `with` 在管理器成功进入后调用退出方法，包括正文抛出异常时。退出实际执行什么，由管理器定义。数据库事务上下文可以提交或回滚，同时保持连接打开。必需的清理使用显式上下文作用域。避免依赖垃圾回收或 `__del__` 的时机。

在两种语言中，释放句柄、刷新输出、提交事务、确认消息及等待任务，都是不同操作。选择调用方需要观察的结果。

## 处理部分获取

先获取依赖，再获取依赖它的资源，释放时采用相反顺序。Rust 局部绑定及 Python 嵌套管理器可以表达该顺序。Python `ExitStack` 和 `AsyncExitStack` 支持动态数量的清理动作。

每项获取成功后就登记清理。Python 管理器进入失败时，需要自行清理部分获取的资源。只有进入成功后，才会调用退出方法。Rust 构造器返回错误时，应让已获取资源保留在具有相应 drop 清理行为的拥有值中。

已有失败时，清理仍可能失败。按 API 定义这些失败应传播、串联、聚合还是单独报告。上下文管理器抑制异常会改变操作控制流，需要明确的抑制契约。

## 负责长期资源

应用拥有的池和客户端归启动及关闭作用域。导入通常不适合作为活动连接的生命周期。池应停止新租约，在释放共享资源前处理现有借用。

异步清理可能需要显式等待关闭或作用域结束。Rust 普通 `Drop` 无法等待异步操作。Python `async with` 和 `try/finally` 提供清理位置，取消仍可能打断清理内部的等待。持有资源的异步生成器在迭代提前结束时需要作用域终结，例如 Python 的 `contextlib.aclosing()`。

关闭时 join 或等待拥有的工作，明确超过期限后剩余资源的处理。取消参见[异步并发](./async-concurrency.md)，事务完成参见[工作单元](../design-patterns/unit-of-work.md)。
