Package:Require("gamemode.lua")

local suitableSpawnpoints = {
	Vector(0, 0, 100)
}

local function SpawnCharacter(player)
	local spawn = suitableSpawnpoints[math.random(#suitableSpawnpoints)]
	local character = Character(spawn, Rotator(0, 100, 0))
	player:Possess(character)
	return character
end

local function CheckRoundStart()
	local players = NanosWorld:GetPlayers()
	if #players > 0 and GM:GetCurrentState() == GM.States.WarmUp then
		local murderer = players[math.random(#players)]
		for k, ply in ipairs(players) do
			ply:SetValue("Murder", murderer == ply, true)
			SpawnCharacter(ply)
		end

		GM:SetMurder(murderer)
		GM:SetCurrentState(GM.States.Waiting)

		Timer:SetTimeout(5000, function()
			GM:SetCurrentState(GM.States.InProgress)

			return false
		end)
	end
end

Player:Subscribe("Spawn", function(ply)
	if GM:GetCurrentState() == GM.States.WarmUp then
		SpawnCharacter(ply)
		CheckRoundStart()
	end
end)

CheckRoundStart()