function onExtendedOpcode(player, opcode, buffer)
	if opcode == 105 then
		local json_status, json_data = pcall(
			function()
				return json.decode(buffer)  -- Attempt to decode JSON from 'buffer'
			end
		)

		-- Check if JSON decoding was successful or not
		if not json_status then
			-- If there's an error, log the error message and return
			g_logger.error("[My Module] JSON error: " .. json_data)
			return
		end	

		local jsonData = json.decode(buffer)
		local jsonNewData = {
			x = jsonData[1],
			y = jsonData[2],
			z = jsonData[3],
			[4] = jsonData[4]
		}

		local Thing = player:internalGetThing(jsonNewData)
		local myRealId = Thing.getRealUID(Thing)
		local myItem = Game.getItemByRUID(myRealId)
		
		local id = myItem:getId()
		local nazwa = myItem:getName(myItem)

		local json_data =	{
			action = "new",
			data = {
				uid = myRealId,
				itemName = nazwa
			}
		}

		player:sendExtendedOpcode(105, json.encode(json_data))
	end
end