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

For example, a plan to import orders might read:

> A. Settle the order fields, error meanings, and examples for both formats.
>
> **fan-out (optional): Once A is settled, do B and C in parallel or one at a time. D takes both parsers and connects them to the import command.**
>
> B. Implement the CSV parser in its own module and format-specific cases. Check orders and errors against A's examples.
>
> C. Implement the JSON parser in its own module and format-specific cases. Check the same contract with separate mutable test data.
>
> D. Register both formats in one place. Import equivalent examples through the command and read back the same stored order.

B and C can each finish against a fixed A. D alone writes the registry. If both parsers have to rewrite one generated file to run their checks, the annotation no longer holds. Move generation and its check into one unit, or serialize the conflict, then reconsider the remaining overlap.

## Use the annotation

The executor chooses a schedule according to the current prerequisites, resources, and the user's preference. In parallel, give each participant the context for their unit and deliver its result to the named recipient. In sequence, keep the dependencies and final check. When a shared agreement changes, withdraw or narrow the affected annotation and retain the results that still apply. Marking a plan does not dispatch work.
