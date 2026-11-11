# rstack

[English](./README.md) | 中文

rstack 是一套 Agent Skill 集合。我使用它们进行真正的工程开发。

rstack 提供的 Skill 是通用的。也可以在此基础上创建和维护项目及个人的偏好与工作流程。

## 范围

每次收录说明来源、用途和采用理由。已有 Skill 可以原样采用，个人版本在使用经历带来具体需求后形成。

Skill 分类、触发方式、个人适配及项目适配随具体收录项逐步确定。

## Skills

英文 Skill 位于 [`skills/`](./skills/)，中文 Skill 位于 [`skills-zh/`](./skills-zh/)。

- [writing-for-agents](./skills-zh/writing-for-agents/SKILL.md)：编写面向 Agent 的内容，适用于 Skill、`AGENTS.md`、Prompt、Tool/MCP 描述、subagent 指令等。组织执行步骤和参考资料，编写准确的技能触发条件，明确读取条件，定义可检查的完成标准。
- [wellsaid](./skills-zh/wellsaid/SKILL.md)：自然、直接地表达，适用于回复、文档、代码注释和协作消息。清理套话、冗余和防御性表述。保留事实、原意及作者的声音，让文字贴合读者和使用场景。
- [reflect](./skills-zh/reflect/SKILL.md)：复盘工作过程，提炼可复用的经验和具体改进建议。从判断、工具使用和发散思考三个视角检查记录，核对发现的证据、适用范围及已有规则。落实用户选定的改动。
- [thinking-method](./skills-zh/thinking-method/SKILL.md)：为当前问题选择或组合机制解释、原因分析、类比、讨论、建模、第一性原理、假设和元认知八种方法。将重要假设写入当前活动的文档，用于计划、复盘、诊断或情境推演。
- [research](./skills-zh/research/SKILL.md)：搜集和核对证据，围绕研究问题形成有出处的结论。追溯一手来源，区分事实、推断和待解分歧。需要保存成果时，将原始资料和待解问题一并整理，便于后续会话接续。
- [improve](./skills-zh/improve/SKILL.md)：围绕约定目标，通过前后对照迭代改进已有成果。先确定基线、评价方法和必须保持的属性，再逐轮比较候选改动，作出保留、撤回或待定的判断。适用于代码、文档和 Agent 指引等对象。
- [teach](./skills-zh/teach/SKILL.md)：讲解概念、机制和方法。从学习者已有的认识出发，根据反馈调整讲法，按需安排练习。默认在会话中教学，持久学习材料按明确需要安排。
- [diagnose](./skills-zh/diagnose/SKILL.md)：围绕具体问题及异常取得证据、比较解释、执行有区分力的检查。处理可重复、偶发、历史及流程问题，说明因果结论的证据强度，按授权衔接修复。软件问题按需读取专项方法。
- [technical-writing](./skills-zh/technical-writing/SKILL.md)：编写、修订或审阅面向人的技术文档，适用于 README、指南、参考资料及提案。围绕读者任务组织内容，核对技术事实及示例，保留适用条件和实现状态。
- [code-design](./skills-zh/code-design/SKILL.md)：从真实调用用法推导类型、接口、模块、依赖及状态归属，改进既有结构，重新审视实施中暴露的设计假设。
- [code-quality](./skills-zh/code-quality/SKILL.md)：分析代码、测试及代码设计的质量，选择或配置格式化、lint、自定义规则及类型检查。按契约及反证独立判断正确性、结构、测试和变更安全性，说明问题位置、影响及修复方向。
- [blast-radius](./skills-zh/blast-radius/SKILL.md)：从拟议或已实现的软件改动追踪受影响的消费者、历史数据及运行行为。识别决定结论的前提，取得相称证据，保留已排除路径，确定具体检查及回退条件。
- [system-architecture](./skills-zh/system-architecture/SKILL.md)：分析、设计、评估、选择及演进由软件、人员、流程、设施或外部组织构成的系统。沿具体情景追踪责任、交接、资源、状态及失效。通用核心配合软件参考，处理数据、分布式保证、迁移、技术选择及 AI 系统。
- [ddd](./skills-zh/ddd/SKILL.md)：探索领域知识，形成共同语言，选择限界上下文及战略重点，表达不变量和领域操作，随新认识演进模型。专题参考覆盖身份、聚合、生命周期、事件、模型落地及验证。
- [prototype](./skills-zh/prototype/SKILL.md)：通过低成本、可丢弃原型回答设计选择及可行性问题。在可比条件下比较有实质差异的候选，操作实际界面或运行程序，交接证据、取舍、建议及可运行产物。
- [statechart](./skills-zh/statechart/SKILL.md)：建模状态行为，表达安全性和进展性质，绘制读者视角的状态图，将检查对应到实际实现。按问题选择轻量推演或完整的 TLA+/TLC 示例，由用户显式请求调用。

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

## 许可

rstack 的原创内容采用 [MIT License](./LICENSE)。

第三方材料保留各自的许可。[THIRD-PARTY-NOTICES.zh.md](./THIRD-PARTY-NOTICES.zh.md) 区分已确认的表达复用、保守保留及仅概念依据三类情况，集中说明版权主体、适用许可、来源版本及覆盖文件或章节，包含第三方材料的 MIT 完整条款及 `ddd` 两个语言包的 CC BY 4.0 署名。

采用内容变化时同步更新声明。相关表达及其翻译全部退出版本后删除对应条目，仅部分移除时缩小覆盖范围，文本继续改编来源时保留条目。只剩方法层面的影响时，将该来源移入概念依据。保留来源结构或示例的翻译和重组属于改编。已发布版本保留随其提供的声明。

## 致谢

rstack 的 Skill 借鉴了以下项目的资料：[pstack](https://github.com/cursor/plugins/tree/main/pstack)，[matt's skills](https://github.com/mattpocock/skills)。
