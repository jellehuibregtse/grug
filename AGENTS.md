# Working on this repo

This repository ships Agent Skills, one per folder under `skills/`, each a
`SKILL.md` in the [agentskills.io](https://agentskills.io) format. It is
installable with `gh skill install jellehuibregtse/grug/<skill-name>` and
vendorable into a project's `.claude/skills/` or `.agents/skills/`.

The same tree is also a Claude Code plugin (and a one-entry marketplace), so
Claude Code users get the skills plus the hooks that keep grug from drifting.
Both install paths read the same `skills/` folder — never fork the skill text
for one of them.

## Layout

- One skill per folder: `skills/<skill-name>/SKILL.md`. Flat, no categories.
- Plugin manifests live in `.claude-plugin/` and nothing else does. Hooks live
  in `hooks/` at the repo root, where Claude Code expects them.
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

Activation and persistence machinery lives in the plugin, not in the skills:
`hooks/` holds the scripts, and the combiner's `SKILL.md` only points at them.
The machinery may re-inject the two sibling skills verbatim and switch grug on
and off; it must never author a voice or engineering rule of its own. Turning
grug on is the plugin's job; deciding how grug talks or what grug recommends
is not.

The hooks are POSIX `sh`, dependency-free, and always exit 0 — a broken grug
must never break someone's session. `anchor.txt` is interpolated straight into
a JSON string, so it stays one line with no quote and no backslash.

## Source

Ideas come from "The Grug Brained Developer" by Carson Gross
(https://grugbrain.dev/). The essay's source repository,
[bigskysoftware/grugbrain.dev](https://github.com/bigskysoftware/grugbrain.dev),
is licensed under the Grug 1-Clause License ("do what want"), so quoting the
web essay verbatim is permitted. Prefer distillation where it reads better,
but verbatim is fine. One caveat: the 2025 print book edition is All Rights
Reserved — quote only from the web/repo text, never book-only material.
