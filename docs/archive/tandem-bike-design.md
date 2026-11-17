# Tandem climb: game design doc

Living doc. Every decision lands here, with the reason. The final build prompt is written from this file.
Working title: none yet. Advice source: [tiktok-advice.md](tiktok-advice.md).

## 1. Pitch

Two friends, one tandem bike, one huge climb. The front rider (the **captain**) steers and leans. The back rider (the **stoker**) pedals in rhythm, shifts gears, boosts and brakes. Neither can climb alone. Fall, and you roll back down to the last camp.

## 2. Decisions so far

| # | Decision | Why | Status |
|---|----------|-----|--------|
| D1 | Two-player co-op on one bike, asymmetric roles | Core idea | Locked |
| D2 | Original world, characters and levels. No cloning another climb game | Bartosz's rule | Locked |
| D3 | Stoker role must take skill, not just holding W | Otherwise one player is bored | Locked, mechanic open (Q1) |
| D4 | Prototype the two-player bike physics before anything else | Biggest technical risk (section 6) | Locked |
| D5 | Mobile must be first-class. The stoker plays a **timing bar**: a needle sweeps across a bar with a green zone; hitting green gives a stroke of power (or fires a hop). Details in 4.1 | Bartosz (Q1); most players are on phones | Locked, tuning open |
| D6 | Checkpoints every few short sections, not every obstacle and not none. Exact spacing in 4.2 | Bartosz (Q2) plus how top duo obbies do it (5.9) | Locked, tuning in playtests |
| D7 | Solo players get a strong AI partner | Bartosz (Q3). No top duo vehicle obby supports solo (5.9), so this is our biggest edge | Locked |
| D8 | Groups of 3-4 get a "broken bike" mode: the bike's controls are split between everyone | Bartosz (Q3) | Locked, role split in 4.3 |

## 3. Open questions

Answered in small rounds in the project thread. Recommendation in brackets.

- ~~Q1 Stoker mechanic~~ answered: D5
- ~~Q2 Fall punishment~~ answered: D6
- ~~Q3 Solo and groups of 3-4~~ answered: D7, D8
- **Q10 What makes us different from the existing tandem and duo bike obbies** (5.9)
- Q4 World and theme
- Q5 Session shape: one continuous climb vs separate levels [one climb, summit visible from spawn]
- Q6 What you earn and spend (progression)
- Q7 Monetization [duo bike packs, server fanfare, double coins: see 5.4]
- Q8 Name and thumbnail
- Q9 Talking without chat [ping wheel plus quick calls]

## 4. Core loop (draft)

1. Spawn, see the summit, pick or find a partner (under 10 seconds).
2. Ride the first zone: a short, easy climb that teaches pedal rhythm by sound and road markings, no pop-ups.
3. Reach the first camp inside 2 minutes: first win, coins, a cosmetic preview of what's next.
4. Each zone adds one new obstacle idea, then mixes it with old ones.
5. Leave with a visible next camp and a half-filled reward bar (unfinished business).

### 4.1 Stoker timing bar (D5)

Bartosz's idea: a bar split roughly a third red, a third green, a third red; a press in the green moves the bike forward or makes it jump. How it's tuned, using the TikTok advice:

- **Easy first, harder later** ("introduce things gradually", "first win within minutes"): zone 1 starts with a wide green zone (about a third of the bar, as Bartosz suggested). It narrows on steep or later zones. A thin bright strip in the middle of the green is a "perfect" hit that fills the boost meter.
- **Readable without a tutorial** ("know what to do in 10 seconds"): the bar sits in the world, on the bike's chain ring next to the stoker, not as a flat HUD box. The stoker still watches the road, and clips show the bar.
- **Feedback on every press** ("every action gets sound and visuals", Nintendo method): green is a chain click, a small speed push and a pedal animation. Perfect is a brighter chime that rises in pitch with each perfect in a row. Red is a chain-slip clunk and the bike rolls back a little on slopes, so a miss is felt, not just shown.
- **Mobile**: one large thumb button on the right side, away from the screen edge. PC: Space or a mouse click. Console: one button.
- **The hop**: the steerer presses hop and the next green hit fires it. Both have to commit, which makes hops the co-op moment and a clip moment.
- Open for playtests: how fast the needle sweeps, whether holding green-hits builds speed, and whether brake is a separate button.

### 4.2 Checkpoints (D6)

What the top games do (5.9): Tower of Hell has none. Chained Together has few, and one mistake can cost several stages. Tandem and Scooter Duo save at checkpoints spaced a few obstacles apart and send you back to repeat the current section. Tandem and Gecko Duo sell or give out **revives** that continue from where you fell.

