# Decisions

Choose a structure by the outcome it must deliver and the costs the owner can accept. Functional meaning shapes authority and failure handling as well as the visible features. Quality attributes describe how well the system must operate under stated conditions.

## Make goals observable

Turn words such as reliable, fast, and maintainable into scenarios. State the condition, actor or event, affected part, expected response, and the measure that distinguishes acceptable results. Use values grounded in the current goal.

Constructed example: when a part is missing after a repair has been accepted, the case remains visible to its owner and the customer receives an updated commitment within the agreed response window. A software counterpart might require a completed refund to remain discoverable after the caller restarts. Both require a mechanism and an observable outcome.

Separate hard constraints, optimization goals, and preferences. A statutory obligation, a fixed interface, and a budget limit can exclude candidates. A desired shorter wait or lower operating cost can rank candidates. Confirm conflicts between goals with the person authorized to decide.

## Compare viable choices

Include the present arrangement when it can meet the goal. Compare options that change responsibility, resource use, interactions, or lifecycle cost. A single established mechanism for a local problem can be stated directly.

Use the same normal, load, failure, recovery, and transition scenarios for each relevant candidate. Trace each promised benefit to its mechanism. Count learning, adoption, integration, staffing, routine operation, failure response, migration, and exit costs. Record who will actually do that work.

For sourcing, compare in-house capability and time with the supplier's contract, capacity, dependencies, lifecycle, and replacement path. Differentiation can justify retaining control. It still needs people and resources. Buying can shorten adoption while adding contractual and exit obligations.

Cost estimates include workload, units, period, fixed and variable costs, and uncertainty. Component count, team size, or a generic traffic threshold is a clue to investigate. The current requirement and mechanism decide.

## Record the choice

Use the project's existing format and location. Preserve context, chosen option, material alternatives, reasons, accepted consequences, and a condition for revisiting. Explain enough for a later reader to understand why a rejected option might become useful.

A deliberate compromise has a concrete future cost and a trigger, such as replacing a manual reconciliation step when its workload exceeds the available staff time. A vague "technical debt" label gives the next person little basis to act. Revisit when requirements, costs, dependencies, lifecycle, or measured operation change the decision's premises.

## Check the guarantee

For each important promise, ask what prevents its violation. Authority can come from a named role and an accepted handoff. A database constraint can protect uniqueness. A recovery procedure depends on current records, resources, and a capable operator.

Convert confirmed, mechanically observable constraints into checks where useful. State their workload and scope. A passing dependency check establishes the checked dependency rule. Performance evidence needs the stated load and environment. Open-ended judgment needs the appropriate evidence rather than an arbitrary exact output.

Evaluate a proposal against its actual contract and strongest counterevidence. Give a concrete violating scenario before reporting a defect. Retain a zero-finding result when the proposed mechanism meets the confirmed conditions. New experiments and implementation follow the current task's scope and permissions.
