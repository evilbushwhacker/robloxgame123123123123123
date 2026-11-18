# Meteor cleanup crew

Roblox game. Design docs are in [docs/](docs/): start with [game-design.md](docs/game-design.md) and [v1-plan.md](docs/v1-plan.md).

## Code layout

| File | Goes in Studio as | Does |
|---|---|---|
| `src/shared/Config.luau` | ReplicatedStorage > Shared > **Config** (ModuleScript) | Every tuning number |
| `src/server/Main.server.luau` | ServerScriptService > **Main** (Script) | Meteors, debris, carrying, selling |
| `src/client/Feedback.client.luau` | StarterPlayer > StarterPlayerScripts > **Feedback** (LocalScript) | Cash pop and camera shake |

## Play it in Studio

**With Rojo (recommended):** install Rojo and its Studio plugin, run `rojo serve` in this folder, open a new **Baseplate** place, click Connect in the Rojo plugin, then press Play.

**Without Rojo:** in a new Baseplate place, create the three scripts above with exactly those names and types, paste each file's contents in, and press Play.

If the map has no part named `HQ`, the game makes a yellow placeholder pad at the centre (and removes the template's spawn). To use your own HQ, add a **Part** (not a model) named `HQ`.

## Check

`luau tests/config_check.luau` checks the freshness steps and debris values.
