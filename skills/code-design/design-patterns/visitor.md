# Visitor

Visitor organizes an operation across a family of node types. In the classic GoF form, each node's `accept` calls the visitor method for that node type, producing double dispatch. New visitors add operations while the node family stays stable.

## Choose the direction of extension

Visitors make operation-specific logic local. Adding a node kind then affects visitors that must understand it. With an owned closed enum, exhaustive matching can express the same operation directly. With a library-owned tree, its visitor API often provides the intended traversal contract.

Use a common method when an operation needs no node-specific knowledge. A simple recursive function can be sufficient for a small structure. The useful distinction is what changes independently, rather than how many visitor classes can be created.

## Assign traversal

Choose one traversal owner: the visitor, the nodes, or an external walker. Define child order, pruning, repeated references, and cycle handling for the actual structure. A tree walk applied to a graph can revisit nodes or fail to terminate.

Choose an unknown-node policy deliberately: reject it, traverse its children, or apply a defined generic operation. Default traversal is appropriate for some collectors. An evaluator may need exhaustive handling to avoid accepting unsupported semantics.

## Collect loaded names

This Python 3.11 example parses one expression and collects identifiers appearing in `Load` context. It performs syntactic collection, so bound names inside a lambda are included too. It does not compute free variables or execute the expression. Parse errors propagate.

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

`NodeVisitor.visit` dispatches by node class name. Its default `generic_visit` traverses children. `Name` has no expression children to traverse here. Overriding a method for a composite node requires explicitly continuing traversal when its children matter.

## Keep traversal costs visible

The example retains the parsed tree and the set of distinct loaded names. A recursive visitor also uses call-stack space proportional to nesting depth. Transformations must separately define whether nodes are mutated, copied, or replaced, and how source locations are preserved.

Read [Strategy](./strategy.md) for varying a single operation's algorithm and [Data modeling](../approaches/data-modeling.md) for choosing the node representation.
