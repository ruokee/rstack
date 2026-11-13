# Build the tool first

Tooling pays for itself when the effort it saves in execution or review exceeds the effort to create, explain, run, and maintain it. Complex one-off work can benefit when reproducibility makes the result practical to check.

Consider renaming a field across generated configuration files. A syntax-aware transformation can distinguish the field from a similar name inside a string. Understand one representative transformation first, including what must stay unchanged. Then give the smallest useful tool explicit inputs, outputs, and rerun semantics.

Compare its result with that understood unit before broader use. A consistent transformation can consistently encode the wrong assumption. Checks need an expectation grounded in the contract, separately from the mechanism producing the result.

Choose the form from the current work. A query or direct command may be enough; a repeatable transformation may deserve a retained script. Keep rerun instructions and interpretation available when another person needs to inspect the result. A couple of clear local edits may cost less to do directly.

Use [Encode lessons in structure](./encode-lessons-in-structure.md) when the problem is enforcing an established recurring rule. This principle addresses the economics and checkability of the work being performed.
