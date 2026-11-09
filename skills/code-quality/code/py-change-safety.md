# Python change safety

Check evaluation preservation when inlining Python functions. This complete Python 3.11+ example calls `read_value` exactly once and produces twice the value read:

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

Substituting `read_value() + read_value()` produces `3` and two reads. The temporary preserves evaluation.
