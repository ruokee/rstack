---
name: planning
description: 需要把一个想法定成具体任务、为已选方案安排实施步骤，或修订已有任务约定时使用。用户要先做计划、稍后执行，或把约定和验收方法留给下一次会话时，也使用此入口。
metadata:
  version: "1.0.3"
---

# 规划任务

作为 Planner，交出一份 Spec，写明 Builder 据以实施、Evaluator 据以验收的任务约定。从用户请求和已有 Spec 入手。「按这份定稿实现」直接进入 Execute。用户只想弄懂一个概念时，使用 [teach](../teach/SKILL.md)。

## 明确预期结果

从用户遇到的具体场景入手，弄清希望看到什么变化、哪些现有行为仍然有用。项目事实由你查证。方案已定时，核对它在现有约束下能否达到目标，把已定事项写进 Spec。从故障入手时，区分实际结果、期望结果和应当保留的行为。

预期结果已明确时，直接起草。还有会改变结果的取舍时，读取 [thinking-method](../thinking-method/SKILL.md)，用它的 [discuss 分支](../thinking-method/references/discuss.md)访谈。先问用户想要什么结果，再决定怎样实现。例如，用户嫌列表太杂，就拿其中一条记录问：只从默认视图隐藏，以后还可以在别处找到，还是要把这条记录彻底移除？待定取舍留在讨论中，由用户选定后再写入约定。

只为尚待解决的问题选择方法：

- 缺外部事实时读 [research](../research/SKILL.md)；故障原因不明时读 [diagnose](../diagnose/SKILL.md)。
- 厘清领域含义读 [domain-driven-design](../domain-driven-design/SKILL.md)，确定系统边界读 [system-architecture](../system-architecture/SKILL.md)，设计代码结构读 [code-design](../code-design/SKILL.md)，确定类型约束读 [type-driven-design](../type-driven-design/SKILL.md)。
- 需要观察实际效果才能选定方案时，读 [prototype](../prototype/SKILL.md)。

## 起草 Spec

起草 Spec 前，先读取本包的 [Spec 模板](./spec_template.md)，在任务已有的规划文档或项目约定的位置填写。语言、章节、顺序、字段和可选内容的省略条件以模板为准。起草或修订时，将 `Status` 设为 `Draft`。

读取 [plan-task](../plan-task/SKILL.md) 编排 `Implementation Plan`。单一改动用一个具名单元即可。写明 Builder 从哪里开始、交付什么结果、由谁接手，并引用 `User Journeys` 中对应的具名旅程 `UJ` 或 `Verification` 中的具体验证项。修订计划时沿用已有单元标识。

## 交接前自检

在当前会话把草稿与模板、原始请求和已确认的决定对照。Builder 能否从一个具名单元开始实施？Evaluator 能否沿着单元的引用找到一项观察，区分正确结果和看似合格的错误结果？例如，误删归档笔记也会让默认视图看起来正确。用一条普通笔记和一条归档笔记核对：默认只看到前者，在归档中仍能打开后者。发现遗漏或矛盾就修订，再查受影响的部分。

约定明确且交接自检通过后，将 `Status` 设为 `Ready` 并保存。用户要求稍后实施，延后的是 Builder 的工作。Planner 在本次会话完成 Spec，核对已保存的状态，给出文件位置和 Builder 可以着手的单元。本次停在 Plan，实施依用户授权进行。

## 修订约定

Execute 和 Verify 期间保持 Spec 定稿。实现偏离约定时，Evaluator 将差异和判定写入验证记录，Builder 修复实现，将进度及修复写入执行记录。

任务约定本身变化时，回到 Plan。更新同一份 Spec 的正文，追加变更时间、原约定或原状态，以及变更原因。保留既有条目，使早先的判定仍可对照当时的约定。自检修订后的 Spec，后续候选按新约定验收。