Recommendation: a **checkpoint every 3 sections**, each section about 20-40 seconds of riding. A fall costs at most about 1-2 minutes. That keeps the "oh no" of falling without the rage that makes new players quit in the first session. A revive (continue from the fall point) is earnable for free (daily, group join) and buyable as a small developer product. This revises the earlier "no paid checkpoints" stance in 5.4: revives are proven in this exact niche and don't skip any obstacle you haven't beaten. A no-checkpoint "hardcore" mode for streamers comes later.

### 4.3 Solo AI and the broken-bike mode (D7, D8)

**Solo AI.** The player picks a seat and the AI takes the other one.
- An AI stoker is easy: it hits the bar on time, with a small chance of an early or late hit.
- An AI steerer is the hard part: it follows a racing line that we draw by hand for each section.
- "Plays well" should still mean slightly human. A partner who never misses removes the funny failures. Give it a name, a face and a few voice lines.

**Broken bike (3-4 players).** Every control is split up, so everyone is needed:

| Players | Roles |
|---|---|
| 3 | Left steer, right steer, stoker |
| 4 | Left steer, right steer, two stokers who must both hit green at the same time for full power (one hit gives half power) |

Risk: holding only "left" can feel thin. Fix: each steerer also owns one extra action, such as the bell, the brake or the hop trigger, so nobody just waits.

## 5. Research

The research prompts from the TikToks, run against this concept.

### 5.1 Dead game method

Shut-down multiplayer games with loyal fans, what players still miss, and how it carries over here.

| Game (closed) | What fans miss | Reinvented for us |
|---|---|---|
| LittleBigPlanet 3 online (servers shut 2024) | Messy co-op physics, grabbing and pulling each other, laughing at failures | Physics should be a bit floppy on purpose; failing together must look funny, not just frustrating |
| Knockout City (2023) | Teamwork that the rules force: passing, curving, turning a teammate into the ball | Forced cooperation through a joint move: the tandem hop only works together |
| Toontown Online (2013) | Combos: two players stacking moves in the same turn did extra damage | Combo windows: captain lean plus stoker boost at the same moment gives a bigger effect |
| Club Penguin (2017) | Easy social hub, minigames, showing off your igloo and outfit | Camps are small social hubs: other pairs rest there, show bikes, emote |
| Rumbleverse (2023) | Movement that felt great on its own, before any combat | The bike must be fun to ride on flat ground before any obstacle exists |

Why they died is a warning list too: long queues and empty servers (Rumbleverse, Knockout City), so solo players must never wait for a partner (Q3).

### 5.2 Game design knowledge (talks and books in place of the "top 20 YouTube videos")

I can't watch videos, so this uses the well-known references they mostly quote:
- *Juice it or lose it* (Jonasson & Purho) and *The art of screenshake* (Nijman): tiny effects on every action change how a game feels.
- Celeste's forgiveness tricks: coyote time and input buffering. For us: a short grace window after leaving a ledge, and a jump pressed slightly early still counts.
- Steve Swink, *Game Feel*: real-time control, a reaction to every input, polish. Applies to steering and pedaling.
- The lihfolk Roblox vault is already installed here as a design library for Roblox specifics.

### 5.3 Environmental clues (Elden Ring method)

Elden Ring rarely tells you where to go. It shows you: a giant landmark on the horizon, light that draws the eye, corpses that warn of danger, messages left by other players.
- The summit is visible from spawn and from almost everywhere. That's the goal in under 10 seconds.
- Each camp has a bright beacon you can see from the camp before.
- Tire marks from other pairs show the common line; scorch or skid marks before a drop warn of a fail spot.
- Riders can leave short chalk notes from a fixed word list ("boost here", "hop!", "don't trust this"), rated by others.
- The first zone teaches rhythm with road stripes that pass under the wheels on the beat. No tutorial pop-ups.

### 5.4 Monetization debate

Three debaters each defended one model. Their price and revenue claims came from search titles and general knowledge, so verify before relying on numbers.

- **Dress to Impress (cosmetics)**: VIP pass, cosmetic packs, show-off at the runway. Fits because cosmetics can't break fairness between partners, and pairs like to match. Weakness: we have no runway, so cosmetics only sell if there's a place to be seen.
- **Blox Fruits (progression passes)**: permanent 2x passes and utility passes like a notifier. Fits solo and bot players, who have nobody to show cosmetics to. Weakness: anything that makes the climb easier hollows out a skill game. All three agreed: **never sell stage skips**.
- **Steal a Brainrot (social impact)**: server-wide boosts bought in live moments, conflict items. Fits because a server full of pairs on one tower is a stage, and a named, server-wide buy is a status moment. Weakness: paid trolling on a fall-back-down climb makes victims quit.

