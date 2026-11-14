# Method selection

Start with the decision the result must support. Identify the fact that would distinguish an acceptable result from an unacceptable one. Then choose how to obtain that fact and what is missing to do so.

## Choose the evidence

- Inspection fits requirements visible in an existing object, such as a configuration value, a document claim, or a manufactured marking.
- Execution fits behavior that appears through an operation, such as a state change, a displayed result, or a physical response.
- Analysis fits questions that can be answered through explicit assumptions, calculations, or a state model. Record how the abstraction corresponds to the object.
- A controlled comparison fits a question about a difference. Choose the variable to change and hold relevant conditions comparable.
- Human assessment fits judgments requiring expertise or real use, such as whether a procedure helps its intended reader finish a task. Give assessors the task, criteria, and observation procedure.

Select the observation level that exposes the required behavior. A message-contract check addresses the agreed interaction. Check consequential business effects at the place where those effects occur.

## Choose the artifacts

These thirteen categories describe possible contributions. Combine only the contributions needed for the current question. One artifact may perform several roles.

### Operating instructions

Use instructions when an operator must prepare conditions, interact with an object, or apply judgment. A runbook, checklist, acceptance walkthrough, demonstration procedure, or object-specific Skill can hold the work. Name the starting conditions, actions, observations, criteria, and finishing state. Use a dedicated Skill when agent discovery is part of the need. Otherwise update the existing reading path.

### Existing tools

Use a complete query, command, request, or notebook cell when available tools already expose the needed facts. State the input scope and how to read the result. This can be the entire deliverable for a one-time decision. Add packaging when repeated use creates a concrete need.

### Check scripts

Write a script when repeated operations or comparisons are awkward to perform reliably by hand. It may prepare inputs, invoke the object, extract observations, or evaluate them. Decide which of these responsibilities it owns. Keep its failure output specific enough to locate the affected input and understand the violated criterion.

### Declarative rules

Use a schema, constraint, lint rule, type-check configuration, or interface contract when an existing engine can enforce the requirement. Confirm which objects and paths the engine includes. For interaction contracts, record the necessary provider state and message expectations. Other effects need their own observations.

### Automated tests

Choose a unit, component, integration, CLI, browser, or end-to-end check according to the behavior's observation point. Generated inputs require a justified property and input domain. Differential checks require a justified comparator. Metamorphic checks require a justified relationship between input changes and result changes. Preserve confirmed behavior with regression cases when ongoing use needs it.

### Verification data

Provide examples, fixtures, boundary inputs, generators, replays, reference outputs, or expected states when the method lacks representative inputs or a comparison basis. Record where expected values came from. Select distributions and boundaries for the question. A captured output is a candidate baseline whose acceptance needs a reason.

### Execution environments

Provide dependency services, initialization, temporary containers, simulators, virtual clocks, response stubs, or fault controls when the scene needs prepared or controlled conditions. A containerized dependency needs a working runtime and a readiness condition. A stub supplies the configured behavior. Record which real behavior still needs a real execution environment, along with ownership and cleanup.

### Observation tools

Provide event recording, state exports, traces, screenshots, logs, queries, or measurement tools when the required fact is otherwise inaccessible. Choose signals and correlation identifiers that connect observations to the relevant operation. Plan retention around the judgment being made. Evaluate collected facts against separately identified criteria.

### Assessment tools

Use assertions, comparators, statistical analysis, review forms, rubrics, or model-grading prompts to turn observations into judgments. Deterministic criteria fit programmatic checks. Open-ended quality may need examples and expert assessment. For agent evaluation, distinguish the case, individual attempt, action record, environment outcome, and grader. Calibrate model judgments against grounded human judgments and account for variation.

### Analysis models

Use calculations, state specifications, invariants, proofs, or model-checker configurations when the question concerns combinations or properties amenable to analysis. Preserve assumptions, parameter values, explored bounds, and selected properties. For TLA+/TLC, the specification and model configuration define the checked object. Relate any finding back to the actual implementation before applying it there.

### Experiment plans

Use a benchmark, load generator, recovery exercise, user trial, or physical measurement procedure when the answer depends on measured behavior under chosen conditions. Define inputs, variables, metrics, comparison, and judgment basis. Account for resource contention and randomness. Choose repetition and thresholds for the decision being made.

### Execution integration

Use a build target, CI job, commit hook, scheduled probe, release check, canary configuration, or shadow replay when an established method needs a particular execution time or place. Scheduling determines when it runs. Its checks determine what it judges. For canaries, choose comparison signals and exposure conditions. Address side effects and resource costs for production traffic.

### Method checks

Provide checker examples, grader-calibration cases, intentionally faulty variants, or mutation-testing configuration when the method's ability to detect an important difference needs evidence. Choose faults tied to the criterion. Investigate missed detections and false alarms. Mutation survival can reveal a gap; interpreting it requires checking the change and the test's intended scope.

## Choose a lifetime

- One-time use can end with an explained query or procedure and the evidence needed for the current decision.
- Repeated use within a task benefits from saved inputs, a runnable entry point, and result locations that survive session changes.
- Long-term use needs an owner, a stable discovery path, documented prerequisites, and a way to update the method when its basis changes.

Choose lifetime separately from automation, operator, and schedule. A manual procedure can be maintained for years. A script can exist for one migration.

## Combine for the actual gap

### A status conversion

In this constructed example, the approved conversion maps `queued` to `waiting` and `done` to `complete` for records in one named import batch. Preserve record identifiers and all other fields. Use existing queries to compare identifier sets and mapped values for that batch. Save mismatches with their identifiers and the mapping decision. This one-time query method can end at import acceptance.

### A documentation bundle

A bundle requires local links to resolve and instructions to describe the approved procedure. Reuse the formatter, add a link checker if one is missing, and give a reviewer a concrete reader task for content assessment. Check the link tool with a valid link, a missing target, a missing fragment, and legal syntax variants relevant to the bundle. Content judgment remains with the reviewer.

### A device handover

For a device whose approved procedure requires an operator to select a mode and observe a status light, provide a checklist naming the initial state, physical action, expected indication, and reset step. Record the participant's role and site conditions. Add a recording aid only if needed to retain the decisive observation. A checklist can be the complete method.
