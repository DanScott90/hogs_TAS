local weapon_power_Adr = 0x108160

local p1_wAngle_Adr = 0x10F9E0
local p1_rotation_Adr = 0x10F818
local p1_position_1_Adr = 0x10E998
local p1_position_2_Adr = 0x10E9A0

local p2_position_1_Adr = 0x10D838
local p2_position_2_Adr = 0x10D840

local p3_position_1_Adr = 0x10C6D8
local p3_position_2_Adr = 0x10C6E0

return function()
    local weapon_power = memory.read_s16_le(weapon_power_Adr)

    local p1_rotation = memory.read_s16_le(p1_rotation_Adr)
    local p1_wAngle = memory.read_s16_le(p1_wAngle_Adr)
    local p1_position_1 = memory.read_s16_le(p1_position_1_Adr)
    local p1_position_2 = memory.read_s16_le(p1_position_2_Adr)

    local p2_position_1 = memory.read_s16_le(p2_position_1_Adr)
    local p2_position_2 = memory.read_s16_le(p2_position_2_Adr)

    local p3_position_1 = memory.read_s16_le(p3_position_1_Adr)
    local p3_position_2 = memory.read_s16_le(p3_position_2_Adr)

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