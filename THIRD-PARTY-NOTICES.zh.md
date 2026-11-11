# 第三方声明

[English](./THIRD-PARTY-NOTICES.md) | 中文

下列 rstack Skill 的采用范围同时适用于 `skills/` 和 `skills-zh/`。

## MIT 许可材料

### Matt Pocock

来源：[mattpocock/skills@b0618bc](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404)。

**已确认表达复用**

- `writing-for-agents` 复用并翻译 `skills/productivity/writing-for-agents/SKILL.md` 及 `SKILL-MECHANICS.md` 中的段落。范围：`writing-for-agents/`。

**保守保留**

- `ddd` 借鉴 `skills/engineering/domain-modeling/` 的领域探索方法。范围：`SKILL.md`、`discovery/` 及 `modeling/evolution.md`。
- `code-design` 借鉴 `skills/engineering/codebase-design/` 及 `skills/engineering/improve-codebase-architecture/` 的接口契约与既有代码改进方法。范围：`interfaces.md`、`existing-code.md` 及 `design-principles/deep-modules.md`。

### Lauren Tan

来源：[cursor/plugins pstack@5bf2b15](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack)。

**已确认表达复用**

- `wellsaid` 的 AI 腔模式清单及编辑流程改编并翻译自 `skills/unslop/SKILL.md`。范围：`SKILL.md` 中的对应部分。

**保守保留**

- `ddd` 借鉴 `skills/principle-model-the-domain/SKILL.md` 的显式状态表达及围绕领域知识组织的方法。范围：`SKILL.md` 及 `modeling/implementation.md`。
- `code-design` 借鉴 `skills/architect/` 的用法先行设计、结构候选及设计检查。范围：`interfaces.md`、`existing-code.md` 及 `design-principles/deep-modules.md`。
- `technical-writing` 借鉴 `skills/technical-writing/SKILL.md`。范围：`SKILL.md`。
- `reflect` 借鉴 `skills/reflect/` 的审阅视角及综合判据。范围：`SKILL.md` 及 `references/`。
- `prototype` 借鉴 `skills/poteto-mode/playbooks/prototype.md` 的原型流程。范围：`SKILL.md`。

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

## CC BY 4.0 材料

Eric Evans，Domain Language, Inc.，Domain-Driven Design Reference, Definitions and Pattern Summaries，版本 2015-03。© 2015 Eric Evans。

- [原始 PDF](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf)。
- [知识共享署名 4.0 国际许可](https://creativecommons.org/licenses/by/4.0/)。
- [法律文本](https://creativecommons.org/licenses/by/4.0/legalcode.en)，包括第 5 节的保证免责声明及责任限制。

`ddd` 对原作定义及模式说明作摘要、重组和英中适配。改动包括将面向对象说明扩展至函数式模型，按实际机制限定一致性、声明式保证及事件描述，补充原创解释和示例。

改编范围为 `ddd/SKILL.md` 及 `ddd/` 下的以下参考：

- `discovery/`：`knowledge.md`、`language.md`。
- `strategic/`：`subdomains.md`、`bounded-contexts.md`、`context-mapping.md`、`large-scale-structure.md`。
- `tactical/`：`identity.md`、`aggregates.md`、`behavior.md`、`lifecycle.md`、`events.md`。
- `modeling/`：`implementation.md`、`evolution.md`、`validation.md`。

改编内容采用 CC BY 4.0。可独立享有版权的原创增补采用[项目 MIT 许可](./LICENSE)。

## 概念依据

- `improve`：Pstack 的 `skills/poteto-mode/playbooks/hillclimb.md`、prove-it-works、build-the-lever、laziness-protocol、show-me-your-work。
- `teach`：Pstack 的 `skills/teach/SKILL.md`、`skills/bro/SKILL.md`；Matt Pocock 的 `teach`、`wait-what`。
- `diagnose`：Matt Pocock 的 `diagnosing-bugs`；Pstack 的 `skills/poteto-mode/playbooks/bug-fix.md`、`runtime-forensics.md`、`trace-forensics.md`。
- `blast-radius`：Pstack 的 `skills/blast-radius/SKILL.md`、`skills/why/`；Matt Pocock 的 `pr`。
- `statechart`：提交 `de8ee15dd1194627d21eb5fcd41cb1873208dabb` 中 Pstack 的 `skills/statechart/SKILL.md`、`skills/create-formal-verification-skill/SKILL.md`、`skills/maintain-formal-verification-skill/SKILL.md`。
- `system-architecture`：[awesome-architecture](https://github.com/study8677/awesome-architecture/tree/7f43e49b95ad9c255418733738fddab4eb0f6a68)。
- `research`：Matt Pocock 的 `research`。
- 领域建模与验证：[Specifications](https://martinfowler.com/apsupp/spec.pdf)，Eric Evans、Martin Fowler；[EventStorming](https://www.eventstorming.com/)，Alberto Brandolini；[C4 model](https://c4model.com/abstractions/container)，Simon Brown；[Linearizability](https://jepsen.io/consistency/models/linearizable)，Jepsen 引用 Herlihy、Wing；[The Raft Consensus Algorithm](https://raft.github.io/)；[statecharts.dev](https://statecharts.dev/)；Leslie Lamport 的 [TLA+ Tools](https://lamport.azurewebsites.net/tla/tla.html) 及 [TLC Model Checker](https://github.com/tlaplus/tlaplus)。
- 技术写作：[Diátaxis](https://diataxis.fr/)、[Google Technical Writing](https://developers.google.com/tech-writing)、[ASD-STE100](https://www.asd-ste100.org/)。
