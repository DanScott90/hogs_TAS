assert(loadfile("gameAddresses.lua"))()

local missionInfo = {}

missionInfo.getInfoTable = function()
    local p1_rotation = memory.read_s16_le(gameAddresses.mission2.p1_rotation)
    local p1_position_1 = memory.read_s16_le(gameAddresses.mission2.p1_position_1)
    local p1_position_2 = memory.read_s16_le(gameAddresses.mission2.p1_position_2)

    local p2_rotation = memory.read_s16_le(gameAddresses.mission2.p2_rotation)
    local p2_position_1 = memory.read_s16_le(gameAddresses.mission2.p2_position_1)
    local p2_position_2 = memory.read_s16_le(gameAddresses.mission2.p2_position_2)

    return {
        "p1_rotation:"..p1_rotation,
        "p1_position_1:"..p1_position_1,
        "p1_position_2:"..p1_position_2,
        "p2_rotation:"..p2_rotation,
        "p2_position_1:"..p2_position_1,
        "p2_position_2:"..p2_position_2
    }
end

return missionInfo