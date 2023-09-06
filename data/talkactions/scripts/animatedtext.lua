function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local split = param:split(",")
	local position = player:getPosition()
	
	if not split[1] then
	player:sendCancelMessage("need text")
		return false		
	end
	
	if not split[2] then
	player:sendCancelMessage("need color")
		return false		
	end
	
	if not split[3] then
	player:sendCancelMessage("need font")
		return false		
	end
	
	Game.sendAnimatedText(position, split[1], split[2], split[3])

	return true
end