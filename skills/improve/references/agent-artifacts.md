# Agent artifacts

Evaluate changes to Skills, prompts, and other agent-facing guidance through their use in actual tasks.

## Frame the comparison

State which change the comparison should explain. When comparing guidance versions, hold the model, configuration, input, and other relevant conditions constant. A comparison of deployment combinations has a different question; record and judge each combination as such.

Define the intended behavior and the properties that must remain intact. Choose natural tasks covering the reported issue and the confirmed boundaries the change could affect.

Use the task's intended host and context. A reduced setup can help investigate a specific cause; record that setup and relate its conclusions to the intended use.

## Run natural tasks

Give each run a realistic user request and the context it would normally receive. Keep evaluator instructions and alternative identities outside the run's context. Use neutral labels when presenting alternatives for judgment.

Record the guidance version and actual runtime conditions. Use enough observations for the conclusion sought, accounting for variation between runs. Keep unsuccessful completed outputs in the comparison.

Distinguish execution failures, departures from the agreed procedure, and output-quality problems. Preserve the original attempt and its reason whenever a run is repeated.

## Inspect the evidence

Check these separately:

- **Access:** whether the intended guidance was reached and the required content was read. Use actual session or tool records available from the host.
- **Behavior:** what the agent did and produced after reading it, judged against the task's requirements and source material.

Read the outputs directly. Trace important findings to their supporting artifacts. Check factual claims from model-based judges against the source; investigate disagreements before using their verdicts.

When judging alternatives, apply the same criteria to both and conceal irrelevant candidate identities. Ask for ordinary task results. Evaluate process compliance from observed actions and artifacts.

## Interpret the result

Separate guidance changes from model or environment changes when attributing effects. Keep conclusions within the conditions observed.

Return the comparison evidence to the main improvement loop. A complete read, a longer instruction, or a judge's preference is an observation to interpret against the intended behavior.
