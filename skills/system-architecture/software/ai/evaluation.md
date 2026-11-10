# AI evaluation

Collect evidence that can decide whether an AI-system change meets its actual task. Define cases and judgments before inspecting candidate results. Preserve legitimate alternatives and consequential failures.

## Match judgment to the contract

Use exact checks for explicit formats, amounts, permissions, allowed values, duplicate effects, and state transitions. These contracts remain precise when a model participates. Evaluate open answers for factual accuracy, coverage, support, reasoning relevant to the task, and achieved result. Several wordings or plans can satisfy the same criteria.

Constructed case: a refund assistant correctly cites the applicable policy, covers its conditions, and gives a justified recommendation. Its wording can vary. An execution for the wrong amount fails the amount contract even if the explanation is excellent. Keep answer quality and business effects as separate judgments.

## Choose representative cases

Include common valid work, boundary cases, known failures, and the risk categories that matter to the system. Preserve well-founded solutions as positive cases. State the scenario facts, required outcomes, acceptable alternatives, and consequential mistakes. A missing business decision remains a missing criterion for its owner to resolve.

Record the candidate, model and version when available, prompt, input, supplied context, tool and retrieval configuration, runtime conditions, and evaluation method. Separate the intended change from other changing factors. Keep enough actual output and operation evidence to inspect the judgment.

## Choose an evaluator

Programs can check exact structure and executable contracts. Citation presence alone leaves source correctness and support to further judgment. Model evaluators can compare relevance and meaning, with bias, variability, and cost. Human judgment contributes domain expertise and calibration, with its own disagreement and availability limits.

Use criteria and examples that distinguish valid paraphrases from factual errors. Calibrate a model evaluator on cases with known judgments, including appropriate short answers and plausible-looking failures. Investigate position, verbosity, style, or self-preference bias when it affects the decision. Separate evaluator failure from candidate failure.

## Compare candidates

Use the same cases and comparable conditions for paired comparison. Randomize presentation order where order could bias a judge. Repeat selected cases when stochastic variation could change the decision. Keep individual results and high-risk categories alongside any aggregate.

A small numerical change can arise from run variation. Report an effect and its uncertainty when the sample supports that analysis. Otherwise make the bounded decision supported by the cases, and collect additional evidence only for the unresolved question. An average improvement leaves an unauthorized operation as a failure of its explicit contract.

Attribute problems before changing the architecture:

- Professional content can contain an incorrect definition or omit a necessary condition.
- Retrieval or material acquisition can omit, truncate, or select the wrong evidence.
- Execution can fail because of tools, configuration, unavailable dependencies, or host behavior.
- The evaluator can apply the wrong criterion or misread a valid result.

Trace the observed error to the affected mechanism and rerun the affected path after its repair. A good transport result and a good professional answer are separate observations.

## Use results proportionately

Choose a release comparison, CI gate, ongoing sample, or incident investigation according to the designed system's cadence and consequences. Define gate criteria before viewing scores. A selected local comparison can answer a small change without creating an evaluation platform.

Budget model calls, evaluator calls, runtime, and human review. Fixed cases can age as policies, tools, and user tasks change. Repeated tuning can overfit visible cases; retain independent or newly observed cases where that risk matters. Preserve failed and uncertain results with their actual conditions. Operational quality signals are in [Observability](../selection/observability.md); isolated shadow execution is in [Migration](../migration.md).
