# Deployment

Choose an operating model that meets the application's release, resource, isolation, scaling, and recovery requirements. Include the current arrangement and its actual operating cost in [Decisions](../../core/decisions.md).

## Assign operating responsibilities

Trace build, artifact storage, configuration, deployment, health checks, traffic admission, scaling, observation, incident response, and recovery. For each relevant obligation, identify the application team, platform team, or provider that performs it. Include patching, upgrades, persistent storage, backup, and restore where they belong to the system.

Define the required isolation boundary. Processes, containers, virtual machines, physical hosts, accounts, and regions have different failure and resource-sharing properties. Check the selected platform's actual guarantees against the requirement.

## Compare operating models

Processes on hosts or virtual machines offer direct runtime and placement control. The owner maintains supervision, releases, capacity, host updates, and recovery unless another service explicitly supplies them.

Managed application services move specified platform work to a provider. Compare supported runtimes, networking, quotas, deployment behavior, persistence, observation, recovery, and exit. Responsibility follows the service contract.

Containers package execution dependencies and can make release artifacts repeatable. They add image maintenance and runtime configuration. Container packaging leaves scheduling, service availability, persistent data, and rollout ownership to the chosen operating arrangement. Managed container services can supply some of those responsibilities.

Serverless offerings can provide event-triggered execution and demand-based capacity. Check concurrency, startup behavior, execution duration, memory, network, delivery semantics, and pricing for the selected service. Long operations need a compatible execution or durable coordination model. Sustained load can change the cost comparison.

An orchestration platform such as Kubernetes supplies workload scheduling and reconciliation through declared state. It can support independent rollouts, resource policies, discovery, and recovery under its configured mechanisms. Its operator owns the control plane or provider relationship, cluster upgrades, networking, storage integration, and incident capability. A managed cluster changes that division of work.

## Design the release

Health checks need to reflect whether an instance should receive traffic. Separate startup, readiness, and liveness purposes when the platform makes that distinction. Define draining, in-flight operations, configuration versions, and the fate of persistent effects during a bad release.

Rolling, blue-green, canary, and full replacement releases make different capacity and compatibility demands. Returning traffic to old code needs compatible state. Use [Migration](../migration.md) for schema and authority transitions. Versioned infrastructure declarations can support reconstruction and review; actual recovery also needs data and working dependencies.

## Let requirements change the choice

Constructed case: a few services on managed deployment already meet release, availability, and capacity targets. Retaining that arrangement avoids a second platform's operating burden. Orchestration needs a concrete benefit that pays adoption, support, and exit costs.

Variant: the same small system gains a defined tenant-isolation requirement and independently coordinated rollouts that its current service cannot supply. Compare stronger managed offerings, separate environments, and orchestration against those requirements. A small service count still permits an orchestration choice when it delivers the needed guarantee with acceptable ownership.

Record the unmet target and responsible operator that would trigger reconsideration. Service count or project age alone leaves that decision open. Observation signals are covered in [Observability](./observability.md).
