# Dynamics

Use this reference when flow, waiting, capacity, rework, or delayed decisions determine the system's result.

## Account for work

A stock is a quantity held inside a boundary at a time, such as open repairs, stored parts, or outstanding obligations. A flow changes that stock over time. Use compatible units and one boundary:

`ending stock = starting stock + arrivals - completions - other exits`

Count a completion at the point that delivers the intended result. An intake, a transfer, and a completed repair measure different things. Rework consumes capacity again. Record its return stage and distinguish repeated processing from distinct completed jobs. If abandonment reduces the queue, report it separately from successful completion.

Measure demand by class and time window. Average arrivals can hide bursts, seasonal changes, or jobs with very different effort. A physical inventory can be plentiful while the required part is unavailable. A nominally free worker can lack the skill needed for the waiting jobs.

## Find the limiting resource

For a serial path in which every job visits every stage once, sustainable throughput is bounded by its slowest effective stage. Effective capacity includes availability, setup, skill, materials, and shared equipment. Parallel capacity adds only where work can actually move between resources. A shared inspection bench can constrain several otherwise independent crews.

Constructed repair example: arrivals are 10 jobs per hour. Intake and diagnosis can handle 12, repair can complete 8, and acceptance can pass 12. Every job follows this path. During a four-hour window, repair always has work, and there is no rework or other exit. Effective output is 8 per hour, so backlog grows by `(10 - 8) × 4 = 8 jobs`. More intake capacity leaves this output unchanged.

To choose a change, check whether repair roles can substitute for one another, whether they wait for the same equipment, and whether parts are ready. Extra staff help when they increase effective capacity at the constraint. Scheduling ready jobs can help a parts-blocked queue, with an explicit consequence for the age of deferred jobs. Reducing accepted demand changes the service promise and needs that choice acknowledged.

A buffer absorbs a temporary mismatch. Sustained arrivals above effective output make its stock keep growing. State where the waiting occurs, who owns it, the available space, and what happens when it fills. Moving the queue to customers changes visibility and obligations.

## Reason about waiting

Little's law relates long-run averages under a consistent boundary with stable flow:

`average work in system = average throughput × average time in system`

Use jobs, jobs per hour, and hours, or another consistent set of units. In a separate stable window, an average of 24 open repairs with throughput of 8 per hour gives `24 / 8 = 3 hours` average time inside the boundary. Include both waiting and processing when both are inside that boundary. A single job's promise or a tail-wait target needs distribution evidence.

Use net inflow for a continuously growing backlog. Its changing stock is outside the stable-window calculation above. Look at age as well as count: priority rules can keep aggregate throughput healthy while starving one class. Batching can reduce setup cost and increase effective capacity, while making jobs wait for the next batch. Report that tradeoff in end-to-end time.

Variability in arrivals, task effort, and availability creates queues even when average demand fits average capacity. As utilization approaches capacity, less spare time remains to absorb variation. Reserve capacity follows the required waiting outcome and observed variation. A universal utilization target would hide these differences.

## Trace feedback

A feedback loop contains an observed quantity, a decision rule, an actor, an action, and a delay before the changed state is observed. Name each part.

- A balancing loop counters change. A scheduler stops accepting appointments as the ready-work queue approaches its agreed limit. The cost is delayed access or rejected demand.
- A reinforcing loop amplifies change. Backlog causes rushed repairs, rushed repairs cause rework, and rework consumes the capacity needed to reduce backlog.

Delay can make a corrective action overshoot. Adding staff based on last month's queue can leave excess capacity after demand falls. Check observation delay, hiring or setup delay, and how the decision is revised.

Judge local measures against the system result. Maximizing intake, keeping every station busy, or finishing only easy jobs can increase waiting or conceal unfinished obligations. A useful change identifies the constrained resource, the expected result, its side effects, and the observation that would make the choice worth revisiting.
