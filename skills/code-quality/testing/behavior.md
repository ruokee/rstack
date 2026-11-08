# Behavioral tests

A valuable assertion detects a plausible consumer-visible mistake. Identify the behavior, its independent expected result, and the failure the assertion would expose. Test scope follows the contract being protected.

## Expected results

An oracle is the source of the expected result: a confirmed requirement, protocol, domain rule, or independently checkable derivation. Copying the production algorithm into the test can reproduce the same bug. Updating production and expected values together can preserve a wrong assumption.

For a stated rule that rounds decimal prices to cents with ties away from zero, examples such as `1.005 -> 1.01`, `-1.005 -> -1.01`, and an already exact value exercise the rule. An expected result derived by calling the same rounding implementation adds no independent check.

Characterization tests record observed behavior while requirements are recovered. They need an explicit account of what is current behavior and what is intended behavior. Missing domain rules remain questions for the project.

## Observable behavior

Assert returned values, visible state, errors, persisted results, or messages at a real boundary. Internal method names and incidental call order often change while these guarantees remain intact.

Some interactions are the guarantee: exactly one charge request, cache use instead of a paid fetch, or a required event order. An interaction assertion is appropriate at that boundary. Check its request meaning and failure behavior. Blanket rejection of mocks or call-count assertions loses valid coverage.

Several assertions can describe one result or one real multi-step workflow. Unrelated guarantees bundled together make failures hard to locate. Test size follows the behavior, with case identity and diagnostic information kept visible.

## Coverage

Consider legal inputs, boundaries, failures, and state transitions. Choose unit, integration, or end-to-end checks according to the semantics that must be exercised, feedback cost, and diagnostic precision. Cheap real collaborators can simplify a test. Fakes must preserve the relevant dependency contract.

Line coverage locates executed and untouched code. It does not establish assertion quality. A concrete mutation, such as reversing a boundary or dropping an error distinction, can reveal a weak assertion. Mutation tools cover their chosen mutations and inputs. Equal scores need the behavioral and diagnostic comparison described in [Test maintenance](./maintenance.md).

## Test-first feedback

TDD uses a failing behavior check, a sufficient implementation, and behavior-preserving restructuring as feedback. The useful evidence is that a test detects the intended missing behavior and exercises a usable public interface. A tool failure or undiscovered test gives different feedback.

Difficult setup, excessive dependencies, and awkward calls can reveal design costs. First check whether the setup represents a genuine workflow and whether isolation would hide its semantics. Exploratory work with unsettled rules needs learning before an authoritative expectation can be written.

Test-first and test-after can both protect behavior. Test creation and development cadence belong to the current task. Tests document a contract in proportion to their oracle, assertions, and maintenance discipline.
