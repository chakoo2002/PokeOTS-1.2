function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local split = param:split("'")
	local position = player:getPosition()
	
	if not split[1] then
	player:sendCancelMessage("need code number")
		return false		
	end
	
	player:sendExtendedOpcode(split[1], split[2])

	return true
end