**Verdict (my call, open to challenge)**
1. **Duo bike packs** (99 to 299 R$, fixed contents, no random): frame paint, wheels, bell sound, pedal trail. The buyer can lend their look to the partner for the ride, so a friend sees what they could own.
2. **Server Fanfare** (49 R$, repeatable): confetti, a named banner, and +10% coins for every pair in the server for 60 seconds. Helps everyone, hurts nobody, sells on impulse.
3. **Double Coins** (about 399 R$): 2x coins for the buyer, a smaller bonus for whoever rides with them. Never touches physics.

Rejected: stage skips; paid luck crates (odds disclosure, and paid random items are restricted for under-18s in some regions); paid trolling items like dropping hazards on other pairs.
Undecided (part of Q2): paid checkpoint anchors. They earn well but soften the fall stakes.
Requirement this creates: camps and the summit need a visible podium or rest area, so cosmetics have somewhere to be seen.

### 5.5 Hitchcock bomb theory

Show the audience the bomb under the table and a boring conversation becomes tense. Suspense needs the player to know danger is coming. Options:
- **Rising hazard**: something visible climbs up from below over time (water, fog, a swarm). You always know it's coming.
- **Asymmetric warning**: the stoker faces backward-ish and sees what's behind; the captain sees ahead. Each has to warn the other.
- **Telegraphed collapse**: bridges crack visibly a few seconds before they drop. You see it start and have to commit.
- **Spectators**: pairs resting at a camp can watch the next section, so they see a fail coming before the riders do.

### 5.6 Nintendo game feel

Simple actions feel good through anticipation, a strong hit moment, and a satisfying sound that changes with streaks. Our three most common actions:
1. **Pedal stroke**: on-beat strokes give a click, chain sound and a small speed push; streaks raise the pitch; a missed beat gives a chain-slip clunk.
2. **Landing**: a short squash of the bike, dust puff, camera dip, a few frames of pause on big landings.
3. **Reaching a camp**: the bike skids to a stop, the beacon lights, coins pop toward the coin counter one by one.

### 5.7 Player simulations

- **Kid, one month in**: still excited by new zones and showing off bike skins. Bored by replaying zone 1 every time. → Later zones need their own spawn points once unlocked.
- **Showing a best friend**: shows the tandem hop and the fail montage, skips the menus. → Make the hop the first "wow" in zone 1.
- **Two friends, first time**: next day they talk about the time one of them made them both fall. They forget the flat parts. → No flat filler between zones; blame-able, funny fails.
- **Seven-year-old picking a thumbnail**: scrolls past anything that looks like another obby. → Two characters on one bike, mid-air, with something huge behind them.
- **Kids arguing about what to play**: "it's only for two, we're four"; "I don't have anyone online"; "rage games are too hard". → These are Q2 and Q3.
- **Kid buying an upgrade**: a "+5% speed" bike looks pointless. → Upgrades must show a visible change (pending section 5.4 and Q6).
- **YouTuber recording**: clip moments are a huge tandem hop, a fall all the way down blamed on the partner, a last-second save on a collapsing bridge.

### 5.8 Skills and design libraries studied

Searched GitHub for game design repos and agent skills, and read the relevant parts of the best ones plus the installed lihfolk Roblox vault. Nothing from them is copied into this repo; they're reference only.

| Source | What we took |
|---|---|
| lihfolk vault, *Network Ownership* | Confirms the main risk: on a two-seat vehicle the first player to sit owns all the physics and the other player's input lags. Assign the owner once on sit and never switch mid-ride (switching causes stutter). A client that owns the bike can also cheat its position, so camp rewards must be checked on the server. |
| lihfolk, 2026 platform research | **Under-16 players can't see a new game until it passes an evaluation**: a trial with age-checked 16+ players (250 plays by highly engaged users within 60 days), a verified owner account and a refundable fee. So our **launch audience is 16+**, not kids. Discovery also scores the first 60 seconds (first-play bounce rate), D28 retention and monetization together, and counts at most 60 minutes of playtime per player per day. Chat is age-checked, so **partners must be able to talk without chat** (pings and quick phrases). |
| fagemx/gstack-game, *feel-pass* | The 4-beat model for every action: anticipation, action, impact, resolution. Name the feedback channel and the timing, never just "feels good". Audio carries about half the feel. Any wait over half a second is dead time unless it's authored. Test an action on the 20th repeat, not the first. |
| AshExplained/roblox-skills (world design, UX, social, retention) | Spawn facing the landmark, safe space before challenge space, rewards right after effort, social areas where progress shows. Mobile first: large touch targets, no precision drags unless the game is built on it. Retention plan by day: D1 fun fast, D3 big unlock around hour 2-3, D7 a reward promised on day 1. |
| brockmartin/roblox-game-skill, obby template | Standard checkpoint and stage structure we can borrow. It has nothing on vehicle physics or two-player ownership, so the prototype in section 6 is still on us. |
| hzoo/awesome-gametalks, Roobyx/awesome-game-design | Reading lists of game talks and design resources, for later deep dives. |

