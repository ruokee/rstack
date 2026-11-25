# rstack

[English](./README.md) | 中文

rstack 是一套 Agent Skill 集合。我使用它们进行真正的工程开发。

rstack 提供的 Skill 是通用的。也可以在此基础上创建和维护项目及个人的偏好与工作流程。

## 范围

每次收录说明来源、用途和采用理由。已有 Skill 可以原样采用，个人版本在使用经历带来具体需求后形成。

Skill 分类、触发方式、个人适配及项目适配随具体收录项逐步确定。

## Skills

英文 Skill 位于 `./skills/`，中文 Skill 位于 `./skills-zh/`。

### 通用

- [thinking-method](./skills-zh/thinking-method/SKILL.md)：为当前问题选择或组合机制解释、原因分析、类比、讨论、建模、第一性原理、假设和元认知八种方法。将重要假设写入当前活动的文档，用于计划、复盘、诊断或情境推演。
- [research](./skills-zh/research/SKILL.md)：搜集和核对证据，围绕研究问题形成有出处的结论。追溯一手来源，区分事实、推断和待解分歧。需要保存成果时，将原始资料和待解问题一并整理，便于后续会话接续。
- [teach](./skills-zh/teach/SKILL.md)：讲解概念、机制和方法。从学习者已有的认识出发，根据反馈调整讲法，按需安排练习。默认在会话中教学，持久学习材料按明确需要安排。
- [diagnose](./skills-zh/diagnose/SKILL.md)：围绕具体问题及异常取得证据、比较解释、执行有区分力的检查。处理可重复、偶发、历史及流程问题，说明因果结论的证据强度，按授权衔接修复。软件问题按需读取专项方法。
- [engineering-principles](./skills-zh/engineering-principles/SKILL.md)：为代码、文档及配置变更选择工程原则，按需读取目的、条件、取舍及例子。

### 工作流

- [use-rstack](./skills-zh/use-rstack/SKILL.md)：为当前请求选择 Skill 或 playbook，沿用有效安排，衔接活动，保留完成及接续工作所需的证据。
- [plan-task](./skills-zh/plan-task/SKILL.md)：为一次任务制定或修订计划，指出可开始的工作、交接所需的产物、可并行的单元及整体验收方式。
- [create-playbook](./skills-zh/create-playbook/SKILL.md)：从实践、新需求或反馈形成可复用流程。确定维护归属，编写活动关系，将结果接入可发现的入口。
- [improve](./skills-zh/improve/SKILL.md)：围绕约定目标，通过前后对照迭代改进已有成果。先确定基线、评价方法和必须保持的属性，再逐轮比较候选改动，作出保留、撤回或待定的判断。适用于代码、文档和 Agent 指引等对象。
- [reflect](./skills-zh/reflect/SKILL.md)：复盘工作过程，提炼可复用的经验和具体改进建议。从判断、工具使用和发散思考三个视角检查记录，核对发现的证据、适用范围及已有规则。落实用户选定的改动。

### 设计

- [system-architecture](./skills-zh/system-architecture/SKILL.md)：分析、设计、评估、选择及演进由软件、人员、流程、设施或外部组织构成的系统。沿具体情景追踪责任、交接、资源、状态及失效。通用核心配合软件参考，处理数据、分布式保证、迁移、技术选择及 AI 系统。
- [ddd](./skills-zh/ddd/SKILL.md)：探索领域知识，形成共同语言，选择限界上下文及战略重点，表达不变量和领域操作，随新认识演进模型。专题参考覆盖身份、聚合、生命周期、事件、模型落地及验证。
- [code-design](./skills-zh/code-design/SKILL.md)：从真实调用用法推导类型、接口、模块、依赖及状态归属，改进既有结构，重新审视实施中暴露的设计假设。
- [type-driven-design](./skills-zh/type-driven-design/SKILL.md)：从操作和含义推导类型。诊断已有模型，完成整体目标设计，按连贯批次迁移生产者和消费者。结合 Python 指导及完整批量导入案例，判断表示取舍、调用可读性和实际保证。
- [prototype](./skills-zh/prototype/SKILL.md)：通过低成本、可丢弃原型回答设计选择及可行性问题。在可比条件下比较有实质差异的候选，操作实际界面或运行程序，交接证据、取舍、建议及可运行产物。

