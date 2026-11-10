# Views

Choose a view by the reader's question. A diagram should expose a relationship or an operating consequence that would be harder to follow in prose. A short description can be enough for a simple arrangement.

## Choose the question

- Context: what is inside the system, who uses it, and what external parties constrain it?
- Structure: which participants hold responsibilities, and what relationships connect them?
- Flow: where does work, information, material, or money move, and where does it wait?
- Sequence: who acts first, what is awaited, and what happens after a missing or late result?
- State: what changes an item's status, which transitions are allowed, and who can cause them?
- Physical arrangement: which resources share a site, utility, access route, or failure domain?

Keep one clear observation scale in a view. Separate logical responsibility from physical placement when their relationship is the question. Several focused views can explain a complex object. Use the same name and meaning for a responsibility across those views.

## Make relationships readable

Label each consequential connection with its meaning and direction, such as accepts a case, owns a record, requests authorization, supplies parts, or depends on power. Distinguish transfer of information from transfer of responsibility. Show the boundary whose meaning matters, including system scope, organizational authority, or resource isolation.

Constructed repair example: a flow view shows intake handing accepted cases to scheduling, a parts hold returning ready cases to scheduling, repair handing finished work to acceptance, and rework returning to repair. A responsibility description names the owner during the parts hold. That owner must remain consistent with the flow.

When failure or migration drives the choice, show the relevant branch or stage. A successful sequence alone hides who owns an unknown result or an unfinished transfer.

## Keep the view usable

Give the reader the purpose, scope, and assumptions needed to interpret the view. Include detail that changes the judgment. Split a view when it mixes incompatible scales or forces the reader to reconstruct several unrelated paths.

Check the view against the facts or proposed contract. Each important arrow should correspond to a real interaction or an explicitly intended one. A diagram's existence supplies a description; the operating mechanism supplies the guarantee. For C4 software abstractions and deployment instances, read [Structure](../software/structure.md).
