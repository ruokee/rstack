# Fix root causes

A causal repair changes the mechanism that produces a contract violation. Start with the reported behavior, its expected result, and the existing evidence. Preserve the input and conditions needed to explain that difference.

A download may appear successful while leaving a truncated file. Hiding the failure preserves the incomplete result. Tracing the byte count and write loop may reveal that a partial write was treated as a complete write. Correcting that interpretation repairs the promised output. An input validator can likewise be the right repair when accepting invalid input is where the contract first breaks.

Follow the relevant transitions and dependencies. When several explanations fit, obtain an observation that distinguishes them. Find related paths governed by the same faulty rule within the authorized scope, and correct the rule at its owner.

For failures associated with restart, persisted state and lifecycle transitions are candidates when supported by evidence. Recovery after clearing state establishes that the changed state matters. A stronger causal conclusion needs observations that identify the responsible property. Preserve useful evidence and obtain the required authorization for destructive cleanup.

Mitigation can restore operation while investigation continues. State which result the evidence supports, and check the original failure path after the repair through the assigned verification arrangement. Use [Attack the premise](./attack-the-premise.md) when successive repairs preserve a doubtful assumption.
