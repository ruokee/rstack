# 装饰器

GoF 装饰器包装组件，在相同接口上增加行为。每个包装器拥有一项职责，其余工作委托给组件。按语言及表示方式，组合可以是静态或动态的。

## 保持行为契约

方法名相同不足以建立可替换性。需要检查接受的输入、结果含义、失败行为、部分效果及完成方式。符合公开契约时，包装器可以缓冲、限量、压缩或观察操作。

顺序影响语义。缓冲位于限量写入器外部时，可能将限量失败推迟到刷新。限量器位于缓冲外部时，限制的是缓冲接受的字节。压缩会改变外层限量器所衡量的字节数。

## 限制写入量

下面的 Rust 2021 装饰器向遵守 `Write` 契约的实现转发最多剩余额度的字节，保留部分写入数量并转发刷新。额度耗尽时，`write` 返回零，因此 `write_all` 对剩余非空输入报告 `WriteZero`。

```rust
use std::io::{self, Write};

struct Limited<W> {
    inner: W,
    remaining: usize,
}

impl<W: Write> Write for Limited<W> {
    fn write(&mut self, bytes: &[u8]) -> io::Result<usize> {
        let limit = bytes.len().min(self.remaining);
        if limit == 0 {
            return Ok(0);
        }
        let written = self.inner.write(&bytes[..limit])?;
        self.remaining -= written;
        Ok(written)
    }

    fn flush(&mut self) -> io::Result<()> {
        self.inner.flush()
    }
}

fn main() {
    let mut output = Vec::new();
    {
        let mut writer = Limited { inner: &mut output, remaining: 3 };
        let error = writer.write_all(b"hello").unwrap_err();
        assert_eq!(error.kind(), io::ErrorKind::WriteZero);
        writer.flush().unwrap();
    }
    assert_eq!(output, b"hel");
}
```

包装器无需增加缓冲或分配。这里通过 `&mut Vec<u8>` 借用目标，vector 拥有自身存储。失败的 `write_all` 可以留下已写前缀。刷新是单独操作，也可能失败。

## 保持组合清楚

公开必要的结束操作及归属。拥有资源的装饰器可以适合流的生命周期。作用域机制也可以包围单次调用。选择取决于新增行为从何时开始、到何时结束。

Python 的 `@` 语法应用 callable 转换，可以实现包装、注册或替换。仅凭语法无法确定是否属于 GoF 模式。函数包装器应通过 `functools.wraps` 保留相关元数据，并遵守实际调用及失败契约。

接口转换参见[适配器](./adapter.md)。代理具有相似包装结构，目的在于访问控制或间接访问。保持各层顺序及成本可见。
