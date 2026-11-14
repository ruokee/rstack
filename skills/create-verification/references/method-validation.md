# Method validation

Check whether the method produces the facts and distinctions needed for its intended decision. Choose examples and depth according to the consequence of a wrong judgment and the method's uncertainty.

## Trace a judgment

Follow a meaningful criterion through a complete use of the method:

1. Locate its authority in a requirement, accepted example, protocol, independent calculation, or explicit user decision.
2. Identify the input and conditions that make the criterion observable.
3. Perform the operation and retain the relevant output, state, measurement, or human observation.
4. Apply the stated comparison or assessment and explain the result.

Current implementation behavior is useful investigative material. Resolve expected behavior from the applicable authority. A snapshot needs an accepted basis before it becomes a reference result.

Check the method at its real entry point. Observe preparation, execution, result reading, and cleanup as applicable. Check that errors remain distinguishable from successful evaluations and that observations belong to the intended object version and run.

## Probe the distinctions

Use cases that could expose a meaningful error in the method:

- A known-valid case checks whether acceptable behavior receives the appropriate result.
- A known-invalid case checks whether the method detects a relevant violation and points to it.
- A legal variation checks for false alarms caused by incidental ordering, wording, formatting, or another permitted difference.
- A boundary or counterexample checks a premise that could make the chosen criterion misleading.
- A control checks whether the procedure responds to the variable it claims to measure.

Select cases for the uncertainty. Fixed case counts and arbitrary thresholds add obligations without establishing usefulness. When a method misses a case, locate the fault in input preparation, execution, observation, or judgment, repair it, and recheck that path.

For a checker that compares two exports, a valid pair and a pair with one changed required value can test the comparison. If order is explicitly irrelevant, reorder an otherwise valid export to check that the tool still accepts it. These conditions belong to this example's contract.

## Calibrate variable judgments

For measurements with variation, record units, workload, environment, sampling method, and comparison conditions. Choose repetition and tolerances using the decision's requirements and observed variability. Investigate whether a difference comes from the object or changed measurement conditions.

For human assessment, define the participant's role, task, rubric, and relevant site conditions. Use grounded examples to resolve differences in interpretation. For model grading, retain the model, prompt, context, inputs, outputs, and scoring instructions needed to interpret the result. Compare ratings with expert judgments on cases whose outcomes have a basis. Select repeat trials when variation matters to the decision.

For visual or other snapshot comparison, inspect the proposed baseline and justify its acceptance. Match relevant capture conditions. Investigate a difference before updating the expected result.

## Preserve the conditions

A simulated service can expose a client to prescribed protocol responses and failures. In a constructed example, a stub sends two chunks and then closes the connection so the method can observe the client's interruption handling. Record the prescribed chunk sequence and the required client outcome. Real server timing and hardware execution need observations from their respective environments.

An analysis model carries its assumptions, abstraction, parameter values, and checked properties. A finite model-checking run reports its actual exploration. Trace the model's states and operations to the real object when using findings to judge the implementation.

Keep these conditions beside the conclusion, including any part requiring another environment. Preserve useful observations from partial execution with their actual scope.

## Classify the outcome

Separate the stages of evidence:

- Successful execution means the procedure completed under the recorded conditions.
- An observation records the facts it obtained.
- A judgment applies an identified criterion to those facts.
- A blocked judgment names the missing condition and the affected question.

When the object violates the criterion, save the failing case and observation for its owner. When the method misjudges or fails to obtain the necessary fact, fix the method within scope. When a dependency, permission, or runtime capability prevents execution, record the actual failure, completed coverage, and the action needed to continue.

Deliver a method-check record identifying the object and method versions, selected cases, execution conditions, actual observations, judgments, repairs, and remaining requirements. Preserve historical results under the conditions in which they were obtained.
