# Working on this repo

This repository ships Agent Skills, one per folder under `skills/`, each a
`SKILL.md` in the [agentskills.io](https://agentskills.io) format. It is
installable with `gh skill install jellehuibregtse/grug/<skill-name>` and
vendorable into a project's `.claude/skills/` or `.agents/skills/`.

## Layout

- One skill per folder: `skills/<skill-name>/SKILL.md`. Flat, no categories.
- The folder name must equal the frontmatter `name`, lowercase and
  hyphen-separated (`^[a-z0-9]+(-[a-z0-9]+)*$`).
- Deep detail lives in a `references/` subfolder inside the skill, linked from
  the body (see `skills/grug-principles/references/principles.md`).

## SKILL.md frontmatter

- `name` and `description` are required. `name` must match the folder.
- Keep the frontmatter valid YAML and the description under ~1024 characters
  with concrete trigger phrases so agents know when to load the skill.

## The one rule that matters here

**The voice/philosophy split is intentional. Do not merge the two skills.**

- `grug-speak` changes *how* the agent talks (caveman voice) and nothing else.
  It must carry no engineering opinions.
- `grug-principles` changes *what* the agent recommends (complexity-averse
  engineering judgment) and nothing else. It must carry no voice rules beyond
  the professional-voice disclaimer.

If a change starts leaking testing/architecture opinions into `grug-speak`, or
caveman grammar into `grug-principles`, stop — that is the boundary breaking.
If a rule genuinely seems to belong in both, raise it rather than duplicating
it silently.

The `grug` skill is not an exception to this rule: it is a rule-free combiner
that only switches the other two on. It must never grow voice or engineering
rules of its own — the split still holds.

## Source

Ideas come from "The Grug Brained Developer" by Carson Gross
(https://grugbrain.dev/). The essay's source repository,
[bigskysoftware/grugbrain.dev](https://github.com/bigskysoftware/grugbrain.dev),
is licensed under the Grug 1-Clause License ("do what want"), so quoting the
web essay verbatim is permitted. Prefer distillation where it reads better,
but verbatim is fine. One caveat: the 2025 print book edition is All Rights
Reserved — quote only from the web/repo text, never book-only material.
