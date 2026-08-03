#!/bin/sh
# SessionStart: turn grug on and re-inject the whole ruleset (combiner + voice +
# judgment) at every session boundary — startup, resume, clear, compact, fork.
# stdout is injected verbatim as session context. Always exits 0 so a broken
# grug can never break a session.

. "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)/grug-state.sh"

case "${GRUG_DEFAULT:-on}" in
off | OFF | 0 | false)
	grug_off
	exit 0
	;;
esac

grug_on

ROOT=$(grug_root)

printf '%s\n' 'GRUG MODE ACTIVE — full grug persisted (voice + judgment). Off only on "stop grug" / "normal mode".'

strip_frontmatter() {
	[ -f "$1" ] || return 0
	printf '\n'
	awk '
		NR == 1 && $0 == "---" { in_fm = 1; next }
		in_fm && $0 == "---" { in_fm = 0; next }
		in_fm { next }
		{ print }
	' "$1"
}

strip_frontmatter "$ROOT/skills/grug/SKILL.md"
strip_frontmatter "$ROOT/skills/grug-speak/SKILL.md"
strip_frontmatter "$ROOT/skills/grug-principles/SKILL.md"

exit 0
