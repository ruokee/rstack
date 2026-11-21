# 第三方声明

[English](./THIRD-PARTY-NOTICES.md) | 中文

下列 rstack Skill 的采用范围同时适用于 `skills/` 和 `skills-zh/`。

## MIT 许可材料

### Matt Pocock

来源：[mattpocock/skills@b0618bc](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404)。

**已确认表达复用**

- `writing-for-agents` 复用并翻译 `skills/productivity/writing-for-agents/SKILL.md` 及 `SKILL-MECHANICS.md` 中的段落。范围：`writing-for-agents/`。

### Lauren Tan

来源：[cursor/plugins pstack@5bf2b15](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack)。

**已确认表达复用**

- `wellsaid` 的 AI 腔模式清单及编辑流程改编并翻译自 `skills/unslop/SKILL.md`。范围：`SKILL.md` 中的对应部分。

### MIT 许可条款

```text
MIT License

Copyright (c) 2026 Matt Pocock
Copyright (c) 2026 Lauren Tan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 概念依据

以下来源为 rstack 独立编写的内容提供概念和方法依据。

- `plan-task`：Matt Pocock 的 [to-tickets](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/to-tickets) 用于按可验证的结果交接；[Humanizing Work](https://www.humanizingwork.com/the-humanizing-work-guide-to-splitting-user-stories/) 用于按完整的用户操作拆分；[Stripe](https://stripe.com/blog/online-migrations) 用于持续写入时的迁移边界；Ray Amjad 对 [Agent 协作的讨论](https://www.youtube.com/watch?v=yrRpnx_iugY)用于区分独立工作和依赖共同决定的工作。
- `feature-map`：Lauren Tan 的 [pstack 验证地图](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/create-verification-skill/references/feature-map-example)提供用户操作路径的描述方法；[LangWatch 功能地图](https://github.com/langwatch/langwatch/blob/ea636c6f90a5934a6913d61d6408c092ac9359bd/.claude/skills/feature-map/SKILL.md)提供将多个入口归入同一功能并与代码核对的方法。
- `ddd`：Eric Evans，Domain Language, Inc.，_Domain-Driven Design Reference: Definitions and Pattern Summaries_，版本 2015-03，提供领域建模概念。[原始手册](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf)，© 2015 Eric Evans，采用 [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)。Matt Pocock 的 [domain-modeling](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/domain-modeling) 提供探索和语言工作方法。Pstack 的 [principle-model-the-domain](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/principle-model-the-domain/SKILL.md) 提供显式状态及围绕领域知识组织的方法。
- `code-design`：Matt Pocock 的 [codebase-design](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/codebase-design) 及 [improve-codebase-architecture](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/improve-codebase-architecture)，用于接口契约及结构改进；Pstack 的 [architect](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/architect)，用于用法先行设计及结构比较；John Ousterhout 的 _A Philosophy of Software Design_，用于模块深度及信息隐藏。
- `technical-writing`：Pstack 的 [technical-writing](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/technical-writing/SKILL.md)，用于按读者需求组织材料、准确用词及说明操作条件。
- `reflect`：Pstack 的 [reflect](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/reflect)，用于独立审阅视角及综合；Matt Pocock 的 [retro](https://github.com/mattpocock/skills/blob/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/retro/SKILL.md)，用于区分可机械约束的条件及判断。
- `prototype`：Pstack 的 [prototype playbook](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/poteto-mode/playbooks/prototype.md)，用于可丢弃实验、可比候选及设计选择前的观察。
- `use-rstack` 和 `create-playbook`：Pstack 在 5bf2b15 的 [poteto-mode](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/poteto-mode/SKILL.md) 及 [figure-it-out](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/figure-it-out/SKILL.md)，用于方法选路、普通 Markdown 流程及按需求组织活动的概念。正文和组织为 rstack 独立编写。
- `use-rstack`：Matt Pocock 在 b0618bc 的 [ask-matt](https://github.com/mattpocock/skills/blob/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/ask-matt/SKILL.md)，用于按读者问题组织 Skill 导航及说明能力关系的概念。导航依据 rstack 的 Skill 独立编写。
- `engineering-principles`：[Pstack 原则集 5bf2b15](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills)。
- `type-driven-design`：[How to Design Programs](https://htdp.org/2020-8-1/Book/part_one.html)，作者 Matthias Felleisen、Robert Bruce Findler、Matthew Flatt、Shriram Krishnamurthi，用于数据定义及对应消费者；Alexis King 的 [Parse, don't validate](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/)，用于在表示中以相称精度保留已取得的知识；Mark Seemann 的 [At the boundaries, applications aren't functional](https://blog.ploeh.dk/2022/05/02/at-the-boundaries-applications-arent-functional/)，用于边界模型职责及维护成本。Python 参考在机制旁链接 Python、typing 和 msgspec 官方文档。流程、组织和示例为 rstack 原创内容。
- `create-verification`：Pstack 在 5bf2b15 的 [create-verification-skill](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/create-verification-skill/SKILL.md) 及 [maintain-verification-skill](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/maintain-verification-skill/SKILL.md)；[NASA 产品验证](https://www.nasa.gov/reference/5-3-product-verification/)、[PIT](https://pitest.org/)、[Anthropic Agent 评估](https://www.anthropic.com/research/demystifying-evals-for-ai-agents)、[Hypothesis](https://hypothesis.readthedocs.io/en/latest/quickstart.html)、[TLA+ Tools](https://lamport.azurewebsites.net/tla/tools.html)、[Pact](https://docs.pact.io/consumer/contract_tests_not_functional_tests)、[Google SRE canary](https://sre.google/workbook/canarying-releases/)、[Testcontainers](https://testcontainers.com/getting-started/)、[WireMock](https://wiremock.org/docs/simulating-faults/)、[OpenTelemetry 信号](https://opentelemetry.io/docs/concepts/signals/)及 [Playwright 视觉比较](https://playwright.dev/docs/test-snapshots)。

- `improve`：Pstack 的 `skills/poteto-mode/playbooks/hillclimb.md`、prove-it-works、build-the-lever、laziness-protocol、show-me-your-work。
- `teach`：Pstack 的 `skills/teach/SKILL.md`、`skills/bro/SKILL.md`；Matt Pocock 的 `teach`、`wait-what`。
- `diagnose`：Matt Pocock 的 `diagnosing-bugs`；Pstack 的 `skills/poteto-mode/playbooks/bug-fix.md`、`runtime-forensics.md`、`trace-forensics.md`。
- `blast-radius`：Pstack 的 `skills/blast-radius/SKILL.md`、`skills/why/`；Matt Pocock 的 `pr`。
- `statechart`：提交 `de8ee15dd1194627d21eb5fcd41cb1873208dabb` 中 Pstack 的 `skills/statechart/SKILL.md`、`skills/create-formal-verification-skill/SKILL.md`、`skills/maintain-formal-verification-skill/SKILL.md`。
- `system-architecture`：[awesome-architecture](https://github.com/study8677/awesome-architecture/tree/7f43e49b95ad9c255418733738fddab4eb0f6a68)。
- `research`：Matt Pocock 的 `research`。
- 领域建模与验证：[Specifications](https://martinfowler.com/apsupp/spec.pdf)，Eric Evans、Martin Fowler；[EventStorming](https://www.eventstorming.com/)，Alberto Brandolini；[C4 model](https://c4model.com/abstractions/container)，Simon Brown；[Linearizability](https://jepsen.io/consistency/models/linearizable)，Jepsen 引用 Herlihy、Wing；[The Raft Consensus Algorithm](https://raft.github.io/)；[statecharts.dev](https://statecharts.dev/)；Leslie Lamport 的 [TLA+ Tools](https://lamport.azurewebsites.net/tla/tla.html) 及 [TLC Model Checker](https://github.com/tlaplus/tlaplus)。
- 技术写作：[Diátaxis](https://diataxis.fr/)、[Google Technical Writing](https://developers.google.com/tech-writing)、[ASD-STE100](https://www.asd-ste100.org/)。
