#!/usr/bin/env bash
# PreToolUse gate: pause before the agent edits its OWN instructions.
#
# Fires on Edit/Write/MultiEdit targeting a skill file or CLAUDE.md and returns
# permissionDecision "ask" — Claude Code then shows its native approval prompt
# with the diff, and NOTHING is written until the human approves. This is the
# "Gate" half of Loop & Gate as a harness control, not a model instruction:
# it holds even when the model is sloppy, and even under
# --dangerously-skip-permissions (PreToolUse fires before any permission check).
#
# Deliberately does NOT gate vault/** — gating memory writes would make every
# session a click-fest and undercut "autonomous between the gates."
#
# No jq dependency, matching scripts/session-start-hook.sh (grep/sed only).
# ponytail: assumes one file_path field in the tool input (always true for
# Edit/Write/MultiEdit); if Claude Code ever nests file_path, tighten the sed.
set -euo pipefail

input=$(cat)

tool=$(printf '%s' "$input" | sed -n 's/.*"tool_name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
path=$(printf '%s' "$input" | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')

# Only file-mutating tools matter.
case "$tool" in
  Edit|Write|MultiEdit) ;;
  *) exit 0 ;;
esac

# Never gate memory writes — the loop must run autonomously between gates.
case "$path" in
  */vault/*|vault/*) exit 0 ;;
esac

# Gate edits to the agent's own instructions: any skill file, or CLAUDE.md.
case "$path" in
  */skills/*|skills/*|*/CLAUDE.md|CLAUDE.md)
    cat <<'JSON'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"Loop & Gate: this edits an agent skill or CLAUDE.md — the agent is changing its own instructions. Approve this self-modification. Nothing is written until you do."}}
JSON
    ;;
esac

exit 0
