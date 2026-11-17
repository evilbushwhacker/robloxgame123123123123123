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

## 4. Research in progress

- Dead Rails deep dive: the closest proven shape (crew, shared vehicle, loot, sell, upgrade).
- Roblox benchmark numbers: retention, session length, monetization, audience, launch targets, physics limits.
- Competition check: meteor games, time-decaying loot, shared crew economies, hauling on mobile.
