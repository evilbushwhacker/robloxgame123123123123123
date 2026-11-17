# Meteor cleanup crew: game design doc

Living doc. Every decision lands here with its reason. The final plan and build prompt are written from this file.
Working title: none yet. Research behind it: [idea-cleanup-crew.md](idea-cleanup-crew.md), [dead-roblox-games.md](dead-roblox-games.md), [tiktok-advice.md](tiktok-advice.md). The parked tandem bike design is in [archive/tandem-bike-design.md](archive/tandem-bike-design.md).

**Phase (Bartosz, 17 Nov 2026):** research, numbers and planning first, then build it in one go. "Six hours to cut a tree, four sharpening the axe."

## 1. Pitch

Meteors and falling stars smash into a city in waves. Your crew (solo with AI helpers, or up to 4 friends) rushes in to clean up and collect the debris while it's still fresh, sells it at HQ, and upgrades a shared fleet of trucks and tools. The faster you clean, the more you earn.

## 2. Decisions

| # | Decision | Source | Status |
|---|---|---|---|
| D1 | Destruction comes in **waves** | Bartosz | Locked |
| D2 | The player **chooses how much to risk**: how long to stay, how much to grab | Bartosz | Locked, mechanic open |
| D3 | **Debris loses value over time**; the faster you clean, the better | Bartosz | Locked, tuning open |
| D4 | **A crew of up to 4 shares what it buys**: trucks, shovels, vacuums | Bartosz | Locked, ownership rules open (C2) |
| D5 | **Solo players get AI helpers** | Bartosz | Locked |
| D6 | **Meteors and falling stars** destroy the city, not a licensed-looking monster | Bartosz; also avoids takedown risk | Locked |
| D7 | Earnings go into upgrading trucks, tools and gear | Bartosz | Locked |
| D8 | Must hold players for weeks, not hours: cleaning-only games crashed (Dig & Clean 270K to 307) | Research | Locked |

## 3. Open challenges

- **C1 Why does debris lose value?** Proposal: fresh star fragments glow hot and are worth the most; they cool and dim over time. The glow shows the value at a glance, without any UI (environmental clue, from the TikTok research).
- **C2 Shared purchases when friends leave.** If 4 friends pool money into 4 trucks and one quits, who keeps what? Proposal: everyone owns what they bought, but everything anyone in the crew owns is usable by the whole crew while they play together. Same shared feeling, no fights, no leeching.
- **C3 Meteors alone have no face.** A monster gives thumbnails and memories a character. Proposal: special meteor types (ice comet, gold meteor, a meteor carrying an alien egg) give each wave a personality, plus rare drops for a trophy hall.
- **C4 Risk choice.** Proposal: the next wave is visible in the sky. Staying in the impact zone to grab more risks getting your truck crushed and losing the load.

## 4. What the research says (17 Nov 2026)

### 4.1 Closest competitors

