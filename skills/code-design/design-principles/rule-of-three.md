# Rule of three

The Rule of Three is a reminder to learn from concrete cases before extracting a shared abstraction. Its familiar sequence is to implement directly, tolerate some repetition, and reconsider commonality as more cases appear. The useful evidence is how the cases vary and change.

## Look for a stable decision

Compare the required behavior, preconditions, failures, ownership, and reasons to change. State which decision would belong to a common operation and which variation would remain with each caller. A third occurrence can reveal a useful distinction. Three copies can also remain three independent policies.

For example, three exporters may share a record projection while differing in escaping, buffering, and completion. Extracting the projection can preserve those distinct contracts. A universal exporter with format flags may obscure them.

## Decide when to extract

Extract when the shared responsibility is known and the interface is cheaper to maintain than its callers' separate interpretations. A confirmed monetary rule or protocol contract may justify central ownership immediately. Use [DRY](./dry.md) to choose the form of that ownership.

Keep uncertain cases direct when their future variation is the main justification for abstraction. Keep enough locality that a later extraction remains practical. Occurrence counts are neither a prerequisite for a useful boundary nor evidence that a particular abstraction is correct.

## Reconsider a wrong abstraction

Repeated caller-specific branches, mode flags, and type escapes indicate that the common contract needs examination. Trace each exception to its actual requirement. Split independently changing behavior, or replace the abstraction with the shared decision the cases really have.

Use [KISS](./kiss.md) to compare total complexity and [YAGNI](./yagni.md) to separate current responsibilities from imagined capabilities.
