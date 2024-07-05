local playerPosition = {
	{x = 1393, y = 1293, z = 11},
	{x = 1392, y = 1293, z = 11},
	{x = 1391, y = 1293, z = 11},
	{x = 1390, y = 1293, z = 11}
}
local newPosition = {
	{x = 1410, y = 1294, z = 11},
	{x = 1409, y = 1294, z = 11},
	{x = 1408, y = 1294, z = 11},
	{x = 1407, y = 1294, z = 11}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9826 then
		local players = {}
		for _, position in ipairs(playerPosition) do
			local topPlayer = Tile(position):getTopCreature()
			if not topPlayer or not topPlayer:isPlayer() or topPlayer:getLevel() < 100 or topPlayer:getStorageValue(30015) ~= -1 then
				player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
				return false
			end
			players[#players + 1] = topPlayer
		end

		for i, targetPlayer in ipairs(players) do
			Position(playerPosition[i]):sendMagicEffect(CONST_ME_POFF)
			targetPlayer:teleportTo(newPosition[i], false)
			targetPlayer:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
		end
		item:transform(1946)
	elseif item.itemid == 1946 then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	end
	return true
end
