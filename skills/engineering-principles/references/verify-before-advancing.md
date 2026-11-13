# Verify before advancing

Verification belongs at the point where another decision starts relying on a result. This keeps a faulty premise from spreading into dependent work.

Suppose deployment tooling will read a new configuration format. Establish the parser's promised interpretation before the tooling adopts it. Documentation edits independent of that interpretation can proceed. The dependency determines which work must wait.

Choose a unit large enough to expose a complete, checkable result, including coordinated changes needed for that behavior. Several edits may be necessary before the result exists. Editing and debugging within the unit produce the candidate; the assigned verification role establishes the facts its successors need.

Keep the starting basis, candidate, expected property, and observed result clear. A changed predecessor reopens the successor assumptions affected by that change. Independent work can retain its established basis.

Use [Prove it works](./prove-it-works.md) for evidence matched to the unit's promise. Check timing follows what dependent work needs to know.
