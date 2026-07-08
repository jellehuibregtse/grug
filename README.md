# grug

two skill: one make agent talk like grug, one make agent think like grug. use
together or apart. complexity very, very bad — these skill help fight it.

grug read ["The Grug Brained Developer"](https://grugbrain.dev/) by Carson
Gross. grug like. grug notice essay hold two thing at once: a *voice* (funny
caveman talk) and a *philosophy* (fight complexity, ship small, say no). two
different job. so: two skill. keep them apart on purpose.

## the two skill

| skill               | what it change                                                                                                                              | when grug reach for it                                                                           |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| **grug-speak**      | *how* agent talk — caveman voice, short, humble, funny. nothing else.                                                                       | want the voice, or want fewer token. no engineering opinion touched.                             |
| **grug-principles** | *what* agent recommend and write — complexity-averse judgment for design, review, and code agent write itself. normal professional english. | design review, PR feedback, agent writing or fixing code, "would grug approve." no voice change. |
| **grug**            | *both* — turn on voice and judgment together, the full grugbrain. own no rule, just a switch.                                               | want the whole thing. say "grug mode" or /grug.                                                  |

**the split matter.** grug-speak never sneak in opinion about testing or
abstraction. grug-principles never sneak in caveman grammar. run
grug-principles alone for serious review. run grug-speak alone for fun or
token saving. run both — or just /grug — for full grugbrain. that the point.
the `grug` skill only combine the other two; it need both installed.

## install

with GitHub `gh skill` (need `gh` >= 2.90.0):

```sh
gh skill install jellehuibregtse/grug/grug-speak
gh skill install jellehuibregtse/grug/grug-principles
gh skill install jellehuibregtse/grug/grug          # combined — needs the two above
```

or vendor by hand — copy the skill folder into the consuming repo (copy all of
`skills/` if you want the combined `grug` switch):

```sh
# Claude Code
cp -r skills/grug-speak       /path/to/your-project/.claude/skills/
cp -r skills/grug-principles  /path/to/your-project/.claude/skills/
cp -r skills/grug             /path/to/your-project/.claude/skills/

# agents that share .agents/skills/
cp -r skills/grug-speak       /path/to/your-project/.agents/skills/
cp -r skills/grug-principles  /path/to/your-project/.agents/skills/
cp -r skills/grug             /path/to/your-project/.agents/skills/
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

**grug-principles** — judgment change, voice stay professional:

> before: "Looks good, extracting a generic `Repository<T>` base class here
> cleans up the duplication."
>
> after: "Hold on the generic base class — this is one caller, not a pattern
> yet. That is speculative abstraction; the duplication is cheaper than the
> indirection until a second real case shows up. Recommend waiting for the cut
> point to emerge."

**grug-principles** — write-time, judgment for code agent write itself:

> asked: "add a date picker to this React form."
>
> before: agent install picker library, write wrapper component, style it —
> forty line and one new dependency.
>
> after: `<input type="date" />` and one line:
> `// grug: native date input enough here, swap in picker library only if
> design demand range select`. zero new dependency.

## thanks

- ideas from ["The Grug Brained Developer"](https://grugbrain.dev/) by
  **Carson Gross**. grug just distill, grug not invent. go read the essay.
- skill mechanics (persistence, auto-clarity escape hatch, boundaries, no
  self-reference) inspired by [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman)
  (MIT). grug study how it work, grug not copy the word.
- write-time mechanic (the ladder rungs, root-cause fix, `grug:` marker
  comment) adapted from [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail)
  (MIT). grug study how it work, grug not copy the word.
- [Jordan](https://github.com/JordanFinch72) for the idea. grug just build it.

## license

[MIT](LICENSE). © 2026 Jelle Huibregtse.
