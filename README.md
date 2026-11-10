# rstack

English | [中文](./README.zh.md)

rstack is a collection of Agent Skills. I use them for real engineering work.

The Skills in rstack are general-purpose. They can also serve as a basis for creating and maintaining project-specific and personal preferences and workflows.

## Scope

Each addition records its source, purpose, and reason for inclusion. Upstream Skills can be adopted as they are. A custom version can evolve when experience reveals a concrete need.

Skill categories, invocation choices, and personal or project adaptation are developed alongside the selected Skills.

All included Skills allow model discovery by default. Mention the task intent, Skill names, or trigger terms in an ordinary request so the agent can select and read the guidance it needs. Manual-only invocation can be chosen as an exception based on actual use.

## Skills

English Skills are in [`skills/`](./skills/), and Chinese Skills are in [`skills-zh/`](./skills-zh/).

- [writing-for-agents](./skills/writing-for-agents/SKILL.md): Write content for agents, including Skills, `AGENTS.md`, prompts, tool/MCP descriptions, and subagent instructions. Organize steps and reference material, write precise skill triggers, make reading conditions explicit, and define checkable completion criteria.
- [wellsaid](./skills/wellsaid/SKILL.md): Write clear, natural text for replies, documents, code comments, and collaboration messages. Remove stock phrasing, filler, and defensive language. Preserve facts, meaning, and the author's voice while adapting the text to its readers and purpose.
- [reflect](./skills/reflect/SKILL.md): Review work sessions for reusable lessons and concrete improvements. Examine the record through judgment, tooling, and divergent lenses, then check findings against the evidence, their scope, and existing guidance. Apply the changes the user selects.
- [thinking-method](./skills/thinking-method/SKILL.md): Choose or combine eight methods for the question at hand: how, why, analogy, discussion, modeling, first-principle reasoning, hypothesis, and metacognition. Make important assumptions explicit in the current activity's document, then use them for planning, reflection, diagnosis, or hypothetical reasoning.
- [research](./skills/research/SKILL.md): Gather and assess evidence to answer research questions with traceable findings. Follow claims to primary sources and distinguish facts, inferences, and unresolved disagreements. For durable delivery, preserve source material and open questions so another session can continue the work.
- [improve](./skills/improve/SKILL.md): Improve existing work through evidence-based iterations against an agreed goal. Establish a baseline, comparison method, and properties to preserve, then compare candidates and decide whether to keep, revert, or leave each result inconclusive. Apply the process to code, documents, or agent-facing guidance.
- [teach](./skills/teach/SKILL.md): Explain concepts, mechanisms, and methods. Build on what the learner already knows, adapt explanations to feedback, and offer practice when requested. Default to teaching in the conversation; prepare durable learning materials for an explicit need.
- [diagnose](./skills/diagnose/SKILL.md): Investigate problems and anomalies through evidence, competing explanations, and discriminating checks. Handle repeatable, intermittent, historical, and workflow problems, state the strength of causal conclusions, and carry findings into an authorized repair. Read software-specific methods when the problem requires them.
- [technical-writing](./skills/technical-writing/SKILL.md): Write, revise, or review technical documents for human readers, including READMEs, guides, references, and proposals. Organize content around readers' tasks, check technical facts and examples, and preserve conditions and implementation status.
- [code-design](./skills/code-design/SKILL.md): Design types, interfaces, modules, dependencies, and state ownership from real caller usage. Improve existing structures and revisit assumptions exposed during implementation.
- [code-quality](./skills/code-quality/SKILL.md): Analyze code, tests, and code designs, and select or configure formatting, lint, custom rules, and type checking. Independently judge correctness, structure, tests, and change safety against contracts and counterevidence. Report locations, effects, and repair directions.
- [system-architecture](./skills/system-architecture/SKILL.md): Analyze, design, evaluate, select, and evolve systems built from software, people, processes, facilities, or external organizations. Trace responsibilities, handoffs, resources, state, and failure through concrete scenarios. Use the general core with software references for data, distributed guarantees, migration, technology choices, and AI systems.

## Development

Use Node.js 22.12 or later and the pnpm version declared in [package.json](./package.json).

Initialize:

```bash
pnpm install --frozen-lockfile
pnpm hooks:install
```

- `pnpm check` checks formatting for supported files.
- `pnpm docs:format` formats Markdown.
- `pnpm docs:lint` checks Markdown formatting.
- The pre-commit hook automatically formats staged files.

Repository instructions for Agents are in [AGENTS.md](./AGENTS.md).

## License

[MIT License](./LICENSE).

Third-party Skills retain the original licenses and attribution included in their directories.

## Acknowledgments

I learned from and reused material from [pstack](https://github.com/cursor/plugins/tree/main/pstack) and [matt's skills](https://github.com/mattpocock/skills).

The topic map for `system-architecture` draws on [awesome-architecture](https://github.com/study8677/awesome-architecture/tree/7f43e49b95ad9c255418733738fddab4eb0f6a68). Its MIT attribution is retained in both language packages.
