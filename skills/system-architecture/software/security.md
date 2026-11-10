# Security

Evaluate the system against its actual security requirements, assets, access paths, and threat assumptions. Existing network and organizational controls are facts in that model. Add a mechanism to address a demonstrated requirement or risk gap, with its operating owner and cost.

## Trace access

Identify who can act, the authority they carry, the operation and resource involved, and where that authority is checked. Authentication establishes identity. Authorization decides whether that identity can perform the specific action. A network location can be part of an existing access policy; preserve that policy's actual scope.

Follow data across the relevant trust boundaries. STRIDE provides questions about spoofing, tampering, repudiation, disclosure, denial of service, and privilege elevation. Apply the questions relevant to the modeled threat. Distinguish prevention, detection, and recovery so a log or alert is credited with its actual effect.

Evaluate the consequence if a boundary fails. Layered controls can contain an incident when they protect different failure paths. Zero-trust approaches put more access decisions on identity and request context. They also add policy, availability, latency, and operational dependencies. Choose controls according to the current threat model.

## Match isolation to the obligation

Pooled resources share capacity and cost. Separate schemas, stores, accounts, processes, or physical resources can provide different forms of isolation. State the property required: data access, resource interference, administrative authority, or failure containment.

Constructed tenant example: queries include a tenant filter, while a cache uses only `user:123`. A cache hit can bypass the query's filtering and return another tenant's result. Trace tenant identity through lookup keys, storage paths, background jobs, exports, and administration under the required contract. A shared access layer must cover actual bypass paths before it can establish isolation.

Separate resource pools can contain overload without establishing data authorization. Independent credentials can limit access without eliminating a shared service's availability dependency. Name the protected property and residual shared cause.

## Account for credentials

Determine which components need which credentials, how they receive them, where copies exist, and how they are revoked or replaced under the current policy. Include deployment, logs, backups, debugging, and recovery when those paths fall within the modeled risk. Compare custody choices by exposure, access availability during failures, auditability, and maintenance.

When actual credential exposure is found, follow the applicable incident procedure and authority. Removing one visible copy leaves issued authority and other copies to be resolved by that procedure.

## Include dependencies

Follow source, packages, build tools, artifacts, and deployment authority through the supply chain relevant to the requirement. Version locking improves repeatability. An inventory exposes what is used. Scanning detects covered known issues. Reproducible builds compare artifacts under stated inputs; a reproducibly built malicious source remains malicious. Assign each mechanism its actual guarantee.

Translate applicable residency, retention, deletion, and audit obligations into data placement, access, propagation, and recovery requirements. Specialized legal interpretation belongs to the appropriate authority.

For an AI system, external retrieved text can influence proposed tool actions. Execution should enforce the system's actual authority and business contracts at the effect boundary. Prompt wording supplies guidance; access checks and action execution need their own mechanism. Read [AI systems](./ai/systems.md) for state and tool responsibility.
