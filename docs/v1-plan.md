# Version 1 plan (draft)

What goes into the first public release, the starting numbers, and the order to build it in. Built from the locked decisions D1-D14 in [game-design.md](game-design.md). Ideas that didn't make v1 stay in [idea-bank.md](idea-bank.md). Every number here is a **starting value to playtest**, not a promise.

**Rule for v1:** the smallest game that proves the loop is fun and makes a player come back tomorrow. Everything else ships later as the 1-2 week updates (D8, Dead Rails lesson).

## 1. The first 10 minutes (what a new player sees)

| Time | What happens | TikTok checklist item |
|---|---|---|
| 0-10 s | Spawn at HQ, a meteor streaks across the sky and hits the city. Big arrow: "Get in the truck!" | Goal within 10 s |
| 10-60 s | Drive the free pickup to the impact, grab glowing pieces, cash pops on every pickup | Juicy feedback |
| 1-3 min | Sell at HQ, wave 2 is visible in the sky, a helper bot joins you | First win, no dead time |
| ~5 min | **Payday** for the short first shift. Shop opens, the first upgrade is affordable right away | First win within minutes, clear shop value |
| 5-10 min | Locked trucks and the next tool are on display at HQ with prices | Visible upcoming rewards |

## 2. What's in v1

### 2.1 Map
- **One district** ("Downtown"): about 6-8 city blocks, HQ at one edge, roads wide enough for arcade driving.
- A **second district behind a closed gate** with "Coming soon". It shows there's more and becomes the first update (week 2).
- Buildings are pre-broken models that swap in on impact, never real physics destruction (idea bank: rejected).

### 2.2 Shift and waves (D9)

| | First shift ever | Normal shift |
|---|---|---|
| Length | ~5 min | ~12 min |
| Waves | 2 | 3 |
| Meteors per wave | 3, then 5 | 4, 6, 8 |
| Finale | none | wave 3 ends with a **Core meteor** (rare drop, big glow) |
| Between waves | 20 s break, next wave visible in the sky | same |

### 2.3 Meteor types
| Type | What it does | When |
|---|---|---|
| Normal | One impact, a pile of debris | Every wave |
| Cluster | Splits in the air into 4 small impacts, more but smaller pieces | Wave 2+ |
| Gold meteor | Rare (about 1 in 3 shifts), gold debris worth 5x, a server-wide announcement | Any wave |

Ice comets, alien eggs and holiday drops wait for events.

### 2.4 Debris

| Size | How you move it | Base cash |
|---|---|---|
| Pebble | Hands or vacuum, several at once | 5 |
| Chunk | Both hands, you walk slower | 20 |
| Boulder | Too heavy to carry: 2 players or the crane truck | 80 |
| Core | Wave 3 finale only, needs the crane or 2 players | 400 |

**Freshness (D14, C1):** value shown by glow colour, in 4 steps so a player reads it instantly.

| Glow | Age | Multiplier |
|---|---|---|
| White-hot | 0-20 s | 3x |
| Orange | 20-45 s | 2x |
| Red | 45-90 s | 1.5x |
| Cold grey | 90 s+ | 1x |

Steps instead of a smooth fade: "it just turned orange, hurry" is a decision, a slow fade isn't.

### 2.5 Knockout (D12)
- Every impact shows a growing **shadow and red ring** on the ground **2 seconds** before it lands (playtest 1.5-3 s).
- Danger radius **8 studs**. Running out of it is always possible.
- Hit: ragdoll, back to HQ, you lose what you were carrying. A truck hit drops **half** its load, not all (idea bank, so one hit doesn't erase a crew's shift).

### 2.6 Trucks (D13)
All arcade driving: gas, brake, steer, big phone buttons. Debris thrown into the bed stays there (welded on arrival, no loose physics).

| Truck | Bed holds | Special | Price (Stardust) |
|---|---|---|---|
| Pickup | 20 pebbles or 4 chunks | Free starter | 0 |
| Dump truck | 3x pickup | Tips the whole load at HQ in one go | 1,500 |
| Crane truck | 2x pickup | Crane lifts boulders and cores alone | 5,000 |
| Hauler | 6x pickup | Fastest unload, endgame flex | 20,000 |

### 2.7 Tools (3 upgrade levels each)

| Tool | Does | Price (Stardust) |
|---|---|---|
| Gloves | Carry pebbles by hand (free, everyone has them) | 0 |
| Shovel | Scoops several pebbles at once | 300 / 900 / 2,500 |
| Vacuum backpack | Sucks pebbles in a radius, has a capacity | 1,200 / 3,500 / 9,000 |
| Boots | Run faster (escaping impacts, getting to fresh debris first) | 400 / 1,200 / 3,000 |

### 2.8 Helpers (D5)
- **Cleaning bots**, not AI drivers: small robots dressed like the crew, in the same yellow hi-vis jacket and hard hat (Bartosz: not the obvious square-head robot). They read as junior crew members, not machines. Small, round, friendly; their outfit matches the crew's uniform paint, so uniforms you buy show on your bots too. They follow you and pick up pebbles near you, then drop them in your truck.
- Everyone gets 1 free bot. Buy up to 3 (800 / 2,500 / 6,000 Stardust).
- Solo players get +1 extra bot automatically, so solo isn't slower than a crew (D5).
- AI that drives trucks or lifts boulders is out for v1: hard to build, buggy on phones, and *Clean the Moon!* already proved bots are enough.

