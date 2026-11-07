# Deep modules

John Ousterhout's _A Philosophy of Software Design_ describes a deep module as providing substantial useful behavior behind an interface that is inexpensive to learn. Depth compares delivered capability with required caller knowledge. Implementation length is a poor measure of either.

## Count the whole interface

Include configuration, call order, errors, lifetime, and performance alongside signatures. A one-line network call can require the caller to understand timeouts, retries, authentication, and response ownership. Its short spelling alone says little about depth.

A parser can hide tokenization and grammar handling behind a stable input, result, and diagnostic contract. The caller still needs to know accepted syntax, input limits, and failure locations. Those are useful obligations to expose.

## Hide a decision

Choose a decision that consumers should not repeat: storage representation, an algorithm, protocol translation, or coordinated completion. Let one module own it and expose the caller's meaningful operation. Changes to that decision can then remain local while its contract holds.

Information leaks when consumers must coordinate around the hidden decision anyway. Examples include interpreting private storage fields, repeating the same error mapping, or manually reproducing internal initialization order. Trace those changes through [Existing code](../existing-code.md).

A protocol library can intentionally expose wire concepts. A data record can intentionally expose its fields. Information hiding depends on the intended contract.

## Preserve necessary control

Keep common use simple while exposing controls real callers need. Batching, cancellation, resource completion, and error details may be essential parts of a useful interface. Hiding them can force callers to bypass the module or reconstruct its internals.

For example, a report-saving operation can own opening, writing, and closing a file. A borrowed-writer operation can separately support an existing stream. Each can hide formatting while making its own resource obligation clear.

## Judge a split by its callers

Split when parts have independent rules, lifetimes, or consumers. Keep coordinated work together when separating it makes every caller learn the same sequence. Small functions can support either design. Their size does not decide the boundary.

A thin wrapper earns its place through a stable responsibility such as translation, access restriction, or lifecycle ownership. Removing a mere rename can reduce indirection. Read [Interfaces](../interfaces.md) for the full contract and [KISS](./kiss.md) for total complexity.
