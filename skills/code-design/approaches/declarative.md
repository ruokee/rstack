# Declarative programming

Declarative code states a desired result, relationship, or rule and delegates execution to an evaluator. SQL, schemas, routing definitions, configuration, and transition tables use this approach in different ways. The evaluator's semantics determine what the declaration means.

## Know the evaluator

Define selection order, precedence, defaults, duplicate handling, missing values, and error locations where they affect the rule. State when evaluation occurs and whether it performs effects. A declaration can express decisions and sequencing when its language has a clear model for them.

For example, configuration layering needs a defined override order. A routing table needs a policy for overlapping matches. A schema used by a static checker has different guarantees from the same shape interpreted by a runtime validator.

## Declare a result

This self-contained SQLite query groups integer cent amounts and explicitly orders the result. It returns `east` with 170 cents and `west` with 80 cents. The engine chooses the execution plan.

```sql
WITH sales(region, cents) AS (
    VALUES ('east', 120), ('west', 80), ('east', 50)
)
SELECT region, SUM(cents) AS total_cents
FROM sales
GROUP BY region
ORDER BY region;
```

Grouping defines the aggregates. `ORDER BY` defines the output order. The query still has execution costs such as scanning, aggregation, and sorting; inspect the actual plan when those costs matter.

## Keep declarations inspectable

Use tables and schemas when they make the supported cases visible and the evaluation rules stay stable. A fixed dispatch table can separate selection from execution. Translate a missing key at the lookup boundary, then let the selected handler's own errors retain their meaning; see [Factory](../design-patterns/factory.md).

A declaration layer earns its cost when readers can trace a result or error back to the responsible rule. Provide useful source locations and evaluation diagnostics where the mechanism needs them. A custom DSL also creates parsing, tooling, and versioning obligations.

## Choose explicit code when clearer

Conditional effects and irregular lifetimes may be easier to express as ordinary control flow. Moving them into configuration changes where the complexity lives. Use an existing evaluator when its contract fits; avoid inventing one solely to make a local operation configurable.

See [Imperative](./imperative.md) for execution order, [Data modeling](./data-modeling.md) for representation, and [State machine](./state-machine.md) for declared transitions.
