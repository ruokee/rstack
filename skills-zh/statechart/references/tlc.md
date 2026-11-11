# 运行 TLC

采用 TLA+/TLC 时读取。运行或修改示例前，还需完整读取 [AsyncSave.tla](../examples/AsyncSave.tla)、[safe.cfg](../examples/safe.cfg)、[buggy.cfg](../examples/buggy.cfg) 和 [unfair.cfg](../examples/unfair.cfg)。公平性及死锁语义见[性质](./properties.md)。

## 准备运行

示例基线为 TLA+ Tools [v1.7.4](https://github.com/tlaplus/tlaplus/releases/tag/v1.7.4)，使用其 `tla2tools.jar`。采用与该发布兼容的已安装 Java 运行时，记录 `java -version`。实际运行工具确认其兼容性。

以下命令使用 Bash。将两个绝对路径替换为实际安装包目录及新的获准结果目录。`SKILL_DIR` 包含 `SKILL.md` 和 `examples/`。`RUN_DIR` 保存本次复制的示例、工具、日志及元数据。每次运行选择新的结果目录。

```bash
export SKILL_DIR='/absolute/path/to/statechart'
export RUN_DIR='/absolute/path/to/authorized-new-run'
mkdir -p "$RUN_DIR"
cp -R "$SKILL_DIR/examples" "$RUN_DIR/examples"
```

已有 `v1.7.4` JAR 时，将 `TLA2TOOLS_JAR` 设为其实际绝对路径。需要下载且已获许可时，将固定发布放入结果目录：

```bash
mkdir -p "$RUN_DIR/tools"
curl --fail --location --max-time 120 \
  --output "$RUN_DIR/tools/tla2tools.jar" \
  https://github.com/tlaplus/tlaplus/releases/download/v1.7.4/tla2tools.jar
export TLA2TOOLS_JAR="$RUN_DIR/tools/tla2tools.jar"
```

在复制后的示例目录执行。保存 Java 版本；每份完整 TLC 日志也记录 TLC 版本。JAR 来源保存在运行记录中。

```bash
cd "$RUN_DIR/examples"
java -version 2>&1 | tee "$RUN_DIR/java-version.txt"
set -o pipefail
```

缺少 Java、下载失败或 JAR 装载错误会阻碍依赖它的检查。保留实际错误及所需能力，继续可完成的模型和规则分析。

## 理解模型

这是一个构造的异步编辑器。版本 0 初始已确认并显示已保存。`MaxVersion = 2` 限制编辑范围。同时最多一个在途请求，每个确认对应该请求。协议允许等待期间继续编辑。模型采用可靠投递和非确定性延迟，公平性约束最终执行。丢失、多个在途请求、远端冲突及实际时限在本示例范围之外。

变量包括：

- `current`，最新本地版本。
- `acknowledged`，最后确认的请求版本。
- `inflight`，已提交版本，或 `NoRequest = -1`。
- `saved`，显示的已保存声明。

`vars` 是四个变量组成的元组。`Init` 设置初始值。每个具名动作都有守卫、加撇的后态赋值，以及对保留值的 `UNCHANGED`。

`Edit` 增加版本并标记待保存。内容待保存时，`Submit` 填入空请求槽。`Ack` 确认在途版本并清空请求槽。`BuggyAck = FALSE` 时，只有该版本等于当前版本才显示已保存。`BuggyAck = TRUE` 时，每次确认都显示已保存。其他规则相同。

`Quiescent` 只在版本相等且没有在途请求时保持状态。尚未到达有限边界时仍可再次编辑。该动作表达合法静止，死锁检查保持开启。

`Next` 是具名动作的析取。`UnfairSpec` 为 `Init /\ [][Next]_vars`，允许 Next 步及停顿。`Spec` 增加 `WF_vars(Submit)` 和 `WF_vars(Ack)`。有限编辑及这些弱公平假设允许待保存内容追上当前版本，如实显示已保存。

`TypeOK` 约束取值域。`SavedTruth` 是状态不变量。`PendingEventuallySaved` 是 leads-to 时序性质。配置的 `INVARIANT` 检查状态谓词，`PROPERTY` 检查时序公式。`SPECIFICATION` 选择公平或非公平规范。`CONSTANTS` 固定有限编辑边界及确认变体。

## 检查正确变体

在 Bash 中关闭 errexit，逐段运行各项检查，后两份配置会按预期发现违反。Java 管道紧接着的 `PIPESTATUS` 行保存 TLC 实际退出码。`tee` 成功仅表示日志写入完成。

```bash
java -cp "$TLA2TOOLS_JAR" tlc2.TLC -workers 1 \
  -config safe.cfg -metadir "$RUN_DIR/safe-states" AsyncSave.tla \
  2>&1 | tee "$RUN_DIR/safe.out"
printf 'TLC exit=%s\n' "${PIPESTATUS[0]}" | tee "$RUN_DIR/safe.exit"
```

`safe.cfg` 选择公平的 `Spec`、`MaxVersion = 2` 和正确确认，检查 `TypeOK`、`SavedTruth` 及 `PendingEventuallySaved`。预期完成有限搜索，满足上述检查。保留本次实际状态统计、完成消息及退出状态。

## 查找旧确认

```bash
java -cp "$TLA2TOOLS_JAR" tlc2.TLC -workers 1 \
  -config buggy.cfg -metadir "$RUN_DIR/buggy-states" AsyncSave.tla \
  2>&1 | tee "$RUN_DIR/buggy.out"
printf 'TLC exit=%s\n' "${PIPESTATUS[0]}" | tee "$RUN_DIR/buggy.exit"
```

`buggy.cfg` 保留相同公平规范、编辑边界和性质列表，选择 `BuggyAck = TRUE`。预期出现 `SavedTruth` 违反。按检查器实际轨迹解释，保留编号及动作位置。决定性顺序为编辑到 1、提交 1、编辑到 2、确认 1。到达状态中，`current = 2`、`acknowledged = 1`、`inflight = -1`、`saved = TRUE`。

这次提前发生的不变量失败使尚未完成检查的性质保持未判定。记录它们的实际状态。共同配置的 `PROPERTY` 声明表示要求检查，完成情况采用实际结果。

## 查找公平性缺口

```bash
java -cp "$TLA2TOOLS_JAR" tlc2.TLC -workers 1 \
  -config unfair.cfg -metadir "$RUN_DIR/unfair-states" AsyncSave.tla \
  2>&1 | tee "$RUN_DIR/unfair.out"
printf 'TLC exit=%s\n' "${PIPESTATUS[0]}" | tee "$RUN_DIR/unfair.exit"
```

`unfair.cfg` 使用与 `safe.cfg` 相同的正确确认、编辑边界、不变量和进展性质。它选择 `UnfairSpec`，移除提交及确认公平性。预期出现时序性质违反，留有待保存内容，并无限延续而未取得所需确认。TLC 可能用停顿或重复循环表达该延续。保留实际前缀、后缀及版本值。

可执行动作说明公平性缺口：工作可以持续具备执行条件，却一直没有得到调度。用同一性质比较公平运行。死锁属于另一类结果，关注可执行的下一状态关系。

## 解释证据

保持死锁检查开启。`-deadlock` 选项会关闭该检查，本教程省略它。每份配置使用独立 `-metadir`，原包保留为来源，生成文件归本次运行目录。

保留模型及配置副本、Java 和 TLC 版本、发布来源、命令、完整输出、退出状态、有限常量、配置性质、搜索方式及实际状态统计。分别记录搜索完成、性质违反、死锁、中断和配置错误。提前停止时先按输出确定能够支持的结论，再安排另行记录的补充检查。

本示例使用单 worker 的显式状态检查，没有新增状态约束、动作约束、对称缩减或图投影。修改这些设置时保留它们对覆盖的影响。解释方法见[检查](./checking.md)。

通过[读者视图](./views.md)呈现实际反例顺序及首次违反。涉及实现判断时，另行按授权完成[映射及回放](./implementation.md)。这三次示例运行检验模型层。

完成标准：选定运行有绑定具体输入及范围的结果，读者能从复制的示例及保存的命令重新运行。
