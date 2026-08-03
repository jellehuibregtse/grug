#!/bin/sh
# Optional statusline badge: renders [GRUG] while grug is on, nothing while it
# is off. Wire it up in settings.json:
#
#   "statusLine": { "type": "command", "command": "sh /path/to/grug-statusline.sh" }
#
# It runs on every keystroke, so it only ever reads whether the flag file
# exists — never its contents. A symlinked flag is ignored rather than
# followed, so a planted link cannot make the statusline render another file's
# bytes (terminal escape sequences included) into the prompt.

FLAG="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/.grug-active"

[ -L "$FLAG" ] && exit 0
[ -f "$FLAG" ] || exit 0

printf '\033[38;5;172m[GRUG]\033[0m'
