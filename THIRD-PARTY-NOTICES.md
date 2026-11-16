# Third-party notices

English | [中文](./THIRD-PARTY-NOTICES.zh.md)

The scopes below apply to rstack Skills in both `skills/` and `skills-zh/`.

## MIT-licensed material

### Matt Pocock

Source: [mattpocock/skills@b0618bc](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404).

**Confirmed expression reuse**

- `writing-for-agents` reuses and translates paragraphs from `skills/productivity/writing-for-agents/SKILL.md` and `SKILL-MECHANICS.md`. Coverage: `writing-for-agents/`.

### Lauren Tan

Source: [cursor/plugins pstack@5bf2b15](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack).

**Confirmed expression reuse**

- `wellsaid` adapts and translates the AI-tell pattern catalogue and editing process from `skills/unslop/SKILL.md`. Coverage: those parts of `SKILL.md`.

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

## Concept references

These sources inform the concepts and methods in independently written rstack material.

- `ddd`: Eric Evans, Domain Language, Inc., _Domain-Driven Design Reference: Definitions and Pattern Summaries_, version 2015-03, for domain modeling concepts. The [original reference](https://www.domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf), © 2015 Eric Evans, is available under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Matt Pocock's [domain-modeling](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/domain-modeling) informs exploration and language work. Pstack's [principle-model-the-domain](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/principle-model-the-domain/SKILL.md) informs explicit state and organization around domain knowledge.
- `code-design`: Matt Pocock's [codebase-design](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/codebase-design) and [improve-codebase-architecture](https://github.com/mattpocock/skills/tree/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/improve-codebase-architecture), for interface contracts and structural improvement; Pstack's [architect](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/architect), for usage-first design and comparing structures; John Ousterhout's _A Philosophy of Software Design_, for module depth and information hiding.
- `technical-writing`: Pstack's [technical-writing](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/technical-writing/SKILL.md), for reader-oriented organization, precise terminology, and instructions with clear conditions.
- `reflect`: Pstack's [reflect](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/reflect), for independent review lenses and synthesis; Matt Pocock's [retro](https://github.com/mattpocock/skills/blob/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/retro/SKILL.md), for distinguishing mechanically enforceable conditions from judgment.
- `prototype`: Pstack's [prototype playbook](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/poteto-mode/playbooks/prototype.md), for disposable experiments, comparable alternatives, and observation before a design choice.
- `use-rstack` and `create-playbook`: Pstack [poteto-mode](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/poteto-mode/SKILL.md) and [figure-it-out](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/figure-it-out/SKILL.md) at 5bf2b15, for method selection, ordinary Markdown playbooks, and arranging activities for a need. The text and organization are independently written for rstack.
- `use-rstack`: Matt Pocock's [ask-matt](https://github.com/mattpocock/skills/blob/b0618bc436ad893b3c5e84e55fba86586d34a404/skills/engineering/ask-matt/SKILL.md) at b0618bc, for organizing Skill navigation by the reader's problem and explaining relationships between capabilities. The navigation is independently written around rstack's Skills.
- `engineering-principles`: [Pstack principles at 5bf2b15](https://github.com/cursor/plugins/tree/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills).
- `type-driven-design`: [How to Design Programs](https://htdp.org/2020-8-1/Book/part_one.html) by Matthias Felleisen, Robert Bruce Findler, Matthew Flatt, and Shriram Krishnamurthi, for data definitions and corresponding consumers; [Parse, don't validate](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/) by Alexis King, for preserving acquired knowledge in representations with proportionate precision; [At the boundaries, applications aren't functional](https://blog.ploeh.dk/2022/05/02/at-the-boundaries-applications-arent-functional/) by Mark Seemann, for boundary-model responsibilities and maintenance cost. Language mechanisms link to official Python, typing, and msgspec documentation in the Python reference. The process, organization, and examples are original rstack content.
- `create-verification`: Pstack [create-verification-skill](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/create-verification-skill/SKILL.md) and [maintain-verification-skill](https://github.com/cursor/plugins/blob/5bf2b1544db739998121a306340631963c2ff3de/pstack/skills/maintain-verification-skill/SKILL.md) at 5bf2b15; [NASA product verification](https://www.nasa.gov/reference/5-3-product-verification/), [PIT](https://pitest.org/), [Anthropic agent evaluations](https://www.anthropic.com/research/demystifying-evals-for-ai-agents), [Hypothesis](https://hypothesis.readthedocs.io/en/latest/quickstart.html), [TLA+ Tools](https://lamport.azurewebsites.net/tla/tools.html), [Pact](https://docs.pact.io/consumer/contract_tests_not_functional_tests), [Google SRE canarying](https://sre.google/workbook/canarying-releases/), [Testcontainers](https://testcontainers.com/getting-started/), [WireMock](https://wiremock.org/docs/simulating-faults/), [OpenTelemetry signals](https://opentelemetry.io/docs/concepts/signals/), and [Playwright visual comparisons](https://playwright.dev/docs/test-snapshots).

- `improve`: Pstack `skills/poteto-mode/playbooks/hillclimb.md`, prove-it-works, build-the-lever, laziness-protocol, and show-me-your-work.
- `teach`: Pstack `skills/teach/SKILL.md` and `skills/bro/SKILL.md`; Matt Pocock's `teach` and `wait-what`.
- `diagnose`: Matt Pocock's `diagnosing-bugs`; Pstack `skills/poteto-mode/playbooks/bug-fix.md`, `runtime-forensics.md`, and `trace-forensics.md`.
- `blast-radius`: Pstack `skills/blast-radius/SKILL.md` and `skills/why/`; Matt Pocock's `pr`.
- `statechart`: Pstack `skills/statechart/SKILL.md`, `skills/create-formal-verification-skill/SKILL.md`, and `skills/maintain-formal-verification-skill/SKILL.md` at commit `de8ee15dd1194627d21eb5fcd41cb1873208dabb`.
- `system-architecture`: [awesome-architecture](https://github.com/study8677/awesome-architecture/tree/7f43e49b95ad9c255418733738fddab4eb0f6a68).
- `research`: Matt Pocock's `research`.
- Domain modeling and verification: [Specifications](https://martinfowler.com/apsupp/spec.pdf) by Eric Evans and Martin Fowler, [EventStorming](https://www.eventstorming.com/) by Alberto Brandolini, the [C4 model](https://c4model.com/abstractions/container) by Simon Brown, [Linearizability](https://jepsen.io/consistency/models/linearizable) by Jepsen citing Herlihy and Wing, [The Raft Consensus Algorithm](https://raft.github.io/), [statecharts.dev](https://statecharts.dev/), and [TLA+ Tools](https://lamport.azurewebsites.net/tla/tla.html) by Leslie Lamport with the [TLC Model Checker](https://github.com/tlaplus/tlaplus).
- Technical writing: [Diátaxis](https://diataxis.fr/), [Google Technical Writing](https://developers.google.com/tech-writing), and [ASD-STE100](https://www.asd-ste100.org/).
