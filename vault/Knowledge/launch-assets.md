# Loop & Gate — launch assets

Detailed outlines for the launch assets scoped in [[launch-strategy]]. The tease
post ["Building on the Margins"](https://shane.logsdon.io/articles/strategic-insights/building-on-the-margins/)
already does the top-of-funnel manifesto job — do NOT write a competing essay.
The two assets that don't yet exist: the demo and the install tutorial.

## Demo shot-list — one full loop iteration (~75s)

Demo the **Build kit** (`/loop-and-gate`) — most visual proof of the wedge:
agent working, a gate interrupting, a human deciding, then ship. Silent screen
capture + on-screen captions (autoplays without sound on PH/X/Reddit). Captions
≤7 words. Real terminal, real repo, no slides.

| # | Time | On screen | Caption | Purpose |
|---|------|-----------|---------|---------|
| 1 | 0–6s | Cold terminal; type a plain-English build request | "Tell it what to build." | Low-friction entry |
| 2 | 6–14s | Agent starts; Gate ∞ sizes the change | "First it decides how much this earns." | The master gate, up front |
| 3 | 14–24s | Agent works — files change, scrub the middle | "Autonomy where it's cheap." | Real working agent, not a wizard |
| 4 | 24–40s | Agent STOPS at a gate; hold 2s of stillness on the prompt | "Then it stops — and asks you." | THE money shot; the pause is the product |
| 5 | 40–52s | Human types the decision; agent resumes on that call | "Judgment where it's expensive." | Wedge line, shown not claimed |
| 6 | 52–64s | Second gate — ship/safety check — pauses before finishing | "It won't ship past you." | Gates scale to stakes |
| 7 | 64–72s | Change lands; quick glance at diff/result | "You stayed in control the whole way." | Payoff — done, you owned every call |
| 8 | 72–75s | End card: wordmark + line + URL, freeze 3s | "Loop & Gate — your agent works, you keep the judgment." | Brand + CTA, screenshot-able |

Directing: scene 4 is the entire ad — give the stillness weight (subtle zoom on
the prompt). One-continuous-take feel; scrub boring middles, never the gates.
Cut a 6s loop (scenes 2→4→8) for X/Reddit autoplay + the 75s full for
PH/landing/YouTube. Real repo, real change — HN smells staged demos.

## Install tutorial outline — "Get gates on your AI agent in 5 minutes"

Product-first, reader's-agent as protagonist, zero LeadSurface. Drives to
activation (Foundation → profile-interview → one full loop), not a bare install.
Ends at `/plugin install` + email capture. Every command must match the current
GETTING-STARTED path exactly — link to repo docs for edge cases, don't duplicate
troubleshooting (single source of truth = repo docs).

Promise up top: "First gate firing in 5 minutes. Your agent trained to your
taste in 15." Honest two-part time budget.

0. **Who/prereqs** (filter fast): you use Claude Code + watched it do the wrong
   thing confidently; needs Claude Pro/Max (state loud — #1 stall); Mac/Windows.
1. **Payoff first:** what you'll have — agent runs the loop but stops at the
   decisions that are yours, and learns your voice/taste. One screenshot of a
   gate firing.

Part 1 — first gate in 5 min:
2. **Install Foundation** — `/plugin marketplace add slogsdon/second-brain-agent`
   → Install; then `> Run the Foundation setup script to place my vault.` (the
   memory + session loop everything rides on).
3. **Add Build kit** — `/plugin marketplace add slogsdon/loop-and-gate-build-kit`
   → Install (where a gate visibly fires; matches the demo).
4. **Fire first gate (aha, keep tiny):** open any repo, `/loop-and-gate`, ask a
   small change. Callout: Gate ∞ sizes it, then it STOPS and asks before
   committing. End Part 1 — value felt in ~5 min, natural share point.

Part 2 — make it yours in 10 more (real activation):
5. **profile-interview** — teaches it how you write + what you judge good; this
   is why gate-checks catch *your* standard. The novelty-vs-tool difference.
6. **One real loop end to end** — a change you actually want; point out sizing
   (typo waves through, money/user-data gets the full treatment — you don't fill
   in ceremony, the loop scales it).
7. **It compounds** (one para) — each loop feeds memory; next session sharper.
   The reason to come back tomorrow.

8. **Go further** (soft): other kits (Grow, Accountability) one line each;
   cross-device → link `#working-across-devices`; honest platform caveat (plugin
   skills read-only on some platforms; `git clone` for full self-improving loop
   — reuse the exact docs caveat, don't soften).
9. **CTA:** free + open → repo links; then the owned-list ask — "I'm building the
   version that just-works across devices — get updates" → email capture. The
   tutorial's real job: activated user → list member to monetize later.

Screenshots at steps 4 and 5 only (the two ahas), not install menus. Reader's
agent is the protagonist throughout — "your agent," never "I"/"LeadSurface."
Publish on owned domain; product-first counterpart the tease post links to.
