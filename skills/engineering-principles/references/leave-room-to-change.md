# Leave room to change

Before a signature, stored value, or test makes a choice binding, ask: who relies on this today? If a maintainer changed it tomorrow, who else would have to act? Look at actual callers as well as written requirements. An undocumented dependency can still break.

Settle the guarantees that others need before they build on them. When tasks move into new directories, their IDs must stay stable if other tasks refer to them by ID. Migrate links that use the old paths. The first implementation can use one directory layout; identity and location already have distinct jobs.

Give a choice to the operator when its answer depends on the job at hand. For a file move, let the operator name directories to exclude from the reference scan. The preview reports those directories by name and scans only the remaining files. The scope is the operator's choice; the matches are a snapshot. Before the first write, scan that same scope again. A new reference inside it can invalidate the move. The scanner never needs to open an excluded directory, even to count skipped references.

Keep interchangeable choices inside the implementation. If a list promises chronological order, test that all records appear in order. Before requiring a particular order for ties, check how callers use the result. If a caller depends on ties retaining their input order, preserve and test that behavior. Either contract leaves the sorting algorithm to the maintainer. A public strategy switch would turn the algorithm itself into a promise.