What this changes:
- **Audience**: design and the thumbnail must win over 16+ players first (they like rage and clip moments), while staying fine for kids once we pass the evaluation. Affects Q2.
- **New question Q9**: how do partners talk without chat? [a ping wheel and a few quick calls like "boost!", "hop on 3", "brake"]
- **Mobile** weighs on Q1: a rhythm input must work with two big thumb buttons.

### 5.9 Top-performing games with the same tech (researched 2026-11-17)

**The core idea already exists.** Others have released a tandem bike where one player steers and the other moves it, more than once:

| Game | Released | Visits | Peak players | Now | What it does |
|---|---|---|---|---|---|
| Tandem [2 Player Obby] | Aug 2024 | 29M | 4.8K | ~0 | Tandem bike, one steers, one controls speed. Auto-save checkpoints, revives. Strictly 2 players |
| Biker Duo [2 Player Obby] | May 2026 | 31.7M | 10K (Sep 2026) | ~280 | 2-player motorcycle obby, duo time leaderboard. "Make sure you have a friend" |
| Scooter Duo [2 Player Obby] | 2026 | 17.1M | - | ~4.2K | Driver steers and brakes, passenger calls hazards. Repeat the section after a fall |
| Tandem Trails | 2024 | 1M+ | - | ~0 | Jeep, one drives, one steers |
| Carry the Glass Together | Jun 2026 | 44M | 11.3K | ~2.6K | Two players carry glass; checkpoints |
| Gecko Duo | 2026 | 3.5M | - | ~6K | Two tethered geckos climbing; revives, free ones for joining the group |
| Chained Together (Roblox) | Jun 2024 | 197M | 14K | ~800 | Chained team of 2-5 climbing up; few checkpoints |
| Tower of Hell | 2018 | 29.4B | - | ~19K | Solo tower, no checkpoints |

Eight of the top 20 obbies by live players are multiplayer or duo games, so the niche is in demand and crowded.

What this means:
1. **Demand is proven**: duo vehicle and climb obbies reach 10K+ peaks in 2026.
2. **They fade fast**: Tandem and Biker Duo both fell close to zero. They share the same weaknesses: they need a friend online, the roles are simple movement, and there's little to come back for (dead game method).
3. **Our edges have to be exactly those gaps**: a strong AI partner (none of them have one), a skill-based stoker role (D5), a broken-bike mode for 3-4 (D8), a vertical climb with a summit always in view, and progression to return for.
4. **Naming**: we can't call it "Tandem" or "Duo" anything. Q8 needs an original name.

Sources: rolimons.com (Tandem, Chained Together, Carry the Glass), rowatcher.com (Biker Duo, Obby But You're On a Bike), rblxdb.com obby ranking (snapshot 15 Nov 2026), sportskeeda.com (how to play Tandem), scooter-duo.wiki, roblox.com game pages.

## 6. Technical risk: two players, one physics bike

On Roblox one client owns a physics assembly at a time. If the captain's client owns the bike, steering feels instant but the stoker's input reaches the bike late (their ping plus the captain's). If the server owns it, both players feel delay.
- Recommended: the captain owns the bike. The stoker's rhythm is judged on the stoker's own screen and only the resulting power level is sent; power is smoothed, so a short delay isn't felt.
- Joint moves (tandem hop) use a time window wide enough to cover typical ping.
- Prototype first: a flat test track, two real clients, one with simulated lag.

## 7. Advice checklist status

Tracks [tiktok-advice.md](tiktok-advice.md). Filled in as decisions land.

| Item | Covered by |
|---|---|
| Goal within 10 s | Summit visible from spawn (5.3) |
| First win in minutes | First camp under 2 minutes (4) |
| Visible upcoming rewards | Pending Q6 |
| No dead time | Pending Q3 (no waiting for partner) |
| Juicy feedback | 5.6 |
| Social reasons | Core co-op, camps as hubs |
| 3 clip moments | 5.7 |
| Standout thumbnail | Pending Q8 |
| Clear shop value | Pending Q6/Q7 |
