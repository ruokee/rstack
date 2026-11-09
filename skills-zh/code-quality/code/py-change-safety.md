# Python 变更安全性

检查 Python 函数内联时的求值保持。以下完整 Python 3.11+ 示例只调用一次 `read_value`，结果为读取值的两倍：

```python
def run():
    reads = []

    def read_value():
        reads.append(1)
        return len(reads)

    def double(value):
        return value + value

    original = double(read_value())
    assert (original, len(reads)) == (2, 1)
    reads.clear()
    value = read_value()
    inlined = value + value
    assert (inlined, len(reads)) == (2, 1)


run()
```

替换成 `read_value() + read_value()` 会产生 `3`，并读取两次。临时变量承担保持求值的责任。
