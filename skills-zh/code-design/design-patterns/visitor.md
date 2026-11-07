# 访问者

访问者跨一组节点类型组织操作。在经典 GoF 形式中，各节点的 `accept` 调用访问者对应节点类型的方法，形成双重分发。新访问者增加操作，节点族保持稳定。

## 选择扩展方向

访问者让操作专属逻辑集中维护。增加节点种类时，所有需要理解它的访问者都会受到影响。对于自有封闭枚举，穷尽匹配可以直接表达同一操作。对于库提供的树，其 visitor API 通常给出了预期遍历契约。

操作无需节点专属知识时，可以使用共同方法。小型结构可以直接使用递归函数。关键区别在于什么需要独立变化。能够创建多少访问者类不构成选择依据。

## 安排遍历责任

选择一个遍历所有者：访问者、节点或外部遍历器。按实际结构定义子节点顺序、剪枝、重复引用及循环处理。将树遍历直接用于图，可能重复访问或无法终止。

有意选择未知节点策略：拒绝、遍历其子节点，或执行明确的通用操作。部分收集器适合默认遍历。求值器可能需要穷尽处理，以免接受不支持的语义。

## 收集读取名称

下面的 Python 3.11 示例解析一个表达式，收集 `Load` 上下文中的标识符。它进行语法收集，因此也包含 lambda 内部的已绑定名称。它不计算自由变量，也不执行表达式。解析错误原样传播。

```python
import ast


class LoadedNames(ast.NodeVisitor):
    def __init__(self) -> None:
        self.names: set[str] = set()

    def visit_Name(self, node: ast.Name) -> None:
        if isinstance(node.ctx, ast.Load):
            self.names.add(node.id)


def loaded_names(source: str) -> set[str]:
    visitor = LoadedNames()
    visitor.visit(ast.parse(source, mode="eval"))
    return visitor.names


assert loaded_names("item.price + discount(total)") == {"item", "discount", "total"}
assert loaded_names("(lambda x: x + offset)(3)") == {"x", "offset"}
```

`NodeVisitor.visit` 按节点类名分发，默认 `generic_visit` 遍历子节点。这里的 `Name` 没有需要遍历的表达式子节点。覆盖复合节点的方法时，子节点属于目标范围就需要显式继续遍历。

## 保持遍历成本可见

示例保留解析树及不同读取名称的集合。递归访问者还使用与嵌套深度相关的调用栈空间。转换操作需要另外定义节点是修改、复制还是替换，以及怎样保留源码位置。

单项操作的算法变化参见[策略](./strategy.md)，节点表示选择参见[数据建模](../approaches/data-modeling.md)。
