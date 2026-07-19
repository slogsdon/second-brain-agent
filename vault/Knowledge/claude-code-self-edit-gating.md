# Claude Code self-edit gating & plugin cache mechanics

How a "stop before the agent edits its own instructions" gate actually
behaves in Claude Code, and where plugin-installed skills physically live.

## Default permission mode already asks

In `default` permission mode, `Edit`/`Write` already prompt the user with a
rendered diff before writing. A PreToolUse hook that returns
`permissionDecision: "ask"` on skill/`CLAUDE.md` edits is therefore
**redundant in default mode** — it duplicates built-in behavior.

Such a hook only adds value in `acceptEdits` mode (or a broad allowlist),
where edits auto-accept with no prompt. There, a hook `ask` **tightens** the
auto-accept (PreToolUse hooks can only tighten: `deny` > `ask` > `allow`), so
self-modification re-triggers a prompt while other writes still flow. That is
the only config where a self-edit gate expresses something the platform can't:
"auto-accept everything except the agent rewriting itself."

`ask` does NOT survive `--dangerously-skip-permissions`; only `deny` is
documented to hold under bypass. A gate that must be approve-and-continue
(for a demo) structurally can't use `deny`, so it can't claim the
"holds under skip-permissions" guarantee.

Consequence: to gate self-edits meaningfully you must run the loop in
`acceptEdits`; in plain `default` mode the built-in prompt already covers it.

## Plugin install: skills live in a writable-but-cwd-mismatched cache

A plugin installed from a marketplace lands at:
`~/<CLAUDE_CONFIG_DIR>/plugins/cache/<marketplace>/<plugin>/<version>/` —
a flat copy at the version tag, **not a git repo**.

- The `.claude/skills -> ../skills` compatibility symlink ships inside the
  cache, so `.claude/skills/*/SKILL.md` resolves *within the cache*.
- Cache files are owner-writable (`-rw-r--r--`) — "read-only cache" is a
  logical convention, not a filesystem permission. An edit physically succeeds.
- BUT a plugin session's cwd is the **user's project**, not the cache. A
  relative path like `.claude/skills/improve/SKILL.md` does not exist there.

So a skill that self-edits via a relative path under plugin install either
(a) **fails** — file not found relative to cwd, or (b) if the agent resolves
the real cache path, **succeeds but is ineffective**: the cache is outside the
user's git (no reviewable diff — breaks the "every self-change is a revertable
commit" guarantee) and `plugin update` clobbers it. Self-editing persists only
in a **clone**, where the skills are the user's tracked working copy.

Related: [[example-what-this-vault-is]]
