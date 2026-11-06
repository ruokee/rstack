# rstack

[English](./README.md) | 中文

rstack 是一套 Agent Skill 集合。我使用它们进行真正的工程开发。

rstack 提供的 Skill 是通用的。也可以在此基础上创建和维护项目及个人的偏好与工作流程。

## 范围

每次收录说明来源、用途和采用理由。已有 Skill 可以原样采用，个人版本在使用经历带来具体需求后形成。

Skill 分类、触发方式、个人适配及项目适配随具体收录项逐步确定。

## Skills

英文 Skill 位于 [`skills/`](./skills/)，中文 Skill 位于 [`skills-zh/`](./skills-zh/)。

- [writing-for-agents](./skills-zh/writing-for-agents/SKILL.md)：编写 Agent 使用的文档，来自 [matt](https://github.com/mattpocock/skills)。
- [wellsaid](./skills-zh/wellsaid/SKILL.md)：自然、直接地表达，受 [Lauren Tan 的 unslop](https://github.com/cursor/plugins/blob/main/pstack/skills/unslop/SKILL.md) 启发。

## 开发

使用 Node.js 22.12 或更新版本，以及 [package.json](./package.json) 声明的 pnpm 版本。

初始化：

```bash
pnpm install --frozen-lockfile
pnpm hooks:install
```

- `pnpm check` 检查支持的文件格式。
- `pnpm docs:format` 格式化 Markdown。
- `pnpm docs:lint` 检查 Markdown 格式。
- pre-commit 钩子会自动格式化暂存文件。

Agent 使用的仓库约定见 [AGENTS.md](./AGENTS.md)。

## 致谢

我从以下项目中学习和重用了资料：[pstack](https://github.com/cursor/plugins/tree/main/pstack)，[matt's skills](https://github.com/mattpocock/skills)。

## 许可

[MIT License](./LICENSE)。

第三方 Skill 保留各自目录中的原有许可及署名。
