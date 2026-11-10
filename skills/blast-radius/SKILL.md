---
name: blast-radius
description: Use when assessing the impact of a proposed or implemented software change, tracing affected consumers, or choosing which behaviors need rechecking.
metadata:
  version: "1.0.0"
---

# Blast radius

Trace a software change through real dependencies to consumers, persistent data, and observable behavior. Identify the premises that decide the result, gather proportionate evidence, and specify the remaining checks. A small investigation can complete the following steps in a few paragraphs.

Use the current task's tools, roles, permissions, and delivery rules. Repair, commit, release, and collaboration follow that task's scope.

## 1. Define the change

Read the request, relevant contracts, and change. State the comparison baseline, candidate identity and state, intended behavior, and behavior to preserve. Account for added, modified, and removed interfaces, data, configuration, and side effects. Judge a refactor against its preservation contract. Judge an intentional behavior change against the confirmed new requirement.

A diff, commit range, code excerpt, or concrete proposal can supply the starting point. For a proposal, describe conditional effects and future acceptance checks in terms of the proposed behavior. For an implementation, trace the current code and actual operating conditions. Keep proposed behavior distinct from observations of running code.

Resolve the object from available context. Ask for missing information when it changes an impact judgment. Read relevant history to answer a concrete question, such as a compatibility promise or the reason a special branch applies.

Proceed when you can state what changes under which conditions and locate its implementation or proposal.

## 2. Trace propagation

Start at the changed operation or representation. Follow input sources, direct users, and downstream consumers. For each relationship, name the value, state, event, convention, or resource effect that reaches the next participant. Select the relevant paths:

- Calls and discovery. Follow indirect calls, registries, plugins, reflection, string names, imports, and generated bindings. Check actual registration and lookup rules alongside the effective configuration.
- Representations. Follow JSON fields, database columns, messages, file formats, CLI output, and cross-language readers. Inspect what the producer emits, what each conversion preserves, and what the consumer reads.
- Historical state. Trace persisted records, old messages, caches, and recovery into the changed code. Check how existing data reaches new readers.
- Runtime order. Trace initialization, asynchronous callbacks, microtasks, cancellation, cleanup, commits, and external effects. Establish the actual order and resource owner. An eviction may schedule disposal that releases a subscription later.
- Effective configuration. Follow defaults, environment differences, feature flags, build artifacts, and enabled entry points from their declarations to runtime behavior. Assess disabled paths under their actual activation conditions.
- Dependencies. Inspect the locked or installed version, local patches, wrappers, and implementation actually called. Establish behavior from that effective path.
- Deployment. Use the project's confirmed deployment contract to check coexisting versions, readers, writers, offline clients, and in-flight messages. Establish independently released consumers from evidence. For data changes, assess old data with new readers, new data with old readers, and readability after rollback. A confirmed stop-the-world cutover changes which combinations are reachable.

Continue to an observable result, a real consumer, or a boundary with evidence that contains the change. A wrapper that preserves public inputs, outputs, errors, and side effects can end propagation. A guard that excludes the trigger or a consumer that ignores the changed field can also establish a stopping point. State the mechanism and its conditions.

For an empty search, record the directories, names, and search method covered. Investigate dynamic discovery, consumers outside the repository, and historical data separately. For an important out-of-scope consumer, identify the missing material and the compatibility judgment it affects. Describe its possible failure conditionally until its contract and behavior are known.

Proceed when each important impact has a traceable path, and each important boundary has a stopping basis or a specific evidence gap.

## 3. Identify decisive premises

Extract facts whose failure would change the judgment. Examples include whether cache deletion invokes a callback, whether an old reader can receive newly written data, and whether a wrapper preserves the public unit.

For each premise, state its source, applicable conditions, supported conclusion, and an observation that would overturn it. Check a shared premise once for the conclusions it supports. Keep independent premises separate. A successful cache check resolves the cache premise. A separate storage-format premise needs its own evidence.

Distinguish confirmed requirements, observed facts, facts inferred from implementation, and investigator hypotheses. Check the strongest relevant counterevidence, such as a real entry guard, wrapper conversion, version difference, or effective flag state. Use `code-quality` when the question needs deeper judgment of correctness, change safety, or test expectations. Use `diagnose` when an observed failure needs causal investigation. The impact method here remains usable on its own.

