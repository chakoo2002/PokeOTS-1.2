function onStepIn(creature, item, position, fromPosition)
local playerPosition = creature:getPosition()
local topLeftCorner = Position(998, 1012, 7)
local bottomRightCorner = Position(1078, 1064, 0)

if not playerPosition:isInRange(topLeftCorner, bottomRightCorner) then
    creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"Dalej nie polecisz.")
	creature:teleportTo(fromPosition)
end
end