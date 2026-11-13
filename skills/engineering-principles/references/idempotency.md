# Idempotency

An operation is state-idempotent when applying it again preserves the result established by the first application. This matters when its contract permits duplicate requests or resumption after interruption.

Setting a configuration key to a specified value can have this property. Appending a line on each call produces a different file. State the operation's identity and intended result before choosing the implementation: two requests for the same import and two intentionally separate imports have different meanings.

Recovery adds a question about partial states. For a migration with several steps, identify the state each step establishes and how a later invocation recognizes it. A completion marker and the change it describes need the consistency required by that migration. Then define whether resumption completes pending work, returns an established result, rejects an incompatible state, or reports a failure.

External effects have their own boundary. A print request can leave the local job marked complete while a repeated submission prints another copy. Deduplication needs a stable operation identity and a receiving system that honors it, including its retention and scope. A converged local record alone establishes local state.

Apply these choices to the repetitions the real contract requires. Retries, cleanup, and automatic recovery remain separate capabilities with their own requirements and authorization.
