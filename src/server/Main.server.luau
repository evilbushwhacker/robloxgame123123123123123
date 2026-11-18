-- Build step 1: the core loop on foot.
-- Meteors fall with a warning ring, knock out anyone inside the ring, and leave glowing debris.
-- Players pick debris up, carry it to HQ and sell it. Debris cools in steps and is worth less as it does.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local Config = require(ReplicatedStorage.Shared.Config)

Players.RespawnTime = Config.RespawnTime

-- Remotes (server -> client only, used for feedback; the client never tells the server anything here)
local remotes = Instance.new("Folder")
remotes.Name = "Remotes"
local cashPop = Instance.new("RemoteEvent")
cashPop.Name = "CashPop"
cashPop.Parent = remotes
local impactFx = Instance.new("RemoteEvent")
impactFx.Name = "Impact"
impactFx.Parent = remotes
remotes.Parent = ReplicatedStorage

-- HQ: use a part named "HQ" if the map has one, otherwise make a placeholder pad that is also the spawn.
local hq = workspace:FindFirstChild("HQ")
if not hq then
	for _, obj in workspace:GetChildren() do
		if obj:IsA("SpawnLocation") then
			obj:Destroy() -- the template's spawn would overlap the HQ pad
		end
	end
	local pad = Instance.new("SpawnLocation")
	pad.Name = "HQ"
	pad.Size = Vector3.new(30, 1, 30)
	pad.Position = Vector3.new(0, 0.5, 0)
	pad.Anchored = true
	pad.Neutral = true
	pad.Duration = 0
	pad.Color = Color3.fromRGB(255, 200, 0)
	pad.Material = Enum.Material.Concrete
	pad.Parent = workspace
	hq = pad
end
local hqPos = hq.Position

local debrisFolder = Instance.new("Folder")
debrisFolder.Name = "Debris"
debrisFolder.Parent = workspace

local carried: { [Player]: { BasePart } } = {}

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude

local function groundAt(x: number, z: number): number
	local exclude = { debrisFolder }
	for _, p in Players:GetPlayers() do
		if p.Character then
			table.insert(exclude, p.Character)
		end
	end
	rayParams.FilterDescendantsInstances = exclude
	local hit = workspace:Raycast(Vector3.new(x, Config.FallHeight, z), Vector3.new(0, -Config.FallHeight * 2, 0), rayParams)
	return if hit then hit.Position.Y else 0
end

local function now(): number
	return workspace:GetServerTimeNow()
end

local function ageOf(part: BasePart): number
	return now() - (part:GetAttribute("Born") :: number)
end

local function setLook(part: BasePart, age: number)
	local _, hex, hot = Config.freshness(age)
	local color = Color3.fromHex(hex)
	if part.Color ~= color then
		part.Color = color
		part.Material = if hot then Enum.Material.Neon else Enum.Material.Basalt
	end
end

local function clearCarried(player: Player)
	for _, part in carried[player] or {} do
		part:Destroy() -- D12: a knockout loses everything you carry
	end
	carried[player] = nil
end

