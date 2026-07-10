#!/bin/sh
# grug SessionStart hook: re-inject the full grug ruleset (voice + judgment) at
# every session boundary (startup / resume / clear / compact). stdout is
# injected verbatim as session context. Always exits 0 so it can never break a
# session.

DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

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

strip_frontmatter "$DIR/../SKILL.md"
strip_frontmatter "$DIR/../../grug-speak/SKILL.md"
strip_frontmatter "$DIR/../../grug-principles/SKILL.md"

exit 0
