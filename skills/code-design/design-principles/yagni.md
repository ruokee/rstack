# You are not gonna need it

YAGNI defers capability whose need is speculative. Build for confirmed behavior and known constraints. Keep the code easy to change so that a later requirement can be implemented when its contract is understood.

## Account for the full cost

Martin Fowler describes four costs of a presumptive feature:

- Build cost consumes work that could serve a current need.
- Delay cost postpones useful delivery.
- Carry cost makes readers, checks, and future changes account for unused capability.
- Repair cost pays for correcting or removing a wrong prediction.

An unused option still creates combinations and compatibility expectations. A generic extension point also commits callers to its chosen model of variation.

## Separate present structure from future capability

A protocol adapter, resource owner, or stable published contract can serve a current need with one implementation. A second implementation is relevant evidence when replacement is the reason for the boundary. Implementation count alone does not decide its value.

For example, wrapping a vendor's response to preserve domain error distinctions has present value. Building automatic provider discovery solely because another vendor might appear adds an unconfirmed capability. These are separate decisions.

Correct error handling, input-domain enforcement, resource release, and useful behavior checks support today's contract. Refactoring can lower a known change cost. Public APIs and persisted formats can impose expensive migrations from their first release; make those decisions using the known obligations.

## Keep deferral practical

Keep rules explicit, localize changeable decisions, and preserve checks for externally observable behavior. Prefer a direct expression over unused configuration. When a future requirement becomes real, derive its interface from the actual callers and constraints.

Use [KISS](./kiss.md) to simplify required capability, [Rule of Three](./rule-of-three.md) for uncertain commonality, and [SOLID](./solid.md) when choosing a deliberate extension boundary.
