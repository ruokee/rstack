---
name: teach
description: Use when the user wants to understand a concept, mechanism, or method, or remains confused by an explanation.
metadata:
  version: "1.0.0"
---

# Teach

Help the learner understand the current question. Choose the starting point, order, and depth from their goal and existing knowledge. Default to an explanation in the conversation.

## Set the goal

Use the current request and conversation to identify what the learner wants to understand or do, and what they already know. Ask only for missing information that would change the teaching approach. Start when the goal, requested depth, and necessary background are clear.

## Check the content

Reuse the context, source material, and findings already available. When a mechanism needs investigation, invoke the how branch of `thinking-method`. For unresolved reasons or tradeoffs, use its why branch. Choose other methods for the specific difficulty. Use `research` when systematic source gathering or verification is needed. Keep investigation within the teaching request's delivery mode and permissions.

Distinguish facts, inferences, and unknowns. Ground explanations in the supplied facts and operations. Separate a choice's observable effects and general tradeoffs from the reason for that particular choice. Attribute that reason to a source. State it as unknown when the source is silent. Label possible reasons as hypotheses. Preserve the evidence's scope, conditions, and uncertainty through simplification and analogy.

## Explain

Lead with the direct core answer. Define unfamiliar terms in context, then connect the idea to the learner's situation. Walk through a concrete example to show the problem it addresses, how it works, and where it applies.

Cover the requested scope at the agreed depth. A one-shot answer should stand on its own. In an interactive exchange, use the learner's follow-up questions to choose the next useful layer.

Use examples, formulas, code, or diagrams when they help understanding. Choose the form for the content and follow the host's presentation rules. Before composing the explanation, read `wellsaid` unless its full guidance is already in context. Use the learner's language and the host's writing guidance.

## Respond to feedback

When the learner is confused, locate the obstacle: missing background, an unfamiliar term, a skipped reasoning step, or an unhelpful example. Supply the missing context and explain it from a starting point they recognize.

Let ordinary teaching advance through natural conversation. Reserve exercises and requests to demonstrate understanding for explicit interest in practice or checking understanding through an attempt. Choose a small attempt tied to the goal and give feedback on what the learner actually shows.

Distinguish demonstrated understanding, self-reported knowledge, and material merely explained. Ground judgments about learning in the specific attempt or statement.

## Finish

Finish when the current question is covered at the agreed depth, or the learner stops or changes direction. Return the explanation itself with necessary sources and qualifications.

Prepare handouts, courses, or learning records when explicitly needed, using an existing Task or another authorized location. Preserve goals, evidence of understanding, and remaining questions that will help later teaching. Choose the material's form and extent for its intended use. Demonstrations, exercises, and changes follow the host's authorization rules.
