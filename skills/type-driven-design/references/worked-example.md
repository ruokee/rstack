# Batch import example

This constructed example derives a model from an operation, then uses that target to repair an existing implementation. All Python blocks on this page can be concatenated in order into one program using Python 3.11 or later. The blocks labeled as old code are executable diagnostic examples.

## Contract

A batch requests source identifiers in order. Every requested identifier exists in the supplied catalog. A source contains text and dynamic labels. Each text line produces one row; a line starting with `!` rejects that source with the offending line in the reason. Empty text succeeds with zero rows.

Batch identifiers and source identifiers refer to different concepts. Results preserve request order. Each source produces either rows or a nonempty failure reason. The summary counts successful and failed sources. A successful source with zero rows counts as one success.

An existing external format has exactly these fields: `source`, `status`, `rows`, and `error`. Status is `ok` or `error`. Success uses a list of row strings and a null error. Failure uses null rows and a nonempty error. Existing history can contain incomplete failures whose reason is null. Such records require an authoritative reason or an explicit information-gap error.

## Derive the target

The catalog is a real mapping. Labels are also a real mapping. Rows and results are homogeneous ordered sequences. Success and failure require different payloads, so give each a record. The summary names its two counts.

```python
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from typing import Literal, NewType, TypeAlias, TypedDict, assert_never

BatchId = NewType("BatchId", str)
SourceId = NewType("SourceId", str)


@dataclass(frozen=True, kw_only=True)
class Row:
    text: str


@dataclass(frozen=True, kw_only=True)
class Source:
    text: str
    labels: Mapping[str, str]


@dataclass(frozen=True, kw_only=True)
class Imported:
    source_id: SourceId
    rows: tuple[Row, ...]


@dataclass(frozen=True, kw_only=True)
class Rejected:
    source_id: SourceId
    reason: str

    def __post_init__(self) -> None:
        if not self.reason:
            raise ValueError("a rejection requires a reason")


ImportResult: TypeAlias = Imported | Rejected


@dataclass(frozen=True, kw_only=True)
class ImportSummary:
    succeeded: int
    failed: int


@dataclass(frozen=True, kw_only=True)
class BatchReport:
    batch_id: BatchId
    results: tuple[ImportResult, ...]
```

`NewType` gives the checker distinct identifier roles while retaining strings at runtime. Keyword arguments explain same-typed field roles. `Rejected.__post_init__` checks the reason in generated-constructor calls. Field annotations rely on checked, typed callers. The frozen records restrict ordinary field rebinding. `Source.labels` is borrowed read access; another holder of the dictionary can still change it. The operation below reads text and leaves labels untouched.

An additional class around the catalog or every label would add construction work without a new responsibility here. The union alias names an existing expression. Counts remain integers whose meaning comes from field names and their producer. See [Python](./python.md) for the mechanism choices and guarantee boundaries.

## Produce the results

```python
def import_source(*, source_id: SourceId, source: Source) -> ImportResult:
    rows: list[Row] = []
    for line in source.text.splitlines():
        if line.startswith("!"):
            return Rejected(source_id=source_id, reason=f"invalid row: {line}")
        rows.append(Row(text=line))
    return Imported(source_id=source_id, rows=tuple(rows))


def run_batch(
    *,
    batch_id: BatchId,
    requested: Sequence[SourceId],
    catalog: Mapping[SourceId, Source],
) -> BatchReport:
    return BatchReport(
        batch_id=batch_id,
        results=tuple(
            import_source(source_id=source_id, source=catalog[source_id])
            for source_id in requested
        ),
    )
```

The catalog lookup depends on the stated existence precondition. `KeyError` exposes a caller violating it. A `SourceId` value by itself carries the static role distinction. The catalog establishes existence during this operation.

## Consume the results

```python
def display(result: ImportResult) -> str:
    if isinstance(result, Imported):
        return f"{result.source_id}: imported {len(result.rows)} rows"
    if isinstance(result, Rejected):
        return f"{result.source_id}: rejected: {result.reason}"
    assert_never(result)


def summarize(results: Sequence[ImportResult]) -> ImportSummary:
    succeeded = 0
    failed = 0
    for result in results:
        if isinstance(result, Imported):
            succeeded += 1
        elif isinstance(result, Rejected):
            failed += 1
        else:
            assert_never(result)
    return ImportSummary(succeeded=succeeded, failed=failed)
```

The branch selects a result case. The row count is a separate fact. With a strict checker covering these functions, `assert_never` exposes a missing case if the union grows. At runtime, reaching it raises an exception.

## Preserve the boundary

The wire shape intentionally retains its existing dictionary interface. This `TypedDict` describes already shape-checked data. A real JSON or database adapter must establish field presence and field types before passing data to `from_wire`. `from_wire` checks the relationships between these fields and identifies incomplete history.

```python
class WireResult(TypedDict):
    source: str
    status: Literal["ok", "error"]
    rows: list[str] | None
    error: str | None


class HistoryGap(ValueError):
    pass


def to_wire(result: ImportResult) -> WireResult:
    if isinstance(result, Imported):
        return {
            "source": result.source_id,
            "status": "ok",
            "rows": [row.text for row in result.rows],
            "error": None,
        }
    if isinstance(result, Rejected):
        return {
            "source": result.source_id,
            "status": "error",
            "rows": None,
            "error": result.reason,
        }
    assert_never(result)


def from_wire(record: WireResult) -> ImportResult:
    source_id = SourceId(record["source"])
    if record["status"] == "ok":
        rows = record["rows"]
        if rows is None or record["error"] is not None:
            raise ValueError("invalid success payload")
        return Imported(source_id=source_id, rows=tuple(Row(text=x) for x in rows))
    if record["rows"] is not None:
        raise ValueError("invalid failure payload")
    reason = record["error"]
    if not reason:
        raise HistoryGap(f"missing failure reason for {source_id}")
    return Rejected(source_id=source_id, reason=reason)


def read_history(records: Sequence[WireResult]) -> tuple[ImportResult, ...]:
    return tuple(from_wire(record) for record in records)
```

