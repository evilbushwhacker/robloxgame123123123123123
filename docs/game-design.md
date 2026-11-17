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

## 3. Open questions

Answered in small rounds in the project thread. Recommendation in brackets.

- **Q1 Stoker mechanic** [rhythm pedaling on two alternating keys, gears, boost from perfect strokes, a joint "tandem hop" that only works if both press jump together]
- **Q2 Fall punishment** [camps every zone, a fall costs at most one zone; separate no-camps mode for streamers]
- **Q3 Solo and groups of 3-4** [matchmaking pad, bot stoker after 15 seconds; extra friends ride a second tandem in the same server]
- Q4 World and theme
- Q5 Session shape: one continuous climb vs separate levels [one climb, summit visible from spawn]
- Q6 What you earn and spend (progression)
- Q7 Monetization [duo bike packs, server fanfare, double coins: see 5.4]
- Q8 Name and thumbnail

## 4. Core loop (draft)

1. Spawn, see the summit, pick or find a partner (under 10 seconds).
2. Ride the first zone: a short, easy climb that teaches pedal rhythm by sound and road markings, no pop-ups.
3. Reach the first camp inside 2 minutes: first win, coins, a cosmetic preview of what's next.
4. Each zone adds one new obstacle idea, then mixes it with old ones.
5. Leave with a visible next camp and a half-filled reward bar (unfinished business).

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
