#!/bin/sh
# SubagentStart: SessionStart context is parent-thread only, so without this
# every spawned subagent runs grug-unaware. Anchor grug there too. Always
# exits 0.

. "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)/grug-state.sh"

grug_is_on || exit 0

grug_emit_anchor SubagentStart

exit 0