The external schema owns field names and null conventions. The adapter owns the mapping. The row-list allocation is needed for that external contract. The internal tuple holds the operation's ordered result. This example has no serialization dependency.

## Use the model

```python
catalog = {
    SourceId("full"): Source(text="alpha\nbeta", labels={"team": "stock"}),
    SourceId("empty"): Source(text="", labels={}),
    SourceId("bad"): Source(text="!broken", labels={"team": "stock"}),
}
report = run_batch(
    batch_id=BatchId("batch-7"),
    requested=(SourceId("full"), SourceId("empty"), SourceId("bad")),
    catalog=catalog,
)
for result in report.results:
    print(display(result))
print(summarize(report.results))
wire = [to_wire(result) for result in report.results]
restored = read_history(wire)
print(summarize(restored))
print(wire[1])
```

The contract gives these expected results:

```text
full: imported 2 rows
empty: imported 0 rows
bad: rejected: invalid row: !broken
ImportSummary(succeeded=2, failed=1)
ImportSummary(succeeded=2, failed=1)
{'source': 'empty', 'status': 'ok', 'rows': [], 'error': None}
```

A checker should reject a `BatchId` supplied as `source_id` and reading `.reason` on an unnarrowed `ImportResult`. Keep such negative calls separate from the runnable program. They exercise static distinctions. Zero-row success, restoration, and error preservation require runtime observations as well.

## Diagnose the old model

Suppose the old internal model copied the external fields. The following declarations and consumers illustrate the defect:

```python
@dataclass(kw_only=True)
class OldResult:
    source_id: SourceId
    status: Literal["ok", "error"]
    rows: tuple[Row, ...] | None
    error: str | None


def old_display(result: OldResult) -> str:
    if result.rows:
        return "success"
    return "failure"


def old_success_count(results: Sequence[OldResult]) -> int:
    return sum(result.status == "ok" for result in results)


old_empty = OldResult(source_id=SourceId("empty"), status="ok", rows=(), error=None)
print(old_display(old_empty))
print(old_success_count((old_empty,)))
```

The first output is `failure`; the second is `1`. Both consumers use the same record. One treats rows as evidence of success, while the other uses status. The confirmed contract makes the first interpretation wrong. A populated success works through both paths and supplies a control.

The representation lets status and optional payloads vary independently. Repeated consumer-side interpretation sustains the disagreement. Fixing the truthiness check would repair this caller. The target union also places the confirmed alternatives and their payloads together for all affected internal uses. Choose that wider change when the traced consumers justify it. If the real defect were confined to an adapter dropping a reason, repair the adapter and reassess the need for a model replacement.

The field similarity supports an observation about the current mechanism. Historical intent needs a decision record or other evidence. The external contract explains why the wire shape remains necessary today.

## Complete the migration design

Before changing either use path, cover the entire scope:

- `OldResult.status == "ok"`, rows present, and error null map to `Imported`, including empty rows.
- `OldResult.status == "error"`, rows null, and a nonempty error map to `Rejected`.
- Conflicting combinations are conversion errors. A missing failure reason is an information gap.
- Immediate import and display use `import_source` and `display`. History reading and summary use `read_history` and `summarize`.
- Both paths emit the fixed external format through `to_wire`. Persisted records retain that format. Internal result ownership moves to the union; the external schema remains authoritative for stored field names.
- The nonempty reason is the existing failure contract. Changing how sources succeed would be a separate policy change.

For historical gaps, retrieve a reason only from an authoritative record tied to the same source and import attempt. Otherwise return the explicit conversion error for the responsible operator to resolve. Here the program exposes the gap:

```python
incomplete: WireResult = {
    "source": "old-bad",
    "status": "error",
    "rows": None,
    "error": None,
}
try:
    from_wire(incomplete)
except HistoryGap as exc:
    print(exc)
```

Expected output is `missing failure reason for old-bad`. A default such as `unknown` would invent a reason and erase the unresolved fact.

## Migrate coherent batches

### Immediate processing

Start with old immediate processing and old history reading. Move the immediate producer, display consumer, and external writer together to the target definitions above. Use `to_wire` where the operation writes its existing output. The historical reader continues to consume the unchanged stored format through its old path.

At this intermediate point, exercise a populated success, empty success, and failure through the new immediate path. Check the exact wire fields and confirm the old historical path can still read the emitted records. Finish this batch when the immediate callers use the union and their old internal producer and display code can be removed.

### Historical reading

Start with the new immediate path and old historical interpretation. Move the historical producer and summary consumer together to `read_history` and `summarize`. The stored format and external consumers keep their contract. Apply the gap policy above to incomplete records.

At this intermediate point, compare summaries from immediate results and their restored wire records. Check empty success, preserved failure reasons, conflicting fields, and the explicit historical gap. Finish when historical consumers use the target and their corresponding old paths can be removed.

### Finish the cutover

Remove `OldResult`, `old_display`, `old_success_count`, and any obsolete internal conversions after all scoped callers migrate. Keep the external adapter because it still serves the live protocol. Update affected documentation and checks. Revisit the original disagreement on the actual producer-to-consumer paths.

Code rollback, stored-data recovery, and external effects have separate responsibilities. Here storage stays in the existing format, so code batches can retain that boundary. A real operation that rewrites data or causes external effects needs recovery based on those actual changes. Same-release callers that can switch together need no compatibility layer. For a small project, the two dependency-complete batches can be delivered together.
