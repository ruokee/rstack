# 来源署名

本包包含原创内容及下列来源的改编。再分发时保留本声明和 [LICENSE](./LICENSE)。原创增补及 MIT 来源改编贡献采用 MIT。Eric Evans 参考手册的改编内容保留 CC BY 4.0。MIT 授权不替代该许可。混合两类内容的文档再分发时，保留各自适用声明。

## Domain-Driven Design Reference

Eric Evans，Domain Language, Inc.，Domain-Driven Design Reference, Definitions and Pattern Summaries，版本 2015-03。© 2015 Eric Evans。

- [原始 PDF](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf)。
- [知识共享署名 4.0 国际许可](https://creativecommons.org/licenses/by/4.0/)。
- [法律文本](https://creativecommons.org/licenses/by/4.0/legalcode.en)，包括第 5 节适用的保证免责声明及责任限制。

本包对定义及模式说明进行了摘要、重组和英中适配，并提供构造例子。将面向对象表达推广到函数式模型，按实际机制限定一致性、声明式保证和事件说明。改编中加入原创案例和补充解释。署名用于标识材料来源。原作者背书需要另行许可。

入口 [SKILL.md](./SKILL.md) 及下列参考中的改编定义和模式说明保留 CC BY 4.0：

- [discovery/knowledge.md](./discovery/knowledge.md)：共同建模、参与实现的建模者及实现反馈学习。
- [discovery/language.md](./discovery/language.md)：共同语言及模型持续整合。
- [strategic/subdomains.md](./strategic/subdomains.md)：核心域、通用子域、愿景、标明核心、内聚机制、核心分离及抽象核心。
- [strategic/bounded-contexts.md](./strategic/bounded-contexts.md)：限界上下文及一致的模型使用。
- [strategic/context-mapping.md](./strategic/context-mapping.md)：上下文图及九种关系模式。
- [strategic/large-scale-structure.md](./strategic/large-scale-structure.md)：演进秩序、系统隐喻、责任层、知识层及可插拔组件框架。
- [tactical/identity.md](./tactical/identity.md)：实体及值对象。
- [tactical/aggregates.md](./tactical/aggregates.md)：聚合根、不变量及受控变更边界。
- [tactical/behavior.md](./tactical/behavior.md)：领域服务及明确的操作契约。
- [tactical/lifecycle.md](./tactical/lifecycle.md)：工厂及仓储。
- [tactical/events.md](./tactical/events.md)：领域事件及系统消息区分。
- [modeling/implementation.md](./modeling/implementation.md)：模型驱动设计、领域责任分离、模块及八种柔性设计方法。
- [modeling/evolution.md](./modeling/evolution.md)：朝更深认识重构及模型实现反馈。
- [modeling/validation.md](./modeling/validation.md)：可观察规则断言及一致的模型表达。

CC BY 4.0 内容按现状及可得状态提供，适用法律文本第 5 节的保证免责声明及责任限制。分享这些内容或后续改编时，保留署名、来源及许可链接和改动说明。原创贡献在可独立享有版权的范围内采用 LICENSE 中的 MIT 授权，该授权允许接收者继续遵守改编材料的 CC BY 4.0。

## MIT 来源

Matt Pocock 的 [domain-modeling](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/domain-modeling) 及其词汇表、决定记录指导，提供主动术语探索、边界案例讨论、代码对照及相称记录方法。改编进入入口、发现参考及模型演进。固定目录布局和模板替换为按项目惯例记录。Copyright (c) 2026 Matt Pocock。MIT License。

Lauren Tan 在 pstack 中的 [principle-model-the-domain](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/principle-model-the-domain/SKILL.md) 提供显式状态表达及围绕领域知识组织的方法。改编进入 modeling/implementation.md，保证范围按实际机制限定。Copyright (c) 2026 Lauren Tan。MIT License。

原创材料及 MIT 许可增补贡献：Copyright (c) 2026 Ruokee。MIT 完整条款及三方版权声明见 [LICENSE](./LICENSE)。

## 概念依据

Eric Evans 和 Martin Fowler 的 [Specifications](https://martinfowler.com/apsupp/spec.pdf) 支持 tactical/behavior.md 中筛选、校验、按要求构造及实现选择的说明。本包采用自己的解释和例子。论文代码及图示保留在原来源。

Alberto Brandolini 的 [EventStorming](https://www.eventstorming.com/) 支持 discovery/knowledge.md 中的可选协作探索方法。本包提供原创简要介绍。官方插图、课程和工作坊材料保留在原来源。
