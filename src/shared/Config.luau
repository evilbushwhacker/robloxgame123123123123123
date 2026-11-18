-- Every tuning number for the game lives here. Plain numbers and hex strings only (no Roblox types),
-- so tests/config_check.luau can run it outside Roblox. Values come from docs/v1-plan.md and are meant to be playtested.
local Config = {}

-- Meteors
Config.MeteorInterval = 6 -- seconds between meteors (placeholder until waves arrive in step 2)
Config.WarnTime = 2 -- seconds the warning ring shows before impact (playtest 1.5-3)
Config.DangerRadius = 8 -- studs; standing inside this at impact knocks you out
Config.CityRadius = 140 -- meteors land within this distance of HQ...
Config.HQSafeRadius = 35 -- ...but never this close
Config.FallHeight = 250
Config.GoldChance = 0.05
Config.GoldMultiplier = 5

-- Debris kinds: base cash value, part size, and how many spawn per impact (min, max)
Config.Debris = {
	Pebble = { value = 5, size = { 1.2, 1.2, 1.2 }, count = { 6, 10 } },
	Chunk = { value = 20, size = { 3, 2.5, 3 }, count = { 1, 3 } },
}
Config.ScatterRadius = 10
Config.MaxDebris = 300 -- hard cap on loose debris in the world (phones)
Config.DespawnAge = 180 -- cold debris older than this disappears

-- Carrying
Config.PebbleCarry = 5 -- pebbles you can hold with bare gloves
Config.WalkSpeed = 16
Config.ChunkWalkSpeed = 11 -- you walk slower holding a chunk
Config.PickupRange = 12
Config.RespawnTime = 2 -- knockout: seconds until you are back at HQ

-- Freshness steps: debris younger than `age` seconds is worth `mult` and glows `color`.
-- Older than the last step = cold.
Config.Freshness = {
	{ age = 20, mult = 3, color = "#FFF4D6" }, -- white-hot
	{ age = 45, mult = 2, color = "#FF8C1E" }, -- orange
	{ age = 90, mult = 1.5, color = "#DC281E" }, -- red
}
Config.Cold = { mult = 1, color = "#5A5A5F" }

-- Returns the multiplier, colour (hex) and whether it still glows for debris of this age.
function Config.freshness(age: number)
	for _, step in Config.Freshness do
		if age < step.age then
			return step.mult, step.color, true
		end
	end
	return Config.Cold.mult, Config.Cold.color, false
end

function Config.value(kind: string, age: number, gold: boolean): number
	local mult = Config.freshness(age)
	return math.floor(Config.Debris[kind].value * mult * (if gold then Config.GoldMultiplier else 1))
end

return Config
