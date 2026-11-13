# Redesign from first principles

A new requirement can expose an assumption built into the original structure. Evaluate the affected design against the complete requirement, including the new part, as though choosing its structure for the first time.

For example, a document publisher gains scheduled publication. A function that accepts content and immediately returns a public URL may embody an immediate-publication assumption. Consider which result callers need while publication is pending, what owns the schedule, and how examples explain that result. Adding a timer alone leaves those questions unanswered.

Start with the required behavior and constraints. Derive suitable responsibilities and representations, then compare them with the existing design. Keep existing structures that already fit. Limit the redesign to the affected, authorized scope.

Carry the chosen contract through its types, consumers, documentation, examples, and rationale. A coherent result may require changes outside the first function where the requirement appeared. Use [Migrate then clean up](./migrate-then-clean-up.md) to adopt it completely.

This inquiry starts from an established requirement. Use [Attack the premise](./attack-the-premise.md) when the uncertain part is a factual assumption behind a failure.
