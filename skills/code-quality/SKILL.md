---
name: code-quality
description: Use when checking the quality of code, tests, code designs, refactoring candidates, or migration candidates, or reviewing or configuring quality settings such as lint rules and type checking.
metadata:
  version: "1.0.0"
---

# Code quality

Judge code, tests, and code designs against the project's confirmed contracts, constraints, and quality goals. Quality tooling needs an explicit account of what it checks and where it applies. The current task supplies scope, permissions, output format, and workflow.

## Evidence

- A finding identifies a concrete contract violation or actual maintenance cost. Code describes current behavior. A claim that a path is correct needs that path's confirmed contract. Principle names, line counts, implementation counts, and personal preferences are investigation signals.
- Separate observed facts, inferences, judgments, and recommendations. A behavioral finding needs a counterexample within the confirmed contract: a legal input or execution, the required result, and the result derived from the implementation or design. Keep the supplied definitions and confirmed preconditions fixed in that counterexample. A maintenance finding demonstrates cost in current use, actual change history, or a confirmed upcoming change.
- Check the strongest relevant counterevidence: an established precondition, a wrapper's translation responsibility, or an interaction that is itself contractual. Withdraw or narrow findings when that evidence changes the conclusion.
- In a code excerpt, the supplied declarations and stated collaborator contracts define the example's entities. Establish additional external behavior or module ownership from inspected sources or confirmed contracts. A reproduction demonstrates behavior under its setup; its assumptions need independent support.
- Zero findings is valid. Combine manifestations of one cause while retaining the locations and distinct consequences needed to act.

## References

Read the reference matching the current question:

- For values, errors, state, resources, concurrency, or a design's promised behavior, read [Correctness](./correctness.md).
- For mixed responsibilities, duplicated rules, coupling, unnecessary indirection, or change cost, read [Structural quality](./structure.md).
- For assertions, expected results, behavior coverage, or test-first feedback, read [Behavioral tests](./testing/behavior.md).
- For timing, order, shared state, external resources, or concurrent tests, read [Test reliability](./testing/reliability.md).
- For fragile assertions, obscure fixtures, duplicate tests, or low-value coverage, read [Test maintenance](./testing/maintenance.md).
- For a refactoring or migration candidate that changes evaluation, state, ownership, imports, or callers, read [Refactoring risk](./refactoring.md).
- For lint rules, file scope, exceptions, or automatic fixes, read [Lint settings](./tooling/lint.md).
- For type-checking scope, strictness, dynamic boundaries, or type escapes, read [Type checking](./tooling/type-checking.md).

Load only references relevant to the judgment. Multiple references can serve one question. Design references linked from them are in the same-language `code-design` package. In OMP, take `<path>` from the link target after `code-design/` and read `skill://code-design/<path>`, for example `skill://code-design/approaches/resource-lifecycle.md`. Read the design leaves required by matching conditions in each loaded reference, then continue the current check with its existing output and permissions. A complete replacement design uses the [code-design entry](../code-design/SKILL.md). Report missing resources by path and affected judgment; complete the supported remainder.

## Results

Follow the caller's requested format. For an ordinary review, lead with supported findings. Classify each item as a supported finding, a clarification question, or checked coverage. Once a finding's necessary premises are established, give its location, supported triggering conditions, impact, and smallest sufficient repair direction, with severity and confidence. Severity describes consequences; confidence describes evidence strength. A missing premise becomes a clarification question when its answer is needed for an in-scope judgment; name the missing fact and affected judgment. Record satisfied contracts and contract-excluded inputs under coverage. Repair recommendations address supported findings. Apply this classification and finding standard throughout the report, including its summary and repair recommendations. A zero-finding result states the object, coverage, and checks actually performed.

Tool diagnostics retain their tool attribution and original locations. Group duplicate diagnostics and add the relevant contract or repair tradeoff. A request specifically for lint or type-checker results receives those diagnostics directly.

For tooling requests, explain the target quality problem, selected checks, effective files, strictness, exceptions, diagnostic meaning, and verification. Separate existing defects from proposed constraints.

Review, advice, and modification each follow the current task's authorization. Applying fixes, changing configuration, creating tests, and restructuring code require their corresponding permission. A migration review reports omitted callers and residual paths; the implementation's clean-cutover obligation remains a criterion for that judgment.