### 2.9 Crew (D4, D11)
- **No menu, no separate lobby place.** You join and you're standing at HQ with the tutorial already running. HQ *is* the lobby (Bartosz, 18 Nov: "speed is everything, take the player to the tutorial ASAP"). A separate lobby place would add a 10-20 s teleport before anyone plays.
- **Servers hold about 12 players, split into crews of up to 4.** Every player starts in their own crew (solo with bots), so nobody waits for anyone.
- **Teaming up:** an "Invite friends" button (Roblox's built-in invite) and a "Join crew" prompt when you walk up to another player at HQ. A friend who joins through the invite lands in your server and is put in your crew automatically. You can join or leave a crew between shifts, never mid-shift.
- All crews share the same city, so fresh debris is also a race against other crews (fits D3).
- Anyone can drive any truck in the crew and use any tool level the crew owns; you only keep what you bought.
- Boulders are worth carrying together; a "two players lifting" pose is a clip moment.
- Private servers stay available but are never the way in; the invite button is (co-play ranking signal).
- Quick pings ("Here!", "Help lift", "Truck full") instead of chat, since half of players can't chat.

### 2.10 Economy (D10)

**Two currencies:**
- **Cash:** earned on every delivery, only during the shift. Spent on fuel (50), truck repair (100), and one-shift boosts (magnet gloves 200, extra bot for this shift 300). **Resets at the end of the shift** (Dead Rails model).
- **Stardust** (working name): paid at payday, kept forever, buys trucks, tools and bots.

**Payday formula (starting point):**
- 1 Stardust per 10 Cash earned in the shift (spending Cash on fuel doesn't reduce it, so boosts never feel like a trap)
- +25 per wave cleared, +100 for a full shift, +50 crew bonus when 2+ players finish together

**Pacing targets (playtest these):**
| Point | Stardust per shift | First thing they can buy |
|---|---|---|
| First shift (5 min) | ~200 | First shovel at shift 2 |
| Day 1 (about 1 hour) | ~250-400 | Shovel + boots + first bot, dump truck in reach |
| Day 3 | ~600-900 | Dump truck, vacuum |
| Week 1-2 | ~1,200-2,000 | Crane truck, then saving for the hauler |

All v1 items together cost about 60,000 Stardust: roughly 15-25 hours for a regular player, which covers the gap until the first updates.

### 2.11 Retention extras (cheap, in v1)
- **Daily login streak:** day 1-7, Stardust rising each day, day 7 gives a truck paint.
- **Leaderboard** at HQ: tons cleaned this week.
- **Trophy shelf** at HQ for gold debris and cores (idea bank: trophy hall, small version).

### 2.12 Money (Robux)
Sell convenience and looks, never power (Dead Rails lesson).

| Item | Price | Type |
|---|---|---|
| 2x Stardust | 199 R$ | Game pass |
| VIP: +1 bot slot, gold name tag, VIP truck paint | 149 R$ | Game pass |
| Truck paints, crew uniforms | 25-75 R$ | Developer products |
| "Get back up": revive with your load after a hit | 45 R$ | Developer product |

No paid random boxes, no stage skips, no selling trucks for Robux.

## 3. Not in v1 (on purpose)
Second district (week 2 update), ice comets and other meteor types, holiday falling things, rescue a knocked-out crewmate, insurance, crew roles, rebuilding the city, HQ upgrades, hard mode, server-wide weekly goal. All stay in the idea bank as update content.

## 4. Build order

Each step ends with something playable. If a step isn't fun, we fix it before the next one.

| Step | What | Done when |
|---|---|---|
| 1. Core loop on foot | Meteor with warning ring, impact, debris spawns, pick up, carry, sell at HQ, glow steps | 2 minutes on foot are already fun |
| 2. Shift | Waves, timer, wave bonus, payday, Cash and Stardust, saving | A full shift plays start to finish and progress saves |
| 3. Trucks | Pickup, load into bed, arcade driving, phone buttons, unload | Driving to a site and back feels quick on a phone |
| 4. Shop and upgrades | Truck and tool shop, upgrade levels, crew sharing rules | First upgrade bought after shift 1 |
| 5. Helpers and crew | Cleaning bots, boulders for 2, pings, private servers | 1 and 4 players both feel good |
| 6. First 10 minutes | Guided short first shift, arrows, juice (sounds, screen shake, cash pops) | A new tester gets it without being told |
| 7. Launch extras | Game passes, daily streak, leaderboard, trophies, performance pass on a cheap phone | Runs smoothly on a low-end phone with 4 players |
| 8. Soft launch | Friends test, then public (16+ first, 250 plays unlock under-16s) | Day-1 retention measured |

**Performance rules from day one:** debris is pooled and capped (about 300 pieces in the world), cold debris despawns after 3 minutes, decorative pieces have collisions off, truck physics run on the driver's device.
