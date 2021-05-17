assert(loadfile("../gameAddresses.lua"))()

local function getRange(from, to, increment)
    local values={}
    for value=math.min(from, to),math.max(from, to),math.abs(increment) do
        values[#values+1]= value
    end
    if (#values == 0) then
        values[#values+1]= from
    end
    return values
end

local function getPositions(from1, to1, from2, to2, increment1, increment2)
    local positions={}
    local range1 = getRange(from1, to1, increment1)
    local range2 = getRange(from2, to2, increment2)
    for kR1, pos1 in pairs(range1) do
        for kR2, pos2 in pairs(range2) do
            positions[#positions+1]= { pos1, pos2 }
        end
    end
    return positions
end

local startPositions = getPositions(-7819, -7819,  -6555, -6555, 5, 5)
local startRotations = getRange(2408, 2415, 1)
local delayFrames = getRange(0, 20, 1)
--delayFrames 6, 19, 20 seems to work
--delayFrames = {6, 19, 20}

console.log("Complexity: " .. #startPositions * #startRotations * #delayFrames)
console.log("#startPositions: " .. #startPositions)
console.log("#startRotations: " .. #startRotations)
console.log("#delayFrames: " .. #delayFrames)

local waitTntFrames = 65
local backLefts = 42
local postTntLefts = 17
local forwardLefts = 66
local postTntUps = 69

for kStart, startPosition in pairs(startPositions) do
    for kStartRot, startRotation in pairs(startRotations) do
        for kStartRot, numDelayFrames in pairs(delayFrames) do
            savestate.load("SaveStates/Mission2Tnt.State")

            for i=1,numDelayFrames do emu.frameadvance() end

            console.log("");
            console.log("numDelayFrames:"..numDelayFrames);
            console.log("start rotation:"..startRotation);
            console.log("start position:"..startPosition[1].." "..startPosition[2]);

            --SetToTntPos
            memory.write_s16_le(gameAddresses.mission2.p1_rotation, startRotation)
            memory.write_s16_le(gameAddresses.mission2.p1_position_1, startPosition[1])
            memory.write_s16_le(gameAddresses.mission2.p1_position_2, startPosition[2])
            emu.frameadvance()

            --DropTnt
            joypad.set({Cross=true}, 1)
            emu.frameadvance()
            joypad.set({Cross=true}, 1)
            emu.frameadvance()
            for i=1,waitTntFrames do emu.frameadvance() end

            --Walk Past Enemy
            for i=1,backLefts do
                joypad.set({Down=true, Left=true}, 1)
                emu.frameadvance()
            end
            for i=1,postTntLefts do
                joypad.set({Left=true}, 1)
                emu.frameadvance()
            end
            for i=1,forwardLefts do
                joypad.set({Up=true, Left=true}, 1)
                emu.frameadvance()
            end
            for i=1,postTntUps do
                joypad.set({Up=true}, 1)
                emu.frameadvance()
            end
            for i=1,2 do
                joypad.set({Up=true, Square=true}, 1)
                emu.frameadvance()
            end

            for i=1,1300 do emu.frameadvance() end
        end
    end
end
