# Make foundational decisions first

A decision belongs early when changing it would invalidate several pieces of later work. Identify those dependencies before building their consumers.

For a bulk importer, the treatment of duplicate records affects the input representation, lookup structure, writer, and progress reporting. Agree on the record identity and required update semantics first. These decisions let the dependent parts implement the same operation.

Use confirmed access patterns to choose the data structure. Identify who owns each state change, including objects used concurrently. If two participants can update one object, resolve their relationship through [Isolate before sharing](./isolate-before-sharing.md).

Order the work by those dependencies. Shared types or an existing tool may supply everything needed. New infrastructure earns priority when the current consumers require it. Similar-looking local statements can remain independent until their common meaning is established.

Independent edits can proceed alongside an unresolved foundation. A broad framework creates additional decisions and consumers; its cost needs a requirement of its own.
