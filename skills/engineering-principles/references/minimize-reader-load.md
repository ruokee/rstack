# Minimize reader load

Consider a reader investigating why one request used a particular timeout. They need both the route to the value and the facts that could have changed it. Each indirection adds a lookup; each mutable dependency adds something to remember.

Trace a representative question through the design. Note where the reader must leave the current operation, recover a distant assumption, or remember an earlier state. A short file can still depend on extensive hidden context. Several well-defined modules can make a complex operation easier to follow.

Judge a boundary by the knowledge it saves. `read_timeout_seconds` can usefully own conversion to a millisecond-based API even with one caller. A wrapper that only renames that operation adds a lookup. Its caller count supplies a clue about reuse; its responsibility decides whether to keep it.

Make state ownership visible. Limit where and when values can change, pass relevant inputs explicitly, and derive a value from its authority when separate copies would need synchronization. Readers can then establish the applicable invariant from the operation's contract.

Apply the same question to documents: can readers find the rule and its conditions together, or must they assemble fragments from several pages? Use [Protect context](./protect-context.md) for selecting evidence during the work itself.
