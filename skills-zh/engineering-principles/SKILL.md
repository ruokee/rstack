---
name: engineering-principles
description: 设计、实现、修改或审查代码、文档及配置等工程产物时使用。
metadata:
  version: "1.0.0"
---

# 工程原则

按当前问题选择并读取相关原则，结合实际约束应用。

- [开闭原则](../code-design/design-principles/solid.md#开闭原则)：隔离变化，保护稳定契约。
- [不要重复自己（DRY）](../code-design/design-principles/dry.md)：集中维护已确认的共同知识。
- [单一职责](../code-design/design-principles/solid.md#单一职责)：按变化原因组织职责。
- [隐藏细节](../code-design/design-principles/deep-modules.md)：将实现细节留在边界内。
- [依赖倒置](../code-design/design-principles/dependency-inversion.md)：由使用需求定义契约。
- [里氏替换](../code-design/design-principles/solid.md#里氏替换)：替代实现遵守行为契约。
- [接口隔离](../code-design/design-principles/solid.md#接口隔离)：按使用方需要提供能力。
- [迪米特法则](../code-design/design-principles/law-of-demeter.md)：减少对其他对象内部结构的了解。
- [组合优于继承](../code-design/design-principles/composition-over-inheritance.md)：区分实现复用与行为替代。
- [Rule of Three](../code-design/design-principles/rule-of-three.md)：根据重复和变化判断抽象时机。
- [GRASP](../code-design/design-principles/grasp.md)：为行为选择合适的承担者。
- [深模块](../code-design/design-principles/deep-modules.md)：以清楚的接口承载有用能力。
- [KISS](../code-design/design-principles/kiss.md)：选择整体复杂度较低的方案。
- [YAGNI](../code-design/design-principles/yagni.md)：让新增能力有实际需求依据。
- [保持懒惰](./references/keep-laziness.md)：用最小必要改动解决问题。
- [先减后加](./references/subtract-before-add.md)：先检查删除或简化能否解决问题。
- [降低理解负担](./references/minimize-reader-load.md)：减少阅读时要追踪的层次和状态。
- [渐进式披露](../writing-for-agents/SKILL.md#信息层级)：先呈现必要信息，细节按需展开。
- [先做基础决策](./references/foundational-decisions.md)：先明确数据结构、依赖顺序及共享状态。
- [从第一性原理重新设计](./references/redesign-from-first-principles.md)：从完整需求重新判断结构。
- [领域建模](../ddd/modeling/implementation.md)：用结构承载概念和规则。
- [类型系统纪律](./references/type-system-discipline.md)：用类型和构造过程表达约束。
- [边界纪律](./references/boundary-discipline.md)：在系统边界建立输入契约。
- [明确所有权](../code-design/approaches/resource-lifecycle.md)：明确状态和资源由谁管理。
- [共享前先隔离](./references/isolate-before-sharing.md)：先消除共享，再处理必要的串行。
- [幂等性](./references/idempotency.md)：让重复执行及恢复收敛到预期结果。
- [结果导向执行](./references/outcome-oriented-execution.md)：让重写和迁移服务于目标架构。
- [先迁移再清理](./references/migrate-then-clean-up.md)：完成调用方迁移并清理旧路径。
- [体验优先](./references/experience-first.md)：从使用体验判断实现取舍。
- [穷尽设计空间](./references/exhaust-the-design-space.md)：并排比较实质不同的方案。
- [先造工具](./references/build-the-tool-first.md)：让工作或检查可以重跑。
- [质疑前提](./references/attack-the-premise.md)：连续修复失败时重新核对假设。
- [修复根因](./references/fix-root-causes.md)：沿问题机制处理原因。
- [证明有效](./references/prove-it-works.md)：让完成判断有对应证据。
- [验证后再推进](./references/verify-before-advancing.md)：将工作拆成可独立检查的单元，每个单元验证通过后再继续。
- [测试行为而非实现](../code-quality/testing/behavior.md)：以消费者可观察的结果约束行为。
- [保护上下文](./references/protect-context.md)：把批量材料处理与主要判断分开。
- [保持工作推进](./references/keep-work-moving.md)：识别可以继续的工作和必要确认点。
- [把教训落实到结构](./references/encode-lessons-in-structure.md)：让已确认的规则由机制承载。
