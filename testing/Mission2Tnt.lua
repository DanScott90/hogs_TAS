assert(loadfile("../gameAddresses.lua"))()

local positions = {}
local position1From = -4620
local position1To = -4580
local position2From = -5120
local position2To = -5080

for pos1=position1From,position1To do
    for pos2=position2From,position2To do
        positions[#positions+1]= { pos1, pos2 }
    end
end

for k, position in pairs(positions) do
    savestate.load("SaveStates/Mission2Tnt.State")

    --SetToTntPos
    memory.write_s16_le(gameAddresses.mission2.p1_rotation, 2610)
    memory.write_s16_le(gameAddresses.mission2.p1_position_1, -7908)
    memory.write_s16_le(gameAddresses.mission2.p1_position_2, -6531)
    emu.frameadvance()

    --DropTnt
    joypad.set({Cross=true}, 1)
    emu.frameadvance()
    joypad.set({Cross=true}, 1)
    emu.frameadvance()
    joypad.set({Cross=false}, 1)
    for i=1,90 do emu.frameadvance() end
    --
    --Walk Past Enemy
    memory.write_s16_le(gameAddresses.mission2.p1_rotation, 792)
    memory.write_s16_le(gameAddresses.mission2.p1_position_1, -7368)
    memory.write_s16_le(gameAddresses.mission2.p1_position_2, -6323)
    for i=1,90 do emu.frameadvance() end

    --SetToRestPos
    memory.write_s16_le(gameAddresses.mission2.p1_rotation, 836)
    memory.write_s16_le(gameAddresses.mission2.p1_position_1, position[1])
    memory.write_s16_le(gameAddresses.mission2.p1_position_2, position[2])

    for i=1,1200 do emu.frameadvance() end
end
