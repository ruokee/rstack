# rstack

English | [中文](./README.zh.md)

rstack is a collection of Agent Skills. I use them for real engineering work.

The Skills in rstack are general-purpose. They can also serve as a basis for creating and maintaining project-specific and personal preferences and workflows.

## Scope

Each addition records its source, purpose, and reason for inclusion. Upstream Skills can be adopted as they are. A custom version can evolve when experience reveals a concrete need.

Skill categories, invocation choices, and personal or project adaptation are developed alongside the selected Skills.

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
- [blast-radius](./skills/blast-radius/SKILL.md): Trace proposed or implemented software changes to affected consumers, historical data, and runtime behavior. Identify decisive premises, gather proportionate evidence, preserve excluded paths, and choose concrete checks and rollback conditions.
- [system-architecture](./skills/system-architecture/SKILL.md): Analyze, design, evaluate, select, and evolve systems built from software, people, processes, facilities, or external organizations. Trace responsibilities, handoffs, resources, state, and failure through concrete scenarios. Use the general core with software references for data, distributed guarantees, migration, technology choices, and AI systems.
- [ddd](./skills/ddd/SKILL.md): Explore domain knowledge, build a ubiquitous language, choose bounded contexts and strategic priorities, express invariants and domain operations, and evolve models as understanding changes. Use focused references for identity, aggregates, lifecycle, events, implementation, and validation.
- [prototype](./skills/prototype/SKILL.md): Answer design choices and feasibility questions through low-cost, disposable prototypes. Compare meaningful alternatives under comparable conditions, observe the actual interface or runtime, and hand off evidence, tradeoffs, a recommendation, and a runnable artifact.
- [statechart](./skills/statechart/SKILL.md): Model stateful behavior, express safety and progress properties, draw reader-facing statecharts, and connect checks to implementation. Use a lightweight walkthrough or the complete TLA+/TLC example according to the question. Invoked on an explicit user request.

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

Original rstack content is available under the [MIT License](./LICENSE).

Third-party material remains under its own license. [THIRD-PARTY-NOTICES.md](./THIRD-PARTY-NOTICES.md) separates confirmed expression reuse from conservative retention and from concept-only references. It lists the copyright holders, license, source versions, and covered files or sections, including the full MIT text for third-party material and the CC BY 4.0 attribution for the `ddd` packages.

Update the notices when the adopted content changes. Remove an entry after all adapted expression and its translations have left the repository, narrow its coverage when only part remains, and keep it when text still adapts the source. Move a source to concept references when only method-level influence remains. Translations and reorganizations that retain the source's structure or examples count as adaptation. Historical releases keep the notices they shipped with.

## Acknowledgments

rstack's Skills draw on material from [pstack](https://github.com/cursor/plugins/tree/main/pstack) and [matt's skills](https://github.com/mattpocock/skills).
