local general = {}
general.level = 0x02B5D1

local mission1 = {}
mission1.weapon_power = 0x108160
mission1.p1_wAngle = 0x10F9E0
mission1.p1_rotation = 0x10F818
mission1.p1_position_1 = 0x10E998
mission1.p1_position_2 = 0x10E9A0
mission1.p2_position_1 = 0x10D838
mission1.p2_position_2 = 0x10D840
mission1.p3_position_1 = 0x10C6D8
mission1.p3_position_2 = 0x10C6E0

local mission2 = {}
mission2.p1_rotation = 0x109B50
mission2.p1_position_1 = 0x108CD0
mission2.p1_position_2 = 0x108CD8
mission2.p2_rotation = 0x1089F0
mission2.p2_position_1 = 0x107B70
mission2.p2_position_2 = 0x107B78

gameAddresses = {}
gameAddresses.general = general
gameAddresses.mission1 = mission1
gameAddresses.mission2 = mission2

return gameAddresses