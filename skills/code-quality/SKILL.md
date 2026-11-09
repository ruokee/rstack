---
name: code-quality
description: Use when checking the quality of code, tests, code designs, refactoring candidates, or migration candidates, or selecting or configuring quality settings such as formatting, lint, custom rules, and type checking.
metadata:
  version: "1.0.0"
---

# Code quality

Judge code, tests, and code designs against the project's confirmed contracts, constraints, and quality goals. Quality tooling needs explicit checking capabilities and effective scope. The current task supplies scope, output format, and workflow.

## Evidence

- A finding identifies a concrete contract violation or actual maintenance cost. Code describes current behavior. A claim that a path is correct needs that path's confirmed contract. Principle names, line counts, implementation counts, and personal preferences are investigation signals.
- Separate observed facts, inferences, judgments, and recommendations. A behavioral finding needs a counterexample within the confirmed contract: a legal input or execution, the required result, and the result derived from the implementation or design. Keep the supplied definitions and confirmed preconditions fixed in that counterexample. A maintenance finding demonstrates cost in current use, actual change history, or a confirmed upcoming change.
- Check the strongest relevant counterevidence: an established precondition, a wrapper's translation responsibility, or an interaction that is itself contractual. Withdraw or narrow findings when that evidence changes the conclusion.
- In a code excerpt, the supplied declarations and stated collaborator contracts define the example's entities. Establish additional external behavior or module ownership from inspected sources or confirmed contracts. A reproduction demonstrates behavior under its setup; its assumptions need independent support.
- Zero findings is valid. Combine manifestations of one cause while retaining the locations and distinct consequences needed to act.

## References

Read the general reference matching the current question, then follow its language guidance for concrete mechanisms and runnable examples:

- For values, errors, state, resources, concurrency, or a design's promised behavior, read [Correctness](./code/correctness.md).
- For mixed responsibilities, duplicated rules, coupling, unnecessary indirection, change cost, or boundary wrappers that translate units, errors, or representations, read [Structural quality](./code/structure.md). For wrappers, compare responsibilities and source-to-public contract mappings.
- For a refactoring or migration candidate that changes evaluation, state, ownership, imports, or callers, read [Change safety](./code/change-safety.md).
- For assertions, expected results, behavior coverage, or test-first feedback, read [Behavioral tests](./testing/behavior.md).
- For timing, order, shared state, external resources, or concurrent tests, read [Test reliability](./testing/reliability.md).
- For fragile assertions, obscure fixtures, duplicate tests, or low-value coverage, read [Test maintenance](./testing/maintenance.md).
- For formatting, lint rules, custom checks, effective files, exceptions, or automatic fixes, read [Lint settings](./tooling/lint.md).
- For type-checking scope, strictness, dynamic boundaries, or type escapes, read [Type checking](./tooling/type-checking.md).

Load only references relevant to the judgment. Multiple references can serve one question. If the code-design Skill is available, its design material can provide further guidance. In this Skill, `code-design/…` denotes reference files within code-design.

## Results

Follow the caller's requested format to report code-quality analysis of the current object, including code reviews, repository analysis, and quality-tooling settings. Lead with supported findings when present. Classify each item by its evidence:

- A supported finding establishes its necessary premises and gives the location, supported triggering conditions, impact, and smallest sufficient repair direction. Severity describes the consequences; confidence describes the evidence strength.
- A clarification question asks for a missing fact whose answer is needed for an in-scope judgment and identifies the affected judgment. Keep every unconfirmed premise explicit in conditional consequences. Resolve those premises before prescribing a repair or assigning severity and confidence.
- Checked coverage records satisfied contracts and contract-excluded inputs. A zero-finding result states the object, coverage, and checks actually performed.

Apply this classification and finding standard throughout the report, including its summary and repair recommendations.

Tool diagnostics retain their tool attribution and original locations. Group duplicate diagnostics and add the relevant contract or repair tradeoff. A request specifically for tool results receives those diagnostics directly.

For tooling requests, explain the target quality problem, selected checks, effective files, strictness, exceptions, diagnostic meaning, and verification. Separate existing defects from proposed constraints.

Analysis and advice follow the current task's scope. Applying fixes, writing configuration, creating tests, and restructuring code require their corresponding authorization. The current task determines check cadence, commits, rollback, and deployment.
