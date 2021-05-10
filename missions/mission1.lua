assert(loadfile("gameAddresses.lua"))()

local missionInfo = {}

missionInfo.getInfoTable = function()
local weapon_power = memory.read_s16_le(gameAddresses.mission1.weapon_power)

local p1_wAngle = memory.read_s16_le(gameAddresses.mission1.p1_wAngle)
local p1_rotation = memory.read_s16_le(gameAddresses.mission1.p1_rotation)
local p1_position_1 = memory.read_s16_le(gameAddresses.mission1.p1_position_1)
local p1_position_2 = memory.read_s16_le(gameAddresses.mission1.p1_position_2)

local p2_position_1 = memory.read_s16_le(gameAddresses.mission1.p2_position_1)
local p2_position_2 = memory.read_s16_le(gameAddresses.mission1.p2_position_2)

local p3_position_1 = memory.read_s16_le(gameAddresses.mission1.p3_position_1)
local p3_position_2 = memory.read_s16_le(gameAddresses.mission1.p3_position_2)

return {
    "weapon power:"..weapon_power,
    "p1_rotation:"..p1_rotation,
    "p1_position_1:"..p1_position_1,
    "p1_position_2:"..p1_position_2,
    "p1_wAngle:"..p1_wAngle,
    "p2_position_1:"..p2_position_1,
    "p2_position_2:"..p2_position_2,
    "p3_position_1:"..p3_position_1,
    "p3_position_2:"..p3_position_2
}
end

return missionInfo