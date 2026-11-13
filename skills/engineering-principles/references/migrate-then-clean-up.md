# Migrate then clean up

A replacement is complete when consumers use the adopted contract and the retired contract has no remaining responsibility. Leaving both active makes future changes answer for both.

Consider moving a guide to a new entry point. Update the links that readers follow, generated navigation, examples, and references to the old title. Publishing the new page while leaving the old route in ordinary use creates two maintenance locations.

Trace actual consumption, including callers, imports, configuration, documents, and behavior checks. Move those consumers together where a coordinated change is possible. Remove interfaces, aliases, adapters, and explanations whose purpose has ended within the authorized scope.

External clients or published links may carry a real compatibility obligation. Identify the supported consumers, the transition they need, and its end condition or review date. A required redirect or adapter has a concrete job. Hypothetical consumers provide no such requirement.

Behavior checks should follow the confirmed new contract. Resolve a conflicting expectation against that contract before revising the check or implementation. A check tied solely to retired internals can retire with them. See [Outcome-oriented execution](./outcome-oriented-execution.md) for continuity during the transition.
