-- Run with the Luau CLI: luau tests/config_check.luau
-- Checks the freshness steps and debris values (the money path).
local Config = require("../src/shared/Config")

assert(Config.freshness(0) == 3, "white-hot is 3x")
assert(Config.freshness(30) == 2, "orange is 2x")
assert(Config.freshness(60) == 1.5, "red is 1.5x")
local mult, _, hot = Config.freshness(200)
assert(mult == 1 and hot == false, "cold is 1x and stops glowing")
assert(Config.value("Pebble", 0, false) == 15)
assert(Config.value("Chunk", 50, true) == 150, "red gold chunk: 20 * 1.5 * 5")
print("config ok")
