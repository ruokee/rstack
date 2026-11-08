# 结构质量

代码坏味道是值得调查的症状。结构问题需要说明哪些知识、职责或依赖造成了实际成本。建议改变形状前，核对当前用法及已确认的变化。

## 长函数

检查混合抽象层次、无关的变化原因、反复解释状态及遮蔽契约的控制流。提取有价值的边界需要表达一个完整操作，拥有清楚的输入、结果及责任。

线性流程、数据表、平铺分派及必要测试准备可以较长而清晰。行数本身不足以支持拆分。让调用方重新拼装原流程的提取可能增加阅读成本。

## 重复规则

确认多个位置是否表达由同一权威维护、需要共同变化的规则。不同产品的独立策略可能暂时相同。派生表示或独立版本的契约可能更适合生成或一致性检查。

同一规则复制到多个调用方时，指出实际不一致或同步修改成本。比较共同维护者、生成数据、明确契约检查及共享带来的依赖。金额和协议规则值得仔细核对一致性。类别及出现次数本身不足以决定抽象方式。完整设计依据见 [DRY](../code-design/design-principles/dry.md) 或[三次法则](../code-design/design-principles/rule-of-three.md)。

## 原始类型

字符串、数字或映射在调用方反复解释单位、区分身份、约束组合或重建合法状态时可能形成问题。包装的价值取决于正常构造及修改路径是否真正保持其含义。

核对语言机制。Python `NewType` 提供静态用途区分，`TypedDict` 描述静态映射形状。二者均不校验任意运行时输入。冻结的 dataclass 限制正常字段赋值。嵌套可变数据及未经检查的构造仍有各自义务。Rust 字段私有性可以将构造限制在模块中，模块内构造及修改仍需实施规则。运行时校验由项目输入契约决定。

表示及不变量归属见[数据建模](../code-design/approaches/data-modeling.md)、[面向对象](../code-design/approaches/object-oriented.md)或[状态机](../code-design/approaches/state-machine.md)。

## 外部数据依赖

依恋情结表现为行为依赖其他所有者的内部结构，或重复其决策。字段访问次数只是线索。公开记录、报表、映射及纯计算可以合理地消费数据。

比较移动行为前后的依赖及调用方知识。移动可能把字段访问换成回调、依赖环或更大的接口。封装及职责依据见[迪米特法则](../code-design/design-principles/law-of-demeter.md)、[告诉而非询问](../code-design/design-principles/tell-dont-ask.md)或 [GRASP](../code-design/design-principles/grasp.md)。

## 变化扩散

霰弹式修改表现为同一概念的变化散落在多个所有者中，造成漏改风险。发散式变化表现为一个模块承担独立的变化原因，造成无关编辑及干扰。建议拆分或合并前先确认概念及其维护者。

协议适配、独立部署的消费者及不同存储格式可能需要多处协调变化。说明哪些知识适合共同维护，哪些变化是场景固有的。职责及依赖方向见 [SOLID](../code-design/design-principles/solid.md)、[GRASP](../code-design/design-principles/grasp.md) 或[依赖反转](../code-design/design-principles/dependency-inversion.md)。

## 薄包装

审查包装的单位、错误或表示转换责任时，先读取[适配器](../code-design/design-patterns/adapter.md)。在 OMP 中使用 `skill://code-design/design-patterns/adapter.md`。审查协调子系统操作的接口时，先读取[外观](../code-design/design-patterns/facade.md)。

包装可以承担有用的命名、转换、稳定契约、生命周期、替换边界或横切行为。单个实现同样可以承担这些责任。

怀疑包装只是中间人时，比较删除后每个调用方需要掌握的知识。包装增加导航及传播成本，又缺少独立责任时，可以形成间接层问题。建议移除前核对错误映射、单位、所有权及兼容性的变化。

## 多余机制

注册表、配置、参数和层次需要当前责任或已确认的变化依据。解释追踪、扩展或调用的具体成本。简单性及信息隐藏见 [KISS](../code-design/design-principles/kiss.md)、[YAGNI](../code-design/design-principles/yagni.md) 或[深模块](../code-design/design-principles/deep-modules.md)。

死代码判断需要入口、注册、反射及动态引用证据。注释与行为矛盾，或用于补偿可避免的结构时，可能形成维护问题。公开替代接口及必要格式重复需要核对真实消费者义务。

## 修复方向

选择能消除已确认成本的最小改动，说明保持的行为及受影响调用方。变换风险见[重构风险](./refactoring.md)，完整替代结构使用设计方法。审查产物依照当前任务权限提供发现及建议。