| Game | Visits | Peak | Now | Created | What it means for us |
|---|---|---|---|---|---|
| [Clean the Moon!](https://rowatcher.com/games/10770466814/clean-the-moon) | 11.9M | 24.5K (Nov 2026) | ~3.5K | 12 Oct 2026 | **Biggest threat.** Sweep space debris, sell, upgrade gear, build a lunar base, cleaning robots, friends. About 70% of our loop in space. Spiked and is fading like the rest of the 2026 "Clean the X" wave |
| [Dig & Clean](https://rowatcher.com/games/10475794799) | 130.5M | 270K (Aug 2026) | 307 | Jul 2026 | Cleaning loop alone spikes, then collapses |
| [Dead Rails](https://rotrends.com/game/7018190066/Dead-Rails) | 6.7B | ~1M+ (Mar-Apr 2025) | ~15K (+39% in 30 days) | Jan 2025 | **The model to learn from**: crew of 4, shared vehicle, drag loot, sell, upgrade; still alive after 20 months on 1-2 week updates |
| [TECH! Meteor Simulator](https://www.roblox.com/games/9602700094/TECH-Meteor-Simulator), [Throw Meteors!](https://www.roblox.com/games/95145848492160/Throw-Meteors) | - | - | ~0 | - | Meteor games exist but you *are* the meteor; nobody cleans up after one |
| [Off-Roading Epic](https://rowatcher.com/games/2360092394/off-roading-epic) | 269-358M | 11K (Jun 2026) | 2-5K | 2021 | Vehicles and trailers keep a game alive for years |

Nothing found combines a city hit by meteor waves, debris that loses value, and a shared crew truck fleet. A public GitHub prototype ("MeteorShift": mine a meteor before it cools) shows the idea is in the air, but it isn't a live game.

**Lesson:** we must not look like the sixth "Clean the ..." game. The meteors, the waves, the trucks and the crew have to be what people see first, in the name, the thumbnail and the first 10 seconds.

### 4.2 Lessons from Dead Rails ([GameAnalytics](https://gameanalytics.com/blog/dead-rails-and-the-hit-makers-formula), [Bloxodes](https://bloxodes.com/wiki/dead-rails), [Deltias](https://deltiasgaming.com/?p=230372))

1. **Familiar loop plus one new twist** ("most advanced yet acceptable"). Ours: cleanup sim plus meteor waves.
2. **A run with a clock and a clear end.** Dead Rails runs have fuel and nightfall pressure and end at a bridge; average session ~18 minutes *(unverified)*. Our clock: incoming waves and cooling debris.
3. **Two currencies.** Cash during the run buys ammo and supplies; Bonds, paid only at the end of a run, buy permanent unlocks. That stops players burning through progression in an afternoon.
4. **Physical loot you drag, plus a shared carrier** (horse cart you weld items to). Direct match for debris and crew trucks.
5. **Sell convenience, not power.** Players praise it as not pay-to-win. Prices: +5 storage 95 R$, starting guns 148-175 R$, 2x Bonds 199 R$, revive 45 R$.
6. **Hard mode early** (Nightmare after the first win, double rewards) and challenge runs for veterans.
7. **An update or event every 1-2 weeks.** That is why it still has ~15K players; clones without it peaked under 500.
8. **It went from hundreds to ~1M players within weeks of Roblox promoting it.** Servers must be ready for a spike.

### 4.3 Targets (from [Roblox's discovery docs](https://create.roblox.com/docs/discovery) and RoWatcher estimates)

| Metric | Target | Why |
|---|---|---|
| First session | over 3 minutes | Roblox counts leaving under 60 s and 61-180 s as bounces |
| Day-1 retention | 30%+ | Below 25-30% don't spend on ads *(RoWatcher estimate)* |
| Day-7 retention | 15%+ | *(RoWatcher estimate)* |
| Days 8-28 | players still returning | Roblox scores this window separately since June 2026 |
| Playtime | up to 60 min per player per day counts | Roblox caps what it counts |
| Co-play days | high | "Returning to play with friends" is its own ranking signal: build invites and free private servers in |
| Payer conversion | ~1% | Small devs report 0.1-0.2%; ~1% is good *(anecdotal)* |
| Game pass prices | 50-150 R$ impulse, 200-500 R$ VIP | Above 500 R$ sells only with obvious value *(RoWatcher)* |
| Ads | 5,000 R$/day for 7+ days minimum, only after D1 ≥ 30% | *(RoWatcher)* |

**Audience 2026** ([Roblox Q2 letter](https://s27.q4cdn.com/984876518/files/doc_financials/2026/q2/Roblox-Q2-2026-Earnings-Shareholder-Letter.pdf)): of age-checked daily players, 35% are under 13, 38% are 13-17, 27% are 18+. Spending by verified US adults pays developers 42% more in games using R15 avatars ([Roblox](https://about.roblox.com/ja/newsroom/2026/04/roblox-fuels-high-fidelity-games-over-18-players-increases-qualifying-devex-rate-42)), so use R15. Rewarded video ads are banned for under-13s since May 2026. Roblox's daily players fell 9% year on year in Q3 2026: a softer market than 2025.

**Phones:** Roblox publishes no part limits. Debris must be pooled, capped and short-lived; decorative pieces with collisions off. Truck controls must stay simple; complex excavator-style controls are a known poor fit for phones.
