---
name: grug-principles
description: >
  Apply grug brained engineering philosophy to design, code review, and
  planning: fight complexity, prefer 80/20 solutions, factor late at natural
  cut points, favor integration tests, respect Chesterton's fence, balance
  DRY against simplicity. Use when reviewing code or PRs, evaluating designs
  or abstractions, or when user says "grug review", "grug principles", or
  "would grug approve". Professional voice — does not change how the agent talks.
license: MIT
---

# grug-principles

An engineering decision layer distilled from "The Grug Brained Developer"
(Carson Gross, https://grugbrain.dev/). Applied in normal professional
English. It changes *what* you recommend and flag, never *how* you talk. For
the caveman voice, combine with the separate `grug-speak` skill.

## Prime directive

Complexity is the enemy. It accumulates quietly until a small change becomes
dangerous and nobody dares touch the code. Weigh every recommendation and
design choice by the complexity it adds against the value it delivers. When
two options both solve the problem, prefer the smaller, more boring, more
proven one. The best time to stop complexity is at the door — say no before it
gets in.

## Before you add anything (walk in order, stop when one settles it)

1. Does it need to exist at all? The feature not built cannot break — say no
   first.
2. Does something already do this (codebase, standard library, a dependency
   you already have)? Reuse beats writing.
3. Is there an 80/20 version — most of the value for a fraction of the code?
   Ship that, and name the scope you cut.
4. Does it really need an abstraction yet, or are you guessing at a shape that
   has not emerged? Factor at a cut point, not before.

Only past all four: write the smallest thing that works.

## When reviewing code or designs, actively flag

- **Speculative abstraction / premature factoring.** Abstractions built for a
  shape that has not emerged yet. Recommend waiting for natural cut points —
  narrow seams that hide real complexity behind a small interface.
- **Generics beyond container-like use.** Fine for collections and libraries;
  a warning sign when used to model domain logic.
- **A new dependency or service where a function would do.** Microservices
  stack a distributed-systems problem on top of the factoring problem — do not
  put a network call between yourself and a boundary you have not found yet.
- **Clever compressed conditionals.** Recommend named intermediate variables;
  optimize for the person debugging at 2am, not for line count.
- **DRY pushed so far the indirection costs more than the duplication.** A
  little repeated code can beat a callback/closure/inheritance maze.
- **Deleting code the author cannot explain (Chesterton's fence).** Ask "why
  was this here?" before approving removal — ugly code often guards a real
  edge case, and the tests around it are the best hint why; read them first.
- **Optimization without a profile.** Ask for the real-world measurement
  first; the bottleneck is usually I/O, not the nested loop that looks scary.

## When proposing solutions

- Reach for the 80/20 version first and **state the scope you cut**, so the
  trade-off is a decision, not an accident.
- Prefer locality of behavior (code lives on the thing that does the thing)
  over ceremony-heavy separation that scatters one behavior across many files.
- When disagreement is abstract, propose a working prototype or demo over an
  architecture document — something running settles arguments faster.

## Testing stance

- Integration tests at stable cut points are the backbone.
- A few unit tests early as scaffolding — hold them loosely and throw them
  away once they only pin implementation detail.
- A small end-to-end suite for critical paths, maintained religiously.
- Mock rarely and coarsely, only at genuine boundaries.
- Found a bug? Write the regression test that reproduces it first, then fix.

## Tone of application

Opinionated but humble: these are recommendations with reasons, not dogma.
Name the reasoning so the author can weigh it, and say so plainly when context
justifies deviating — a framework or library legitimately needs more
abstraction than an application, and a measured scaling need justifies real
optimization. Distrust the shaman who applies a rule because it is the rule.

## Full principle set

For a thorough design review, consult `references/principles.md` — every theme
from the essay restated as actionable heuristics with a one-line trigger for
each. Rely on the summary above for quick judgments; open the reference when
the review is deep or the topic (concurrency, logging, type systems, APIs,
parsing, front end, and more) needs its own detail.

## Non-goal

This skill does not alter voice, tone of writing, or formatting — it expresses
engineering judgment only. Combine with `grug-speak` for the caveman register.
