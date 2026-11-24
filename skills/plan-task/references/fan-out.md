# Mark optional parallel work

When a plan already has units that different people could take, decide which ones can be marked `fan-out`. Once their prerequisites hold, each can start and deliver its own result. The user can also do them one at a time. Both schedules have the same deliverables, dependencies, and acceptance criteria.

## Check independence

Give each unit to a different person. Suppose the others send nothing until delivery. **Can each person finish and check their work with the inputs already available? Would changing the order of completion change anyone's result?** Look at:

- Inputs and decisions. Each person knows the version, interface meaning, and acceptance criteria they need. Several people can read the same fixed material. If B needs A to define a field or supply a sample, put that result on B as a prerequisite. Reconsider the remaining work once it is available.
- Writes and resources. Trace what each unit modifies, including generated files, data, and environments used during checks. Work in separate directories may still rewrite one index or clear a shared test database. Give a shared change one owner. If an exclusive device must be shared, identify which work can overlap and which check has to take turns.
- Handoffs. Each person knows what to deliver and how to check it. The recipient knows where to compare, integrate, or accept the combined result. Put the join at the step that consumes both outputs. Work that needs only A can proceed when A is ready.

If a common prerequisite is outstanding, name the point after which parallel work becomes possible. If people would have to make the same decision as they go, keep the dependency or combine that work. Split only where the boundary is useful.

## Mark the plan

Keep the plan's unit names or identifiers. Beside the relevant units, add one `fan-out (optional)` line naming the members, when they can start, and who takes their results. Refer back to the inputs, write boundaries, and checks already given. Omit the annotation if no group qualifies.

For example, two order formats already have a published contract and examples for each format:

> **fan-out (optional): The CSV and JSON parsers can start now, together or one at a time. The import command takes both.**
>
> Each parser has its own module and test data. Check its orders and errors against its format's examples. One person registers both formats, imports equivalent examples through the command, and reads back the expected orders.

If one CSV field has no defined meaning, identify the CSV work that needs the answer. JSON can still start and finish against its existing contract. If both parsers must rewrite the same generated file to check their results, give that write to one owner or serialize just the conflicting checks. Keep the other work available.

## Use the annotation

The executor chooses a schedule according to the current prerequisites, resources, and the user's preference. In parallel, give each participant the context for their unit and deliver its result to the named recipient. In sequence, keep the dependencies and final check. When a shared agreement changes, withdraw or narrow the affected annotation and retain the results that still apply. Marking a plan does not dispatch work.