Prioritize paths by consequences, realistic triggers, exposure, and recovery cost. Use numerical probabilities with data and a stated measurement basis. Otherwise describe the concrete trigger, affected population, and exposure.

Proceed when each important conclusion has a basis and each premise to check is specific enough to confirm or overturn.

## 4. Gather evidence

State the question that can change the judgment and the expected observation before choosing a check. Match the evidence to that question:

- Read the complete relevant source, contract, and control flow to establish static relationships, conversion responsibility, and reachability.
- For runtime dependency semantics, run a focused check against the real implementation on the effective call path. Preserve the candidate, input, relevant environment and version, actual result, and evidence location.
- When component interaction, configuration, or lifecycle decides the result, exercise the integration or application operation that covers it.
- Observe visual effects in the actual interface. Observe state and data effects through the relevant state, return value, persisted result, or external effect.
- Reuse existing checks after comparing their candidate, conditions, inputs, path, assertions, and observations with the current question. Interpret each success within that coverage. A producer-object assertion covers that object. A changed wire field needs evidence through serialization and consumer reading.

Derive expected results from requirements, protocols, business rules, or independent reasoning. Choose a check that distinguishes the correct behavior from the error under investigation. An existing failing case, before-and-after comparison, or targeted counterexample can make that distinction. Permanent test additions follow project rules and the current request.

Act within the current role and permission. In a standalone investigation, perform authorized concrete checks that can change the judgment. Inside an established verification workflow, give the evidence owner the question, input, independent expectation, actual path, and existing evidence. Reuse that role's applicable results.

When a check is blocked, record the actual cause and continue the available investigation. A launch failure is an execution result for that failed check. Mark the intended behavior check as pending and specify what restores it. Keep the affected conclusion conditional on its missing evidence.

Proceed when answerable questions have proportionate evidence and remaining decisive questions have a concrete evidence path and prerequisites.

## 5. State the conclusion

Separate observations, deductions, and recommendations. Cite locations that identify code, data, configuration, versions, or run results for the current candidate. Organize the answer around the question. Include the useful categories and omit empty ones:

- Change and scope. Give the baseline, behavioral difference, and investigation boundary.
- Confirmed impacts. Name the affected consumer or data, propagation mechanism, conditions, and observable change. Keep the requirement supporting an intentional change beside that impact.
- Established risks. Give a failure path under supported conditions, the violated contract, consequence, and evidence. Label static deductions and observed failures distinctly.
- Excluded paths. Preserve the investigated concern, exclusion basis, and applicable scope.
- Unresolved premises. Give the conditional impact, current gap, and evidence that would change the judgment.
- Verification recommendations. Specify the behavior, input or operation, independent expected result, relevant path, and execution status.

Express scope through consumers, data, and operating conditions. Use file counts, diff size, and direct caller counts as locating clues. Zero established risks within the investigated scope is a valid result.

Assess rollback separately for code versions, data, external effects, and deployment relationships. A reverted commit restores its code. Previously written data and completed external effects need their own recovery conditions. For example, rolling an object-writing format change back to an integer-only reader leaves the written objects in storage. Determine recovery from the actual readers, data, and deployment contract.

Finish when the question has an evidence-supported conclusion or the remaining decisive gaps identify the affected judgment and conditions for obtaining evidence. Continue investigation for a resolvable question that can change the decision.

## Example

This is a constructed case. An export interface changes the JSON field `retryAfterMs` to `retry_after_ms`. The confirmed requirement says existing automation must keep reading the same field. All server type references have been updated. `tools/poller.py` reads the old field through dictionary indexing.

Trace the server's serialized JSON to the Python reader. If the response omits `retryAfterMs`, the reader raises `KeyError`. That path violates the compatibility requirement. Identify the actual encoder and consumer indexing locations, then inspect the serialized response to resolve the decisive premise.

The discriminating check passes an actual exported response into the consumer's reading path. Its independent expectation is the contract's original field and value. Record the candidate, input, emitted response, and observed consumer result, or hand those details to the assigned evidence owner.

If a wrapper still emits the original field with the same value and public behavior, use that conversion to narrow the impact. An internal rename can stop at that boundary.
