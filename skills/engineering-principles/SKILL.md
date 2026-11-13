---
name: engineering-principles
description: Use when designing, implementing, changing, or reviewing engineering artifacts such as code, documentation, and configuration.
metadata:
  version: "1.0.0"
---

# Engineering principles

Select and read relevant principles, then apply them within the task's constraints.

- [Open closed principle](../code-design/design-principles/solid.md#open-closed-principle): Isolate variation and protect stable contracts.
- [Don't repeat yourself (DRY)](../code-design/design-principles/dry.md): Centralize confirmed shared knowledge.
- [Single responsibility](../code-design/design-principles/solid.md#single-responsibility): Organize responsibilities by their reasons to change.
- [Hide details](../code-design/design-principles/deep-modules.md): Keep implementation details behind boundaries.
- [Dependency inversion](../code-design/design-principles/dependency-inversion.md): Let consumers' needs define the contract.
- [Liskov substitution](../code-design/design-principles/solid.md#liskov-substitution): Make replacement implementations honor behavioral contracts.
- [Interface segregation](../code-design/design-principles/solid.md#interface-segregation): Provide the capabilities each consumer needs.
- [Law of Demeter](../code-design/design-principles/law-of-demeter.md): Reduce knowledge of other objects' internal structure.
- [Composition over inheritance](../code-design/design-principles/composition-over-inheritance.md): Distinguish implementation reuse from behavioral substitution.
- [Rule of Three](../code-design/design-principles/rule-of-three.md): Use repetition and variation to judge when to abstract.
- [GRASP](../code-design/design-principles/grasp.md): Assign behavior to a suitable owner.
- [Deep modules](../code-design/design-principles/deep-modules.md): Provide useful capabilities through clear interfaces.
- [KISS](../code-design/design-principles/kiss.md): Prefer lower overall complexity.
- [YAGNI](../code-design/design-principles/yagni.md): Ground added capabilities in actual requirements.
- [Keep Laziness](./references/keep-laziness.md): Solve the problem with the smallest necessary change.
- [Subtract before add](./references/subtract-before-add.md): First consider whether deletion or simplification solves the problem.
- [Minimize reader load](./references/minimize-reader-load.md): Reduce the layers and state a reader must track.
- [Reveal details progressively](../writing-for-agents/SKILL.md#information-hierarchy): Show essential information first, and reveal details as needed.
- [Make foundational decisions first](./references/foundational-decisions.md): Establish data structures, dependency order, and shared state first.
- [Redesign from first principles](./references/redesign-from-first-principles.md): Reconsider the structure against the full requirements.
- [Model the domain](../ddd/modeling/implementation.md): Represent concepts and rules in the structure.
- [Type-system discipline](./references/type-system-discipline.md): Express constraints through types and construction.
- [Boundary discipline](./references/boundary-discipline.md): Establish input contracts at system boundaries.
- [Explicit ownership](../code-design/approaches/resource-lifecycle.md): Make ownership of state and resources clear.
- [Isolate before sharing](./references/isolate-before-sharing.md): Eliminate sharing first, then handle necessary serialization.
- [Idempotency](./references/idempotency.md): Make repeated execution and recovery converge on the intended result.
- [Outcome-oriented execution](./references/outcome-oriented-execution.md): Direct rewrites and migrations toward the target architecture.
- [Migrate then clean up](./references/migrate-then-clean-up.md): Finish migrating callers and remove obsolete paths.
- [Experience first](./references/experience-first.md): Judge implementation tradeoffs from the user's experience.
- [Exhaust the design space](./references/exhaust-the-design-space.md): Compare materially different approaches side by side.
- [Build the tool first](./references/build-the-tool-first.md): Make the work or its checks repeatable.
- [Attack the premise](./references/attack-the-premise.md): Revisit shared assumptions after repeated failed fixes.
- [Fix root causes](./references/fix-root-causes.md): Trace the failure mechanism and address its cause.
- [Prove it works](./references/prove-it-works.md): Support completion claims with evidence.
- [Verify before advancing](./references/verify-before-advancing.md): Split work into independently checkable units and verify each before proceeding.
- [Test behavior, not implementation](../code-quality/testing/behavior.md): Assert outcomes that consumers can observe.
- [Protect context](./references/protect-context.md): Separate bulk material processing from the main judgment work.
- [Keep work moving](./references/keep-work-moving.md): Identify work that can proceed and decisions that need confirmation.
- [Encode lessons in structure](./references/encode-lessons-in-structure.md): Express confirmed rules through mechanisms.
