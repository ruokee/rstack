---
name: prototype
description: Use when a design choice or feasibility question needs a disposable prototype to compare alternatives or observe layout, interaction, behavior, or timing.
metadata:
  version: "1.0.0"
---

# Prototype

Use a low-cost, disposable prototype to answer a specific design question. Deliver observations, tradeoffs, a recommendation, and a runnable artifact so the decision owner can choose and formal implementation can follow.

Use the host's tools, roles, permissions, and material locations. Scale the following steps to the decision; a simple question may need only a few sentences of preparation.

## 1. Define the decision

Read the request, existing evidence, and confirmed constraints. State the question, candidates or feasibility assumption, key inputs, observation that would change the choice, and decision owner. Use existing valid evidence when it already answers the question. When direction and behavior are settled, continue the authorized implementation workflow. One candidate is enough for an unresolved feasibility question.

Separate observable facts from human preferences. Obtain behavior, output, and timing through the relevant execution. Leave visual preference, product priorities, and acceptable tradeoffs to the person responsible for them. Use `thinking-method` if the question needs clearer assumptions.

Stay within the current request. For a screenshot-only comparison, deliver the authorized analysis from those screenshots. If answering requires a new prototype or operation, identify the required action and resolve its permission under host rules.

Proceed when every proposed artifact answers a specific unresolved question and you can choose how to observe it.

## 2. Choose directions

When the design space is open, find relevant precedents and outline meaningfully different directions. Use `research` when source gathering needs it. For visual exploration, a few reference images or layout sketches can help the user express preferences. Carry forward confirmed directions and priorities.

Choose candidates around the actual difference, such as live filtering versus filtering on confirmation, tables versus cards, or synchronous versus deferred callbacks. Additional directions should help answer the same question. Set the candidate count from the unresolved choices. Cosmetic renaming adds no useful comparison.

Ask for a choice when a remaining preference or priority belongs to the user. Continue gathering evidence for questions an observation can settle.

Proceed when the candidates cover the meaningful alternatives and each meets confirmed constraints.

## 3. Build the prototype

Build in the host's permitted task scratch or experiment location, separate from production source. Dependency installation, external writes, paid actions, and service operations follow current permissions.

Choose the smallest environment that can faithfully expose the question, accounting for total setup cost:

- Layout or simple interaction can use standalone HTML, CSS, and JavaScript.
- Behavior or timing can use a minimal runnable program.
- A question about a framework, component, dependency, or protocol needs its actual relevant mechanism and version. Reusing the current environment may cost less than building another stack.

Implement the states and operations needed for observation. Leave production packaging, general abstractions, and long-term maintenance facilities to formal implementation. Make inputs, startup, and observation steps repeatable.

Static data or substitute dependencies can illustrate layout and flow. Identify each substitution, its source, and the judgments it supports. Use the relevant real mechanism for performance, compatibility, or actual side-effect claims.

Proceed when the artifact reaches the target behavior, important simplifications are explicit, and its location and run instructions are available.

## 4. Provide a comparison entry

For multiple visual candidates, use one switcher with a label for each candidate. Keep data, viewport, and starting task comparable. Explicitly preserve or reset relevant state on switching, while retaining the design differences under investigation.

Behavioral candidates can share a driver, input, or command entry with labeled results. Keep relevant execution conditions comparable for timing or performance work. Record data size, execution path, and environmental conditions that affect the result.

A single-candidate feasibility prototype can go straight to observation. Keep the comparison mechanism simple.

Proceed when the observer can identify the current candidate, input, and state and repeat the target operation.

## 5. Observe the result

Use the matching interface or runtime and perform the operations that decide the question:

- For visual questions, open the actual page, drive the relevant interactions, and save screenshots identifying each candidate and key state.
- For CLI or TUI questions, run the program and observe real output and state changes.
- For behavior or timing, execute the target path and record output, event order, or time. Repeat materially variable measurements in proportion to the decision, preserving the variation and conditions.

Counts, result comparisons, and short assertions can help collect observations. Usable observations complete the prototype stage. Long-term tests belong to the formal implementation workflow.

If observation tools, substitutions, or comparison conditions distort the result, correct them before judging. If the evidence still fails to distinguish candidates, preserve the actual observations and unresolved question and choose the smallest discriminating next observation. If environment or permission blocks a run, record the attempted operation, concrete cause, pending observation, and conditions for continuing.

Proceed when conclusions trace to actual candidates, inputs, operations, and observations, with a scope matching the prototype's fidelity. A blocked or inconclusive result keeps its actual status.

## 6. Support the choice

Deliver the explored candidates, evidence, tradeoffs, recommendation, applicable conditions, artifact location, and run instructions. Say plainly that the prototype is disposable. Record the decision owner's confirmed choice separately from the agent's recommendation and any pending preference.

Stop when evidence sufficiently supports the target decision. If the choice remains unresolved, state the remaining question and next observation that could distinguish the candidates. Every additional variant needs a concrete decision purpose.

Preserve the selected direction, behavior to retain, key observations, and remaining conditions in durable task materials. Identify scratch paths as temporary and subject to the host's retention rules. Hand the result to the authorized formal design or implementation workflow. Use `code-design`, `system-architecture`, or `ddd` when interpreting the findings needs their expertise. These references are optional; the prototype method here is complete.

Organize formal implementation under project constraints. Decide whether to reuse any prototype code in that implementation task. Retention and cleanup follow host rules, including permission for deletion.

Finish when the next owner can find the evidence and artifact, understand the recommendation or unresolved choice, and continue within the decision owner's confirmed preferences.

## Example

This is a constructed case. A user wants to compare table and card layouts for a record list. Use the same records with long titles, filter, and viewport. Provide a labeled switcher. Actually filter, open details, and return in each candidate, saving screenshots of the relevant states.

Record observed overflow and the records displayed after filtering from those operations. Ask the decision owner to choose between information density and whitespace when that preference remains open. Fill conclusions from actual observations.

If the prototype uses static records, identify their source and supported display scope in the handoff. Check real API compatibility through the relevant API path.
