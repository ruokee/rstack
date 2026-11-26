<!-- Keep level 2 and level 3 headings in English. Write the level 1 heading and body in the language the user requests. If they do not specify one, use the language they are using. -->

# [Spec Name]

- **Project**: [Project name]
- **Author**: [Author name]
- **Status**: [Draft | Ready]
- **Date**: [YYYY-MM-DD]

---

## Specification of Requirements

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" have the meanings defined in BCP 14 [RFC2119] [RFC8174] when, and only when, they appear in all capitals as shown here.

<!-- If the Spec body is in Chinese, add the following sentence to this section: [中文关键词使用 "必须"、"不得"、"应该"、"不该" 分别对应 MUST、MUST NOT、SHOULD、SHOULD NOT，并沿用各同义关键词在 RFC 2119 中的含义。] -->

Document and section titles follow the capitalization conventions in Section 3.4 of [RFC7322].

## Motivation

[Describe what you intend to do and why.]

## Goals

<!-- State one outcome per goal. If a requirement sets a numerical target, give its value. -->

- [Goal 1]
- [Goal 2]

## Non-Goals

<!-- List what this task explicitly excludes. If an improvement is planned for later, say so in that entry. -->

- [Out-of-scope item 1]
- [Out-of-scope item 2]

## Open Questions

<!-- Record each open question and the decision its answer would affect. Omit this section if there are no open questions. -->

- **Question 1**: [Open question and its implications]
- **Question 2**: [Open question and its implications]

## User Journeys

<!-- Choose scenarios that illustrate the expected behavior. Name each journey after what the user wants to accomplish so it can be cited during implementation and verification. Omit this section if the task involves no user journey. -->

### UJ [Title 1]

- **Given**: [Preconditions]
- **When**: [Action]
- **Then**: [Expected result]

### UJ [Title 2]

- **Given**: [Preconditions]
- **When**: [Action]
- **Then**: [Expected result]

## Technical Design

<!-- Record the design decisions the implementation must follow. Use a diagram if it helps explain the architecture or data flow. Omit this section if there is no design to describe. -->

[What design will you use? Which requirement or constraint led to that choice?]

## Alternatives Considered

<!-- Name the decision in the heading. List only options you considered and set aside. Omit this section if there are none. -->

### Alternative [Title 1]

- **Scope**: [Area this choice concerns]
- **Options**:
    - [Option set aside]
        - [Describe the option.]
        - [Explain why it was set aside.]

## Additional Resources

<!-- List the resources someone taking over will need and what to look up in each. Prefer relative paths for local files and identify their base, such as the Spec directory or the root of a named repository. Use an absolute path only when the resource must be located at a specific place on a machine. Omit this section if there are no relevant resources. -->

- [Resource link or path]: [What to look up there]

---

## Implementation Plan

<!-- List the tasks needed to deliver the feature. A simple change can be one task. For multiple tasks, identify dependencies and say which tasks can run in parallel. -->

### [Task ID] [Task Name]

<!-- Name each task for the result it delivers. Keep existing task IDs; prefer U01, U02, and so on for new IDs. Use these IDs for later references. State where to start, what to do, who receives the result, and which user journey or check shows the task is complete. -->

---

## Verification

<!-- Describe how to tell whether the implementation meets the requirements. For each task, identify what should change and what should stay the same. If several tasks deliver one feature, explain how to check the whole scenario. -->

### Programmatic Verification

<!-- List the applicable commands, test cases, and pass criteria. When the list is long, you can group checks by task or check type. For example, put **U01** above a list of that task's commands and expected results. For metrics such as coverage, use the thresholds set by the project or its requirements. Omit this section if no programmatic check applies. -->

- [Task ID]: Run `[command]` for [test case]; expect [pass condition].

### Verify [Title 1]

<!-- For each additional check the agent needs to perform, identify the task, starting conditions, actions, and expected results. If a user journey describes the same scenario, cite it directly. Omit this section if no additional check is needed. -->

### Verify [Title 2]

---

## Revision History

<!-- Omit this section until a settled agreement changes. For each revision, update the affected sections of this Spec, keep earlier entries and their numbers, and append a new entry. Number entries in order starting at 1. -->

### Revision [N]

- **Timestamp**: [YYYY-MM-DD HH:mm:ss]
- **Summary**: [What changed in one sentence.]
- **Previous agreement**: [What the Spec required or assumed before this change.]
- **New agreement**: [What the Spec requires or assumes after this change.]
- **Reason**: [Why the agreement changed.]

[RFC2119]: https://www.rfc-editor.org/rfc/rfc2119
[RFC8174]: https://www.rfc-editor.org/rfc/rfc8174
[RFC7322]: https://www.rfc-editor.org/rfc/rfc7322
