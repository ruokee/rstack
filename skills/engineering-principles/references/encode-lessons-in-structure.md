# Encode lessons in structure

A recurring error can reveal a stable rule that deserves an enforcing mechanism. Establish the rule's scope and exceptions before deciding how to encode it.

Suppose translated documents repeatedly link to the wrong language version. A navigation check can compare each link against the repository's language pairing rule. Its coverage depends on recognizing the actual link forms and legitimate exceptions. A blanket ban on cross-directory links would impose a different rule.

Choose a mechanism that matches when the property is known. Types can express construction constraints; schema-derived output can share a definition; lint can detect a defined misuse; runtime checks can evaluate live state. Metadata is useful when a consumer actually interprets and enforces it.

Compare the needed coverage with bypass paths, false positives, and maintenance cost. Select the simplest mechanism providing the required guarantee. Retain the contract and explanations consumers need. Remove a repeated reminder when its meaning is fully covered.

A correction supplies evidence for examining a pattern. Generalize after the pattern is established. Rules requiring judgment continue to need clear prose and a useful example. Use [Build the tool first](./build-the-tool-first.md) for the separate question of making the current work cheaper to execute or inspect.
