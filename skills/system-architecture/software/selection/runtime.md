# Runtime

Choose the language, runtime, and framework separately, then evaluate the combination. Apply [Decisions](../../core/decisions.md) to the real delivery and operating problem, including the current stack.

## Identify the constraint

The language affects expression, types, tooling, and accessible libraries. The runtime affects execution, concurrency, memory, startup, packaging, and interoperability. The framework supplies conventions and lifecycle behavior for routing, persistence, configuration, and integration. Its defaults become requirements only when the project adopts them.

Describe the important operation and the unmet target. Attribute CPU, memory, startup, I/O waiting, coordination, and delivery difficulties before changing stacks. A slow query remains a storage problem when written in another language. Check required libraries, deployment targets, support lifetime, debugging, profiling, and the people able to maintain the result.

## Compare execution models

Managed runtimes can provide automatic memory management and mature application tooling. Measure warmup, garbage collection, memory, and startup under the actual configuration. JVM languages, Go, and JavaScript runtimes have different mechanisms within this broad category; a category label leaves the measured cost open.

An event loop handles concurrent waiting efficiently when callbacks yield. CPU-heavy or blocking work on that loop can delay unrelated requests. Workers, separate processes, native libraries, or another runtime can move that work, adding communication and lifecycle costs. Python's ecosystem can provide native compute or inference while orchestration runs in Python. Its concurrency guarantees depend on the interpreter, build, version, and libraries.

Ahead-of-time native code can offer direct resource control. Rust's ownership model provides compile-time guarantees within its language and safety boundaries. Adoption still needs available libraries, domain modeling, debugging capability, and learning time. Memory safety alone leaves business invariants and distributed effects to their own mechanisms.

## Judge framework conventions

Compare what the framework already supplies with what the team would otherwise maintain. Strong conventions can reduce divergent practices and onboarding cost. A smaller framework can give needed control with fewer imposed dependencies. Both choices need an upgrade path and a way to observe and test actual lifecycle behavior.

Multiple languages add build, release, monitoring, debugging, hiring, and review work. A distinct runtime can earn that cost for a concrete workload or required ecosystem. Keep a stable contract where the responsibility genuinely crosses that boundary.

Constructed example: an ingress path has an attributed runtime resource limit, a defined latency target, and staff already able to operate an alternative runtime. Moving only ingress can gain independent capacity while preserving the existing business-state owner. It adds another delivery path and a network contract. If the actual delay is in that owner's database, the proposed runtime change leaves the constraint.

Record the chosen scope, measured or assumed benefit, adoption cost, and condition for revisiting. Use [Migration](../migration.md) when consumers or persisted state need a transition.