### 验证与审查

- [blast-radius](./skills-zh/blast-radius/SKILL.md)：从拟议或已实现的软件改动追踪受影响的消费者、历史数据及运行行为。识别决定结论的前提，取得相称证据，保留已排除路径，确定具体检查及回退条件。
- [code-quality](./skills-zh/code-quality/SKILL.md)：分析代码、测试及代码设计的质量，选择或配置格式化、lint、自定义规则及类型检查。按契约及反证独立判断正确性、结构、测试和变更安全性，说明问题位置、影响及修复方向。
- [create-verification](./skills-zh/create-verification/SKILL.md)：为具体对象创建和维护验证方法。明确判据及范围，选择必要产物，建设并实际使用方法，提供后续使用入口。

### 写作

- [wellsaid](./skills-zh/wellsaid/SKILL.md)：自然、直接地表达，适用于回复、文档、代码注释和协作消息。清理套话、冗余和防御性表述。保留事实、原意及作者的声音，让文字贴合读者和使用场景。
- [technical-writing](./skills-zh/technical-writing/SKILL.md)：编写、修订或审阅面向人的技术文档，适用于 README、指南、参考资料及提案。围绕读者任务组织内容，核对技术事实及示例，保留适用条件和实现状态。
- [writing-for-agents](./skills-zh/writing-for-agents/SKILL.md)：编写面向 Agent 的内容，适用于 Skill、`AGENTS.md`、Prompt、Tool/MCP 描述、subagent 指令等。组织执行步骤和参考资料，编写准确的技能触发条件，明确读取条件，定义可检查的完成标准。

### 实验性 Skill

- [feature-map](./skills-zh/feature-map/SKILL.md)：建立和维护项目功能地图，从用户用语查到功能入口及实现位置，供规划、实现和验证时定位现有行为。
- [statechart](./skills-zh/statechart/SKILL.md)：建模状态行为，表达安全性和进展性质，绘制读者视角的状态图，将检查对应到实际实现。按问题选择轻量推演或完整的 TLA+/TLC 示例，由用户显式请求调用。

## 使用

Agent 需要选择专业 Skill 或 playbook、衔接活动或接续工作时，使用 [use-rstack](./skills-zh/use-rstack/SKILL.md)。活动已经明确时，直接读取相应的专业 Skill。

使用 `use-rstack` 前，安装所选语言目录中的整套 Skill。保持各 Skill 目录同级，保留完整 `use-rstack` 包及其 `playbooks/` 子目录。入口链接其余全部 Skill，并说明各自的读取条件。

### Playbooks

Playbook 是用 Markdown 保存的可复用工作流程，说明活动、依赖、选择、反馈及完成条件。Agent 通过 `use-rstack` 查找并采用适用的 playbook，通过 [create-playbook](./skills-zh/create-playbook/SKILL.md) 创建或维护 playbook。将保存的流程接入已有项目、工作区或个人导航，供后续查找。

公共 playbook 随 `use-rstack` 包分发，位于其 `playbooks/` 子目录。该目录初始包含 `.gitkeep`，具体流程随实际需要补充。

私有流程沿用已有明确位置。其余情况将个人流程保存在 `~/.agent/rstack/playbooks/`，项目或工作区流程保存在相应根目录的 `.rstack/playbooks/`。首次保存流程时建立私有目录，将结果接入已有发现入口。

rstack 的发布维护公共包内容。用户、项目及工作区在这些独立位置维护私有流程，并决定私有版本如何吸收公共变化。项目命令、选择判据及导航内容从使用流程的环境取得。

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

第三方材料适用的许可和版权声明见[第三方声明](./THIRD-PARTY-NOTICES.zh.md)。

单独分发 Skill 时，请在分发物中随附适用的版权声明和许可全文。

## 致谢

rstack 的 Skill 借鉴了以下项目的资料：[pstack](https://github.com/cursor/plugins/tree/main/pstack)，[matt's skills](https://github.com/mattpocock/skills)。
