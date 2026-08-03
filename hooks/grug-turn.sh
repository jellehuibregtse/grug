#!/bin/sh
# UserPromptSubmit: keep grug anchored on every turn so it survives a long
# session, and honour the on/off phrases. Always exits 0.

. "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)/grug-state.sh"

# The turn arrives as a JSON payload on stdin. Matching the whole message rather
# than a substring is what keeps "stop grug from eating the config" from turning
# grug off mid-task. A prompt containing a quote extracts as garbage and matches
# nothing, which leaves grug exactly as it was.
prompt=$(sed -n 's/.*"prompt"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' |
	tr '[:upper:]' '[:lower:]' |
	sed 's/^[[:space:]]*//; s/[[:space:].!?]*$//')

case "$prompt" in
'stop grug' | 'normal mode' | 'grug off' | '/grug off')
	grug_off
	exit 0
	;;
'grug mode' | 'full grug' | 'be grug' | 'grug on' | '/grug' | '/grug on')
	grug_on
	;;
esac

grug_is_on || exit 0

grug_emit_anchor UserPromptSubmit

exit 0
