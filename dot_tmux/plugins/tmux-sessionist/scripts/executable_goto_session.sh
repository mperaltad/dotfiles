#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	# displayes tmux session list
	tmux run-shell "$CURRENT_DIR/list_sessions.sh"
	# goto command prompt
	tmux command -p session: "run '$CURRENT_DIR/switch_or_loop.sh \"%1\"'"
}
main
