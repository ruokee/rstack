# rstack

English | [中文](./README.zh.md)

rstack is a collection of Agent Skills. I use them for real engineering work.

The Skills in rstack are general-purpose. They can also serve as a basis for creating and maintaining project-specific and personal preferences and workflows.

## Scope

Each addition records its source, purpose, and reason for inclusion. Upstream Skills can be adopted as they are. A custom version can evolve when experience reveals a concrete need.

Skill categories, invocation choices, and personal or project adaptation are developed alongside the selected Skills.

## Skills

English Skills are in `./skills/`, and Chinese Skills are in `./skills-zh/`.

- [use-rstack](./skills/use-rstack/SKILL.md): Choose a Skill or playbook for the request, apply existing arrangements, connect activities, and preserve the evidence needed for completion or resumption.
- [plan-task](./skills/plan-task/SKILL.md): Create or revise a plan for one task. Identify what can start, what each handoff supplies, which units can run in parallel, and how to check the final result.
- [create-playbook](./skills/create-playbook/SKILL.md): Turn practice, new needs, or feedback into reusable workflows. Establish their maintenance ownership, write the activity relationships, and connect the result to a discoverable entry.
- [writing-for-agents](./skills/writing-for-agents/SKILL.md): Write content for agents, including Skills, `AGENTS.md`, prompts, tool/MCP descriptions, and subagent instructions. Organize steps and reference material, write precise skill triggers, make reading conditions explicit, and define checkable completion criteria.
- [wellsaid](./skills/wellsaid/SKILL.md): Write clear, natural text for replies, documents, code comments, and collaboration messages. Remove stock phrasing, filler, and defensive language. Preserve facts, meaning, and the author's voice while adapting the text to its readers and purpose.
- [reflect](./skills/reflect/SKILL.md): Review work sessions for reusable lessons and concrete improvements. Examine the record through judgment, tooling, and divergent lenses, then check findings against the evidence, their scope, and existing guidance. Apply the changes the user selects.
- [thinking-method](./skills/thinking-method/SKILL.md): Choose or combine eight methods for the question at hand: how, why, analogy, discussion, modeling, first-principle reasoning, hypothesis, and metacognition. Make important assumptions explicit in the current activity's document, then use them for planning, reflection, diagnosis, or hypothetical reasoning.
- [research](./skills/research/SKILL.md): Gather and assess evidence to answer research questions with traceable findings. Follow claims to primary sources and distinguish facts, inferences, and unresolved disagreements. For durable delivery, preserve source material and open questions so another session can continue the work.
- [feature-map](./skills/feature-map/SKILL.md): Build and maintain a project index from user-visible features to their entry points and implementation. Use the map to locate existing behavior during planning, implementation, and verification.
- [improve](./skills/improve/SKILL.md): Improve existing work through evidence-based iterations against an agreed goal. Establish a baseline, comparison method, and properties to preserve, then compare candidates and decide whether to keep, revert, or leave each result inconclusive. Apply the process to code, documents, or agent-facing guidance.
- [teach](./skills/teach/SKILL.md): Explain concepts, mechanisms, and methods. Build on what the learner already knows, adapt explanations to feedback, and offer practice when requested. Default to teaching in the conversation; prepare durable learning materials for an explicit need.
- [diagnose](./skills/diagnose/SKILL.md): Investigate problems and anomalies through evidence, competing explanations, and discriminating checks. Handle repeatable, intermittent, historical, and workflow problems, state the strength of causal conclusions, and carry findings into an authorized repair. Read software-specific methods when the problem requires them.
- [technical-writing](./skills/technical-writing/SKILL.md): Write, revise, or review technical documents for human readers, including READMEs, guides, references, and proposals. Organize content around readers' tasks, check technical facts and examples, and preserve conditions and implementation status.
- [code-design](./skills/code-design/SKILL.md): Design types, interfaces, modules, dependencies, and state ownership from real caller usage. Improve existing structures and revisit assumptions exposed during implementation.
- [type-driven-design](./skills/type-driven-design/SKILL.md): Design types from operations and meaning. Diagnose existing models, complete the target design, and migrate producers and consumers in coherent batches. Use Python guidance and a complete batch import example to examine representations, caller readability, and actual guarantees.
- [code-quality](./skills/code-quality/SKILL.md): Analyze code, tests, and code designs, and select or configure formatting, lint, custom rules, and type checking. Independently judge correctness, structure, tests, and change safety against contracts and counterevidence. Report locations, effects, and repair directions.
- [engineering-principles](./skills/engineering-principles/SKILL.md): Select principles for code, documentation, and configuration changes. Consult references for their purpose, conditions, tradeoffs, and examples.
- [blast-radius](./skills/blast-radius/SKILL.md): Trace proposed or implemented software changes to affected consumers, historical data, and runtime behavior. Identify decisive premises, gather proportionate evidence, preserve excluded paths, and choose concrete checks and rollback conditions.
- [create-verification](./skills/create-verification/SKILL.md): Create and maintain verification methods for specific objects. Agree on criteria and scope, select the necessary artifacts, build and exercise the method, and provide an entry point for later use.
- [system-architecture](./skills/system-architecture/SKILL.md): Analyze, design, evaluate, select, and evolve systems built from software, people, processes, facilities, or external organizations. Trace responsibilities, handoffs, resources, state, and failure through concrete scenarios. Use the general core with software references for data, distributed guarantees, migration, technology choices, and AI systems.
- [ddd](./skills/ddd/SKILL.md): Explore domain knowledge, build a ubiquitous language, choose bounded contexts and strategic priorities, express invariants and domain operations, and evolve models as understanding changes. Use focused references for identity, aggregates, lifecycle, events, implementation, and validation.
- [prototype](./skills/prototype/SKILL.md): Answer design choices and feasibility questions through low-cost, disposable prototypes. Compare meaningful alternatives under comparable conditions, observe the actual interface or runtime, and hand off evidence, tradeoffs, a recommendation, and a runnable artifact.
- [statechart](./skills/statechart/SKILL.md): Model stateful behavior, express safety and progress properties, draw reader-facing statecharts, and connect checks to implementation. Use a lightweight walkthrough or the complete TLA+/TLC example according to the question. Invoked on an explicit user request.

