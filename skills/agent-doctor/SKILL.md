---
name: agent-doctor
description: Use when reviewing Agent instructions for clarity or redundancy, tracing session problems to Agent assets, or deciding what to keep, prune, or change based on usage, context cost, or effects on tasks.
metadata:
  version: "1.0.0"
---

# Agent Doctor

Help the maintainer decide what to do with a Skill, bundled resource, `AGENTS.md`, prompt, hook, or playbook. Start with their question. They need not know which asset caused a problem. Use ordinary diagnosis for an application fault and writing guidance for a request to draft new instructions.

## Choose the evidence

- **Review an existing diagnosis, including your own.** Read [Review a diagnosis](./references/review.md). Start with the answer the maintainer received. Replace unsupported advice with a finding and a check that answers the original decision.
- **Review an asset before use.** Read [Static review](./references/static-review.md). Walk the actual package from entry to deliverable. For repeated rules, distinguish merging the copies from removing the instruction altogether.
- **Find recurring rework or explain a specific failure.** Read [Session evidence](./references/sessions.md). Start a retrospective with independent sessions; start an incident with the original request and deliverable.
- **Explain usage, context cost, or the value of a resource.** Read [Usage evidence](./references/usage.md). Count eligible opportunities and distinguish a description being present from a body being read. Use the same guide when deciding whether instructions change what the model would do anyway.

Start with the one branch that answers the question. A repeated read within a session belongs to the session branch; open the usage branch for a separate question about cost, coverage or value. Get evidence from the files supplied and their authorized references. Open those paths directly. If a source is missing, name it and stop that line of inquiry at the boundary the maintainer set. Parent directories and other sessions are separate sources.

## Recommend an action

Lead with the decision that the evidence supports. **Investigate** is a complete recommendation: keep the asset as written and name the next observation. A request for changes does not establish that an asset needs editing. For each finding, name the affected task, asset and evidence, then use the relevant branch's answer format. When the evidence warrants action, choose its scope:

- **Keep** an asset that still serves its intended cases. A rare recovery procedure may justify its place on the few occasions it applies.
- **Switch to manual invocation** when the use remains valuable, the maintainer can recognize the occasion, and automatic discovery costs context or causes mistaken selections. Specify the explicit command, name, or path that still works in this host.
- **Prune** a named passage when the shorter version preserves the required behavior for the target tasks and models. Say which behavior must survive and where a target model still needs the prompt.
- **Remove** an asset when its purpose has ended or moved elsewhere. Identify the replacement if any and check incoming references before recommending removal.
- **Correct** the asset whose defect the evidence identifies. An incorrect deliverable locates a failure; check what caused it before assigning a fix to an instruction, reference, trigger, host setting, hook, or evaluator. Preserve parts of the delivery that were right.

When the evidence leaves different actions plausible, give the smallest missing observation and say how its possible results would change the advice. Deliver the recommendation to the maintainer. Changes, deletion, new consumer runs, installation, and publication require their own authorization.
