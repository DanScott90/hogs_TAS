local weapon_power_Adr = 0x108160

--local p1_wAngle_Adr = 0x10F9E0
local p1_rotation_Adr = 0x109B50
local p1_position_1_Adr = 0x108CD0
local p1_position_2_Adr = 0x108CD8

local p2_rotation_Adr = 0x1089F0
local p2_position_1_Adr = 0x107B70
local p2_position_2_Adr = 0x107B78

return function()
    --local weapon_power = memory.read_s16_le(weapon_power_Adr)

    --local p1_wAngle = memory.read_s16_le(p1_wAngle_Adr)
    local p1_rotation = memory.read_s16_le(p1_rotation_Adr)
    local p1_position_1 = memory.read_s16_le(p1_position_1_Adr)
    local p1_position_2 = memory.read_s16_le(p1_position_2_Adr)

    local p2_rotation = memory.read_s16_le(p2_rotation_Adr)
    local p2_position_1 = memory.read_s16_le(p2_position_1_Adr)
    local p2_position_2 = memory.read_s16_le(p2_position_2_Adr)

    return {
        --"weapon power:"..weapon_power,
        "p1_rotation:"..p1_rotation,
        "p1_position_1:"..p1_position_1,
        "p1_position_2:"..p1_position_2,
        --"p1_wAngle:"..p1_wAngle,
        "p2_rotation:"..p2_rotation,
        "p2_position_1:"..p2_position_1,
        "p2_position_2:"..p2_position_2
    }
end