local function pickup(player: Player, part: BasePart)
	if part.Parent ~= debrisFolder or part:GetAttribute("Carrier") then
		return
	end
	local char = player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart") :: BasePart?
	local humanoid = char and char:FindFirstChildOfClass("Humanoid")
	if not root or not humanoid or humanoid.Health <= 0 then
		return
	end
	if (root.Position - part.Position).Magnitude > Config.PickupRange then
		return
	end

	local list = carried[player] or {}
	local kind = part:GetAttribute("Kind")
	local holdingChunk = list[1] ~= nil and list[1]:GetAttribute("Kind") == "Chunk"
	if kind == "Chunk" and #list > 0 then
		return -- a chunk needs both hands
	end
	if kind == "Pebble" and (holdingChunk or #list >= Config.PebbleCarry) then
		return
	end

	part:SetAttribute("Carrier", player.UserId)
	local prompt = part:FindFirstChildOfClass("ProximityPrompt")
	if prompt then
		prompt.Enabled = false
	end
	part.Anchored = false
	part.CanCollide = false
	part.CanQuery = false
	part.Massless = true
	local offset = if kind == "Chunk" then CFrame.new(0, 4, 0) else CFrame.new(0, 0.2 + #list * 1.3, -1.8)
	part.CFrame = root.CFrame * offset
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = root
	weld.Part1 = part
	weld.Parent = part

	table.insert(list, part)
	carried[player] = list
	humanoid.WalkSpeed = if kind == "Chunk" then Config.ChunkWalkSpeed else Config.WalkSpeed
end

local function spawnDebris(center: Vector3, gold: boolean)
	local born = now()
	for kind, info in Config.Debris do
		for _ = 1, math.random(info.count[1], info.count[2]) do
			if #debrisFolder:GetChildren() >= Config.MaxDebris then
				return
			end
			local angle = math.random() * math.pi * 2
			local dist = math.random() * Config.ScatterRadius
			local x, z = center.X + math.cos(angle) * dist, center.Z + math.sin(angle) * dist

			local part = Instance.new("Part")
			part.Name = kind
			part.Size = Vector3.new(table.unpack(info.size)) * (0.8 + math.random() * 0.4)
			part.CFrame = CFrame.new(x, groundAt(x, z) + part.Size.Y / 2, z)
				* CFrame.Angles(math.random() * 6, math.random() * 6, math.random() * 6)
			part.Anchored = true
			part.CastShadow = false
			part:SetAttribute("Kind", kind)
			part:SetAttribute("Born", born)
			part:SetAttribute("Gold", gold)
			setLook(part, 0)
			if gold then
				Instance.new("Sparkles").Parent = part
			end

			local prompt = Instance.new("ProximityPrompt")
			prompt.ActionText = "Pick up"
			prompt.ObjectText = if gold then "Gold " .. kind else kind
			prompt.HoldDuration = 0
			prompt.MaxActivationDistance = 10
			prompt.RequiresLineOfSight = false
			prompt.Parent = part
			prompt.Triggered:Connect(function(player)
				pickup(player, part)
			end)

			part.Parent = debrisFolder
		end
	end
end

local function makePart(props: { [string]: any }): Part
	local part = Instance.new("Part")
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false
	part.CastShadow = false
	for k, v in props do
		(part :: any)[k] = v
	end
	part.Parent = workspace
	return part
end

local function spawnMeteor()
	local angle = math.random() * math.pi * 2
	local dist = Config.HQSafeRadius + math.random() * (Config.CityRadius - Config.HQSafeRadius)
	local x, z = hqPos.X + math.cos(angle) * dist, hqPos.Z + math.sin(angle) * dist
	local target = Vector3.new(x, groundAt(x, z), z)
	local gold = math.random() < Config.GoldChance

	-- Warning ring: a flat red disc that grows to the danger radius before impact.
	local ringCFrame = CFrame.new(target + Vector3.new(0, 0.15, 0)) * CFrame.Angles(0, 0, math.pi / 2)
	local ring = makePart({
		Shape = Enum.PartType.Cylinder,
		Size = Vector3.new(0.2, 2, 2),
		CFrame = ringCFrame,
		Color = Color3.fromRGB(255, 40, 40),
		Material = Enum.Material.Neon,
		Transparency = 0.35,
	})
	local d = Config.DangerRadius * 2
	TweenService:Create(ring, TweenInfo.new(Config.WarnTime, Enum.EasingStyle.Linear), { Size = Vector3.new(0.2, d, d) }):Play()

	-- The meteor itself, coming in at an angle so players can see where it's headed.
	local meteor = makePart({
		Shape = Enum.PartType.Ball,
		Size = Vector3.new(6, 6, 6),
		Position = target + Vector3.new(80, Config.FallHeight, 40),
		Color = if gold then Color3.fromRGB(255, 205, 40) else Color3.fromRGB(255, 120, 20),
		Material = Enum.Material.Neon,
	})
	local fire = Instance.new("Fire")
	fire.Size = 12
	fire.Parent = meteor
	TweenService:Create(meteor, TweenInfo.new(Config.WarnTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = target }):Play()

	task.wait(Config.WarnTime)
	ring:Destroy()
	meteor:Destroy()

	local boom = Instance.new("Explosion")
	boom.Position = target
	boom.BlastRadius = Config.DangerRadius
	boom.BlastPressure = 0
	boom.DestroyJointRadiusPercent = 0 -- visual only; knockouts are decided below
	boom.Parent = workspace
	impactFx:FireAllClients(target)

	for _, player in Players:GetPlayers() do
		local char = player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart") :: BasePart?
		local humanoid = char and char:FindFirstChildOfClass("Humanoid")
		if root and humanoid and humanoid.Health > 0 then
			local flat = Vector3.new(root.Position.X - target.X, 0, root.Position.Z - target.Z)
			if flat.Magnitude <= Config.DangerRadius then
				-- For now a knockout = reset and respawn at HQ; swap for a ragdoll + teleport in step 6 polish
				humanoid.Health = 0
			end
		end
	end

	spawnDebris(target, gold)
end

-- Selling: walk onto HQ while carrying debris. Emptying the list before any yield makes double-selling impossible.
hq.Touched:Connect(function(hit)
	local player = Players:GetPlayerFromCharacter(hit.Parent)
	local list = player and carried[player]
	if not list or #list == 0 then
		return
	end
	carried[player] = nil
	local total = 0
	for _, part in list do
		total += Config.value(part:GetAttribute("Kind"), ageOf(part), part:GetAttribute("Gold"))
		part:Destroy()
	end
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = Config.WalkSpeed
	end
	local cash = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Cash")
	if cash then
		cash.Value += total
	end
	cashPop:FireClient(player, total)
end)

Players.PlayerAdded:Connect(function(player)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	local cash = Instance.new("IntValue")
	cash.Name = "Cash"
	cash.Parent = stats
	stats.Parent = player
	-- A knockout (or reset) loses what you carry, the moment it happens.
	player.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").Died:Connect(function()
			clearCarried(player)
		end)
	end)
	player.CharacterRemoving:Connect(function()
		clearCarried(player)
	end)
end)

Players.PlayerRemoving:Connect(clearCarried)

-- Cooling: one loop for all debris. Colour changes only when a piece crosses a step.
task.spawn(function()
	while true do
		task.wait(1)
		for _, part in debrisFolder:GetChildren() do
			local age = ageOf(part)
			if age > Config.DespawnAge and not part:GetAttribute("Carrier") then
				part:Destroy()
			else
				setLook(part, age)
			end
		end
	end
end)

while true do
	task.spawn(spawnMeteor)
	task.wait(Config.MeteorInterval)
end
