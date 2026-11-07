---
name: code-design
description: 设计新代码或改进既有代码结构时使用。
disable-model-invocation: true
metadata:
  version: "1.0.0"
---

# 代码设计

选择足以清楚表达所需行为、持续维护规则的最小结构。从实际用法、状态、依赖和成本出发。函数、类型、模块或包都可以是合适的设计单位。

## 明确问题

读取需求、相关调用方、实现及已有决定。说明要支持的操作、调整结构的原因，以及需要保留的行为。区分已确认约束和对未来用法的假设。

沿一个代表性操作，从输入追踪到结果，定位决策、状态变化、外部效果及资源获取。新代码需要包含接入点。处理既有变化热点或调用方迁移时，读取[既有代码](./existing-code.md)。

设计问题应指出具体困难，例如多个调用方分别解释同一规则、资源归属不清楚，或状态表示容纳了非法组合。小范围变化沿用合适的现有结构时，只需说明局部设计决定。

## 描述用法

写出调用方怎样完成操作，包含相关失败和边界情况，再从用法推导签名。需要定义输入、错误、顺序、归属或调用方所需知识时，读取[接口](./interfaces.md)。

列出各项不变量及建立、维护它们的操作。说明谁拥有可变状态、谁可以修改，以及谁获取和释放资源。按操作需要说明部分完成、取消、并发及可观察成本。

调用方能判断成功的含义、失败后留下的状态，以及各方承担的义务后，继续推导结构。

## 选择表示

先选择数据形状和操作，再安排文件。使用目标语言的直接机制：记录表达独立值，变体表达不同情况，函数表达转换，对象或模块提供受控的状态操作。间接层应承载实际决策、转换、生命周期或变化。

解释每项保证怎样实现。类型可以约束形状和允许的操作。构造及修改路径建立值的不变量。共享存储或同步机制需要处理竞争写入。命名和文档建立由调用方遵守的约定。

尝试通过公开构造、修改、过期观察或副作用之间的失败破坏不变量。修正表示，或将保证限定为机制实际支持的范围。分配、复制、I/O、缓冲、分发及任务数量影响要求时，将它们纳入设计。

## 比较剩余取舍

存在影响结果的选择时再比较方案。有效候选改变责任或行为，例如借用写入器与拥有输出会话、封闭变体与可扩展接口、原子操作与分步操作。保留现有结构可行时也纳入比较。

用相同调用场景比较各方案，检查所需知识、不变量维护、修改范围、失败处理、资源成本及验证。选择一个方案，说明接受的代价。补齐会改变选择的事实或优先级。

## 形成可用设计

用重要场景检查拟议类型和操作，核对签名、示例及说明是否表达同一契约。提供实施及判断当前改动所需的信息：

- 所选结构及决定它的约束。
- 调用用法、合法状态、不变量维护，以及效果和资源的归属。
- 失败后果及调用方之后可以采取的有效操作。
- 受影响的调用方及既有代码迁移顺序。
- 验证所承诺行为和成本的可观察检查。

未决事项放在受阻操作旁边，说明解决它所需的信息。设计详细程度应匹配变化范围和风险。

## 重审失效假设

重复类型逃逸、额外标志、调用方规则副本或竞争写入，都是检查模型的线索。将重复困难追溯到需求遗漏、实现错误或结构假设。孤立的边界情况按已有契约处理。

结构造成困难时，用已观察的情况修订调用用法和状态归属，再将新契约贯彻到表示、调用方、迁移及检查中。

## 按问题读取

### 原则

- 同一规则或表示的副本：[DRY](./design-principles/dry.md)。
- 提取共同抽象的证据：[Rule of Three](./design-principles/rule-of-three.md)。
- 使用或实现的复杂度：[KISS](./design-principles/kiss.md)。
- 为未确认需求预留的灵活性：[YAGNI](./design-principles/yagni.md)。
- 职责、替换、能力或依赖方向：[SOLID](./design-principles/solid.md)。
- 为行为安排归属：[GRASP](./design-principles/grasp.md)。
- 调用方沿另一模块的内部结构取值：[迪米特法则](./design-principles/law-of-demeter.md)。
- 调用方根据另一所有者的可变状态作决定：[Tell Don't Ask](./design-principles/tell-dont-ask.md)。
- 复用实现或提供可替换行为：[组合优于继承](./design-principles/composition-over-inheritance.md)。
- 策略层契约、注入及组装：[依赖倒置](./design-principles/dependency-inversion.md)。
- 有用能力相对于调用方所需知识的比例：[深模块](./design-principles/deep-modules.md)。

### 模式

- 选择产品的构造方式：[工厂](./design-patterns/factory.md)。
- 选择相容的成套产品：[抽象工厂](./design-patterns/abstract-factory.md)。
- 积累选项后完成合法构造：[构建器](./design-patterns/builder.md)。
- 稳定操作中可变化的决策：[策略](./design-patterns/strategy.md)。
- 订阅身份及通知语义：[观察者](./design-patterns/observer.md)。
- 转换表示及错误契约：[适配器](./design-patterns/adapter.md)。
- 围绕既有接口组合行为：[装饰器](./design-patterns/decorator.md)。
- 协调子系统的一项完整用法：[外观](./design-patterns/facade.md)。
- 分别表达请求和执行：[命令](./design-patterns/command.md)。
- 按当前状态组织行为：[状态](./design-patterns/state.md)。
- 跨已知节点种类增加操作：[访问者](./design-patterns/visitor.md)。
- 面向领域的查询及持久化操作：[仓储](./design-patterns/repository.md)。
- 协调跟踪的变更及事务完成：[工作单元](./design-patterns/unit-of-work.md)。

### 结构方法

- 显式执行顺序及局部修改：[命令式](./approaches/imperative.md)。
- 由求值器解释的声明规则：[声明式](./approaches/declarative.md)。
- 带受控操作的身份及状态：[面向对象](./approaches/object-oriented.md)。
- 单独计算决策，再执行效果：[函数式核心](./approaches/functional-core.md)。
- 合法数据形状、值的不变量及物理布局：[数据建模](./approaches/data-modeling.md)。
- 事实、通知及投递保证：[事件驱动](./approaches/event-driven.md)。
- 状态、守卫及允许的转移：[状态机](./approaches/state-machine.md)。
- 借用、转移、完成及释放：[资源生命周期](./approaches/resource-lifecycle.md)。
- 调度、取消及有界保留的工作：[异步并发](./approaches/async-concurrency.md)。
