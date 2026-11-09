# Test maintenance

Test maintenance balances independent behavior protection, readable scenarios, diagnostic value, and change cost. Category labels are investigation signals. Judge the guarantee each test actually protects.

## Fragile assertions

A behavior-preserving rename or split that forces many assertion changes suggests coupling to private names, internal shapes, or incidental call order. Separate necessary setup changes from assertions that merely track implementation.

Prefer a public result, error, state, or genuine boundary interaction. A test verifying a contractual cache choice or exactly one charge has a legitimate reason to observe that behavior. Its protected interaction is explained in [Behavioral tests](./behavior.md).

A change-detector test mirrors the implementation without an independent correctness criterion. Identify a plausible mistake it would miss and the noise caused by a harmless structural change. Recommend replacement or removal according to the unique coverage check below.

## Readable scenarios

Keep the action, causal inputs, and expected result understandable locally. DAMP, descriptive and meaningful test code, permits repetition that helps a reader verify a case. Shared fixtures and builders are useful when they remove irrelevant construction details while keeping meaningful values visible.

An eager test mixes unrelated guarantees. A mystery guest hides the data or environment that determines the result. A general fixture builds much more state than the scenario needs. Indirect testing can obscure the operation being protected. Show the specific diagnosis and its reading or maintenance cost.

A genuine multi-step workflow can require extensive setup and several assertions. Several properties of one result can describe one behavior. Preserve those cases and improve their failure messages or case identity when needed. Assertion roulette is a diagnostic problem when a failure leaves the broken guarantee unclear.

## Repeated tests

Compare protected behaviors, boundary conditions, failure localization, and distinct scenarios before merging or deleting tests. Equal line coverage, identical paths, or the same mutation score are evidence of overlap within their measured scope.

Parameterize cases that share one guarantee and assertion shape. Keep distinct setup or error semantics separate when parameters would hide branches. Extract construction noise at the nearest useful scope. Preserve the inputs and expected values that explain each case.

Repeated contract values may create coordinated-change cost. A shared expected-value helper can also copy the production algorithm and remove independence. Check which knowledge is shared and where its authority belongs.

## Low-value checks

Literal mirrors, getter echoes, framework restatements, and forwarding mocks often protect no independent application behavior. Show which consumer-visible error could escape while these tests remain green. Framework use with application-specific mapping, error handling, or transaction behavior can need a genuine integration check.

A parser, date calculation, conversion, or other error-prone utility can merit direct tests regardless of its directory. A configured regulatory bound or protocol constant can be a real contract and justify a guard. Prefer exercising the configured behavior when it captures the guarantee. A test for a chosen contract differs from copying an incidental default.

## Changes

Before recommending removal, identify any unique behavior, boundary, failure diagnosis, or documented scenario the test contributes. Retain that protection in the proposed result. Reliability issues belong to [Test reliability](./reliability.md).
