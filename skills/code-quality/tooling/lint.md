# Lint settings

Select checks and formatting settings for a concrete quality problem and its false-positive cost. Effective behavior comes from the project's configuration, invocation, and pinned tool version. Read those sources before judging the result.

## Formatting

1. Establish which formatter owns each set of files. For an existing tool, inspect its configuration and migration cost. For initial selection, compare language support, project style, and toolchain compatibility. Pin the version and verify effective files and exceptions as described below.
2. Distinguish check-only and write commands. Editors, commit hooks, and CI use consistent versions, configuration, and scope. The tool judges formatting consistency; review judges whether the configuration meets project conventions.
3. Introduce a formatting difference in a temporary copy. Observe the check's exit status and diff, format the file, recheck, and format again to confirm stable content. Record formatter and lint results separately.
4. Define the order of lint fixes and formatting. Check incompatible rules. If repeated execution keeps rewriting the same content, identify and adjust the conflicting settings. Retain specific exceptions and their reasons.

## Rule choice

Distinguish formatting, mechanical mistakes, language semantics, and heuristic maintainability rules. Compare coverage from formatters, compilers, type checkers, and other linters before adding duplicate diagnostics.

Function length and complexity thresholds are heuristics. A diagnostic warrants the contract and responsibility judgment in [Structural quality](../code/structure.md). Tool severity and a review finding's impact describe different things.

## Effective scope

Identify the command's working directory, configuration inheritance, overrides, file matching, ignore rules, and tool version. Check production, test, script, and generated-code scope separately. Explicit file arguments can behave differently from directory discovery.

Strictness can apply globally, per directory, or through an explicit baseline. State which files and rules are actually checked. A baseline is an exception boundary whose growth affects protection.

When a required file is skipped, repair the responsible invocation, match pattern, or override and verify discovery again. Narrow an exception to its confirmed reason. Compare the resulting diagnostics and maintenance cost before broadening adoption.

## Exceptions

Give an exception its rule, smallest useful scope, and actual reason. Generated source may need a specific exception because a generator owns it. A broad ignore can hide defects beyond that reason. Suppression comments, excluded files, and legacy baselines need their effect on coverage explained.

Automatic fixes have different behavior risks. Use the tool's classification and inspect the actual change. Unsafe fixes, broader rewrites, and bulk suppression follow the task's authorization.

## Custom rules

First check whether existing rules cover the target problem. Implement a missing check when the project convention is explicit, mechanically decidable, and worth its false-positive and maintenance cost.

1. Define applicable files, checked constructs, exceptions, and violation conditions. Use AST checks for syntax structure, tokens for relationships between lexical elements, and line checks for independent line conventions. A rule requiring name resolution or runtime knowledge needs a mechanism that supplies it.
2. Define a stable diagnostic code, accurate location, and actionable message. Implement the rule and loading configuration, select the intended diagnostics, and establish local and CI entry points.
3. Run real commands against violating, legal, and likely false-positive cases. Check locations, messages, and exit status. Divide responsibilities across tools to avoid duplicate diagnostics.

## Verification

Use supported configuration expansion or file-discovery commands, then exercise one intended violation and its matching legal case. Record effective files, rule identifiers, diagnostics, and exit status. A failed command, an excluded file, and zero diagnostics have different meanings.

Use controlled temporary cases where the actual configuration and file-matching rules apply. Prefer a temporary copy that preserves the relevant layout and configuration relationships. When checking real file discovery, use a configuration-applicable path. After verification, clean up the violating case, matching legal case, and temporary configuration created for the check, including on failure. Preserve the project's formal configuration and authorized permanent tests.

## Language guidance

For Python projects, see [Python lint settings](./py-lint.md).
