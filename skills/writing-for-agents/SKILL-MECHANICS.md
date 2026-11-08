# Skill mechanics

The skill-specific branch of [`writing-for-agents`](./SKILL.md): frontmatter, invocation choices, and router skills. The general writing guidance is in `SKILL.md`.

## Description

Write `description` as the primary trigger for loading the skill. Describe when the agent should read it. Keep explanations of the skill's capabilities, process, and results in repository documentation such as a README.

- Start with a short, accurate trigger sentence covering the main task intent.
- Add keywords or a representative example only when they distinguish a real use case. Keep distinct branches and prune synonymous phrases and long example lists.
- Make the intended scope clear enough to separate nearby skills. Prefer positive conditions; use a brief exclusion when a likely confusion needs it.
- Keep the wording concise because discovery descriptions occupy context before the skill is needed. Aim for useful matches and fewer unintended loads, then refine from actual use.

Apply this trigger standard to model-discoverable skills. Human-facing display fields can describe the skill's purpose.

### Common mistake

A common mistake is to write `description` as a summary of what the skill is or does. A trigger condition tells the agent when to read it.

- Capability summary: `Provides methods for analyzing anomalies and finding causes.`
- Trigger condition: `Use when investigating the cause of an anomaly, regression, or mismatch with expectations.`

## Invocation

For hosts that support `disable-model-invocation`, two common configurations trade the two loads:

- A **model-invoked** skill exposes its `description` for automatic selection. Users can also invoke it explicitly. Its description is a top-level context pointer, spending context load on discoverability. A reference-only skill can hold material shared by several skills. Omit `disable-model-invocation` and write a model-facing description with the distinct trigger branches. Apply the pointer-writing rules in `SKILL.md`.
- A **user-invoked** skill sets `disable-model-invocation: true` to opt out of automatic selection. Keep a human-facing `description` with a one-line summary. The human, or an explicit router, carries the job of remembering when to use it.

The effect on explicit name-based loading depends on the host. OMP hides these skills from its default model-facing list and keeps them readable by name through `skill://`. Check the host's rules for explicit loading and invocation when writing a skill that routes to another one.

Choose model invocation when the agent needs to discover the skill autonomously. Choose user invocation when a user or an explicit router supplies the entry point and the host supports that route. This keeps automatic discovery separate from access to a known skill.

Keep shared reference in one accessible place. If the host restricts cross-skill loading, put the shared material in a plain reference file that both skills can read.

## Splitting by invocation

Split off a model-invoked skill when a distinct leading word should trigger it independently, or another skill needs autonomous discovery of it. The new description adds context load, so independent discovery should justify the cost. When another skill already knows the target's name, check whether the host supports explicit loading before adding a new automatic trigger. Splitting by execution sequence is covered in `SKILL.md`.

## Router skills

When user-invoked skills multiply past what people can remember, a **router skill** names the available skills and the conditions for using each. The human has one entry point to remember. A router may load named skills directly when the host supports that operation. Where the host requires a separate user invocation, the router tells the user which skill to invoke next.
