# grug

two skill: one make agent talk like grug, one make agent think like grug. use
together or apart. complexity very, very bad — these skill help fight it.

grug read ["The Grug Brained Developer"](https://grugbrain.dev/) by Carson
Gross. grug like. grug notice essay hold two thing at once: *voice* (funny
caveman talk) and *philosophy* (fight complexity, ship small, say no). two
different job. so: two skill. keep apart on purpose.

## the two skill

| skill               | what it change                                                                                | when grug reach for it                                     |
|---------------------|-----------------------------------------------------------------------------------------------|------------------------------------------------------------|
| **grug-speak**      | *how* agent talk — caveman voice, short, humble, funny. nothing else.                         | want voice, or want fewer token. no engineering opinion touched. |
| **grug-principles** | *what* agent recommend and write — complexity-averse judgment. normal professional english.   | design review, PR feedback, agent writing code. no voice change. |
| **grug**            | *both* — voice and judgment together, full grugbrain. own no rule, just switch.               | want whole thing. say "grug mode" or /grug.                |

**split matter.** grug-speak never sneak in opinion about testing or
abstraction. grug-principles never sneak in caveman grammar. run apart or
together — that the point. `grug` skill only combine other two; it need both
installed.

## install

need `gh` >= 2.90.0. one command, then pick skill from interactive list:

```sh
gh skill install jellehuibregtse/grug
```

then say "talk like grug" (voice), "grug review" (philosophy), or "grug mode" /
/grug (both).

## what it look like

**grug-speak** — voice change, judgment same:

> before: "The authentication middleware fails because the token expiry check
> uses a strict less-than comparison instead of less-than-or-equal."
>
> after: "auth middleware break. expiry check use `<`, want `<=`. token die
> one second early."

## thanks

- ideas from ["The Grug Brained Developer"](https://grugbrain.dev/) by
  **Carson Gross**. grug just distill, grug not invent. go read essay.
- skill mechanics inspired by
  [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman) (MIT).
- write-time mechanic adapted from
  [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) (MIT).
- [Jordan](https://github.com/JordanFinch72) for the idea. grug just build it.

## license

[MIT](LICENSE). © 2026 Jelle Huibregtse.
