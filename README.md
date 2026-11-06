# rstack

English | [中文](./README.zh.md)

rstack is a collection of Agent Skills. I use them for real engineering work.

The Skills in rstack are general-purpose. They can also serve as a basis for creating and maintaining project-specific and personal preferences and workflows.

## Scope

Each addition records its source, purpose, and reason for inclusion. Upstream Skills can be adopted as they are. A custom version can evolve when experience reveals a concrete need.

Skill categories, invocation choices, and personal or project adaptation are developed alongside the selected Skills.

## Skills

English Skills are in [`skills/`](./skills/), and Chinese Skills are in [`skills-zh/`](./skills-zh/).

- [writing-for-agents](./skills/writing-for-agents/SKILL.md): Write documents for agents. From [matt](https://github.com/mattpocock/skills).
- [wellsaid](./skills/wellsaid/SKILL.md): Write clear, natural text. Inspired by [Lauren Tan's unslop](https://github.com/cursor/plugins/blob/main/pstack/skills/unslop/SKILL.md).
- [reflect](./skills/reflect/SKILL.md): Review work sessions and propose improvements. From Lauren Tan and Matt Pocock.
- [thinking-method](./skills/thinking-method/SKILL.md): An original rstack Skill for reusable analysis, grouping seven thinking methods behind one model-invoked entry.

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

## Acknowledgments

I learned from and reused material from [pstack](https://github.com/cursor/plugins/tree/main/pstack) and [matt's skills](https://github.com/mattpocock/skills).

## License

[MIT License](./LICENSE).

Third-party Skills retain the original licenses and attribution included in their directories.
