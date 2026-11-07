# GRASP

Craig Larman's GRASP provides nine heuristics for assigning responsibility. Use them to decide who knows a rule, who can enforce it, and who coordinates an operation. A responsibility can belong to a function, module, or object.

## Information expert

Place a decision near the information needed to make it. Check whether that information is authoritative, current, and available within the required consistency boundary. An object holding a stock snapshot can calculate a proposal. The inventory authority must accept the reservation against current stock.

## Creator

Assign construction to the owner that already has the initialization data or controls the new value's lifetime. A container may create its entries; a session may create its transaction-scoped operations. Use a factory when construction has a distinct selection or assembly responsibility.

## Controller

Give a system operation a coordinator that receives the request, invokes the necessary rules and effects, and returns its outcome. A CLI handler or request handler can translate transport input into this use. Keep domain decisions with their rules and transaction completion with the owner of that transaction.

## Low coupling

Reduce knowledge of decisions that can change independently. Count what a consumer must understand, rather than counting imports alone. A broad shared object can create strong coupling through mutable state even with one import. A narrow stable value can create little change coupling across many consumers.

## High cohesion

Keep operations together when they maintain the same invariant, use the same state, or change under the same rule. Evaluate cohesion with coupling: moving every step into a separate helper can reduce local size while increasing coordination across modules.

## Polymorphism

Locate varying behavior where each variant can supply it through a common contract. Functions, traits, protocols, or subtype dispatch can serve this purpose. A closed variant set can instead use exhaustive matching to keep an operation together. Choose according to the direction of change and the language's guarantees.

## Pure fabrication

Give technical work its own owner when a domain object is a poor home for it. A mapper, adapter, repository, or policy function can contain that work. Name the actual responsibility and give it a clear contract; a generic service that accumulates unrelated work loses that benefit.

## Indirection

Introduce an intermediary when it contains a useful conversion, coordination rule, or dependency boundary. Account for the extra call path, lifetime, and failure translation. Remove an intermediary when its work disappears without becoming a caller obligation.

## Protected variations

Place a stable contract around an identified source of change. For example, a storage format can change behind a domain-facing query. State what remains stable and what variations it supports. Unconfirmed variation belongs under [YAGNI](./yagni.md).

## Resolve competing owners

Information expert is a starting point. Authority, transaction scope, lifecycle, and change ownership can decide a different placement. Walk one operation through the proposed owners and check that each rule has a place to be enforced. See [SOLID](./solid.md) and [Tell Don't Ask](./tell-dont-ask.md).
