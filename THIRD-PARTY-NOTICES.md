# Third-party notices

English | [中文](./THIRD-PARTY-NOTICES.zh.md)

The scopes below apply to rstack Skills in both `skills/` and `skills-zh/`.

## MIT-licensed material

### Matt Pocock

Source: [mattpocock/skills@b0618bc](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404).

**Confirmed expression reuse**

- `writing-for-agents` reuses and translates paragraphs from `skills/productivity/writing-for-agents/SKILL.md` and `SKILL-MECHANICS.md`. Coverage: `writing-for-agents/`.

**Conservative retention**

- `ddd` draws on `skills/engineering/domain-modeling/` for domain exploration. Coverage: `SKILL.md`, `discovery/`, and `modeling/evolution.md`.
- `code-design` draws on `skills/engineering/codebase-design/` and `skills/engineering/improve-codebase-architecture/` for interface contracts and existing-code improvement. Coverage: `interfaces.md`, `existing-code.md`, and `design-principles/deep-modules.md`.

### Lauren Tan

Source: [cursor/plugins pstack@5bf2b15](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack).

**Confirmed expression reuse**

- `wellsaid` adapts and translates the AI-tell pattern catalogue and editing process from `skills/unslop/SKILL.md`. Coverage: those parts of `SKILL.md`.

**Conservative retention**

- `ddd` draws on `skills/principle-model-the-domain/SKILL.md` for explicit state representation and organization around domain knowledge. Coverage: `SKILL.md` and `modeling/implementation.md`.
- `code-design` draws on `skills/architect/` for usage-first design, structure candidates, and design review. Coverage: `interfaces.md`, `existing-code.md`, and `design-principles/deep-modules.md`.
- `technical-writing` draws on `skills/technical-writing/SKILL.md`. Coverage: `SKILL.md`.
- `reflect` draws on `skills/reflect/` for review lenses and synthesis criteria. Coverage: `SKILL.md` and `references/`.
- `prototype` draws on the prototyping process in `skills/poteto-mode/playbooks/prototype.md`. Coverage: `SKILL.md`.

### MIT License

```text
MIT License

Copyright (c) 2026 Matt Pocock
Copyright (c) 2026 Lauren Tan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## CC BY 4.0 material

Eric Evans, Domain Language, Inc., Domain-Driven Design Reference, Definitions and Pattern Summaries, version 2015-03. © 2015 Eric Evans.

- [Original PDF](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf).
- [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).
- [Legal code](https://creativecommons.org/licenses/by/4.0/legalcode.en), including the warranties disclaimer and liability limitation in Section 5.

`ddd` summarizes, reorganizes, and adapts the definitions and pattern summaries into English and Chinese. Changes extend object-oriented descriptions to functional models, qualify consistency, declarative guarantees, and event descriptions by their actual mechanisms, and add original explanations and examples.

The adaptation covers `ddd/SKILL.md` and these references in `ddd/`:

- `discovery/`: `knowledge.md`, `language.md`.
- `strategic/`: `subdomains.md`, `bounded-contexts.md`, `context-mapping.md`, `large-scale-structure.md`.
- `tactical/`: `identity.md`, `aggregates.md`, `behavior.md`, `lifecycle.md`, `events.md`.
- `modeling/`: `implementation.md`, `evolution.md`, `validation.md`.

Adapted material uses CC BY 4.0. Separately copyrightable original additions use the [project's MIT License](./LICENSE).

## Concept references

- `engineering-principles`: [Pstack principles at 5bf2b15](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills).

- `improve`: Pstack `skills/poteto-mode/playbooks/hillclimb.md`, prove-it-works, build-the-lever, laziness-protocol, and show-me-your-work.
- `teach`: Pstack `skills/teach/SKILL.md` and `skills/bro/SKILL.md`; Matt Pocock's `teach` and `wait-what`.
- `diagnose`: Matt Pocock's `diagnosing-bugs`; Pstack `skills/poteto-mode/playbooks/bug-fix.md`, `runtime-forensics.md`, and `trace-forensics.md`.
- `blast-radius`: Pstack `skills/blast-radius/SKILL.md` and `skills/why/`; Matt Pocock's `pr`.
- `statechart`: Pstack `skills/statechart/SKILL.md`, `skills/create-formal-verification-skill/SKILL.md`, and `skills/maintain-formal-verification-skill/SKILL.md` at commit `de8ee15dd1194627d21eb5fcd41cb1873208dabb`.
- `system-architecture`: [awesome-architecture](https://github.com/study8677/awesome-architecture/tree/7f43e49b95ad9c255418733738fddab4eb0f6a68).
- `research`: Matt Pocock's `research`.
- Domain modeling and verification: [Specifications](https://martinfowler.com/apsupp/spec.pdf) by Eric Evans and Martin Fowler, [EventStorming](https://www.eventstorming.com/) by Alberto Brandolini, the [C4 model](https://c4model.com/abstractions/container) by Simon Brown, [Linearizability](https://jepsen.io/consistency/models/linearizable) by Jepsen citing Herlihy and Wing, [The Raft Consensus Algorithm](https://raft.github.io/), [statecharts.dev](https://statecharts.dev/), and [TLA+ Tools](https://lamport.azurewebsites.net/tla/tla.html) by Leslie Lamport with the [TLC Model Checker](https://github.com/tlaplus/tlaplus).
- Technical writing: [Diátaxis](https://diataxis.fr/), [Google Technical Writing](https://developers.google.com/tech-writing), and [ASD-STE100](https://www.asd-ste100.org/).
