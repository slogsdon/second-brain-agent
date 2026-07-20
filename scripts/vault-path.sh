#!/usr/bin/env bash
# Single source of truth for the vault's absolute base path.
# Both the SessionStart hook and the skills resolve the vault through this, so
# they always agree — on a clone (cwd is the repo) and on a plugin install
# (cwd is anywhere; the vault lives outside the read-only plugin cache).
#
# Resolution order:
#   1. Recorded path written by setup  (~/.config/loop-and-gate/vault)
#   2. Clone convenience: the repo's own ./vault, but NEVER the plugin cache's
#      bundled vault — a plugin install must go through setup.
# Prints the absolute base to stdout, or nothing if unresolved (caller nudges
# the user to run the setup skill).
set -euo pipefail

recorded="$HOME/.config/loop-and-gate/vault"
if [ -f "$recorded" ]; then
  cat "$recorded"
  exit 0
fi

# No recorded path. Allow the repo's ./vault ONLY for a clone — detect a plugin
# install by this script's own location and refuse to adopt its bundled vault.
case "$0" in
  */plugins/cache/*) : ;;  # plugin install: no ./vault fallback, force setup
  *)
    repo_vault="$(cd "$(dirname "$0")/.." 2>/dev/null && pwd)/vault"
    if [ -f "$repo_vault/MEMORY.md" ]; then
      printf '%s\n' "$repo_vault"
      exit 0
    fi
    ;;
esac

# Unresolved — the caller (hook) nudges the user to /setup.
exit 0
