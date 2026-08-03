#!/bin/sh
# Sourced by the grug hooks — not a hook itself. Presence of the flag file is
# the on state; there is nothing else to read. SessionStart recreates it every
# session, so "stop grug" lasts until the next session and no further.

GRUG_FLAG="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/.grug-active"

grug_on() {
	mkdir -p "${GRUG_FLAG%/*}" 2>/dev/null
	: >"$GRUG_FLAG" 2>/dev/null
	return 0
}

grug_off() {
	rm -f "$GRUG_FLAG" 2>/dev/null
	return 0
}

grug_is_on() {
	[ -f "$GRUG_FLAG" ]
}

# Every hook resolves its siblings and the skills through this. Claude Code sets
# CLAUDE_PLUGIN_ROOT for plugin hooks; the fallback keeps the scripts runnable
# straight out of a checkout.
grug_root() {
	if [ -n "${CLAUDE_PLUGIN_ROOT:-}" ]; then
		printf '%s\n' "$CLAUDE_PLUGIN_ROOT"
	else
		CDPATH= cd -- "$(dirname -- "$0")/.." && pwd
	fi
}

# The anchor is one line of plain text with no quote or backslash, so it drops
# straight into a JSON string without an escaper.
grug_emit_anchor() {
	printf '{"hookSpecificOutput":{"hookEventName":"%s","additionalContext":"%s"}}\n' \
		"$1" "$(cat "$(grug_root)/hooks/anchor.txt")"
}