## Usage

Use [use-rstack](./skills/use-rstack/SKILL.md) when the Agent needs to choose a specialist Skill or a playbook, connect activities, or resume work. When the activity is already clear, read the relevant specialist Skill directly.

To use `use-rstack`, install the complete Skill set from the chosen language directory. Keep the Skill directories as siblings and preserve the whole `use-rstack` package, including `playbooks/`. Its navigation links to every other Skill and explains when to read it.

### Playbooks

A playbook is a reusable Markdown workflow that describes activities, dependencies, choices, feedback, and completion conditions. The Agent uses `use-rstack` to find and apply a suitable playbook, and [create-playbook](./skills/create-playbook/SKILL.md) to create or maintain one. Link saved playbooks from existing project, workspace, or user guidance so they can be found later.

Public playbooks ship with `use-rstack` in its `playbooks/` subdirectory. This directory initially contains `.gitkeep`; concrete playbooks will be added as needs arise.

Reuse an established explicit private location. Otherwise store personal workflows in `~/.agent/rstack/playbooks/` and project or workspace workflows in `.rstack/playbooks/` at the corresponding root. Create the private directory when first saving a workflow and connect the result to an existing discovery entry.

rstack releases maintain the public package content. Users, projects, and workspaces maintain their private workflows in these independent locations and decide how private versions incorporate public changes. Project commands, selection criteria, and navigation content come from the environment where the workflow is used.

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

See [Third-party notices](./THIRD-PARTY-NOTICES.md) for the licenses and copyright notices that apply to third-party material.

When distributing a Skill separately, include the applicable copyright notices and full license texts with the files you distribute.

## Acknowledgments

rstack's Skills draw on material from [pstack](https://github.com/cursor/plugins/tree/main/pstack) and [matt's skills](https://github.com/mattpocock/skills).
