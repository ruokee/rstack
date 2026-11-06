# Coding

Use these checks for incidents in software development, including implementation, debugging, testing, and code review. Treat the observed defect as evidence for improving the development process or environment.

## Automated checks

Read the repository's own check commands and relevant hook or CI configuration. Determine whether a check was missing, disconnected, broken, or insufficient for the observed failure.

For an existing disconnected or broken check, propose connecting or repairing it. Base a new check on the observed failure and the project's verification requirements, including its existing alternatives.

Mechanical constraints such as banned APIs, import shapes, and file-location rules belong in the cheapest suitable deterministic check. Consider valid changes the proposed check could reject.

## Development context

Trace library, framework, build, package-manager, or sandbox surprises to the relevant configuration and documentation. Identify the non-obvious convention or cause that future work needs.

For a debugging obstacle, check the available reproduction command, logs, traces, and failure output. Identify the specific missing observation that prevented diagnosis.

## Coding standards

For a missed review finding, read the project's existing standards and the context available to the reviewer. Distinguish an unenforced mechanical condition from a judgment gap, such as cross-file consistency or an architectural tradeoff.
