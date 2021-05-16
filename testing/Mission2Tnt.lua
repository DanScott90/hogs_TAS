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

local restPositions = getPositions(-4556, -4556, -5077, -5077, 5, 5)
local startPositions = getPositions(-7819, -7819,  -6555, -6555, 5, 5)
local startRotations = getRange(2412, 2412, 5)
local delayFrames = getRange(4, 50, 1)
--delayFrames 4, 11, 23, 24, 28, 34, 38, 43 seem to be successful with current savestate, can uncomment below (remove --)
--delayFrames = {4, 11, 23, 24, 28, 34, 38, 43}

console.log("Complexity: " .. #restPositions * #startPositions * #startRotations * #delayFrames)
console.log("#restPositions: " .. #restPositions)
console.log("#startPositions: " .. #startPositions)
console.log("#startRotations: " .. #startRotations)
console.log("#delayFrames: " .. #delayFrames)

for kReset, restPosition in pairs(restPositions) do
    for kStart, startPosition in pairs(startPositions) do
        for kStartRot, startRotation in pairs(startRotations) do
            for kStartRot, numDelayFrames in pairs(delayFrames) do
                savestate.load("SaveStates/Mission2Tnt.State")

                for i=1,numDelayFrames do emu.frameadvance() end

                console.log("");
                console.log("numDelayFrames:"..numDelayFrames);
                console.log("start rotation:"..startRotation);
                console.log("start position:"..startPosition[1].." "..startPosition[2]);
                console.log("rest position:"..restPosition[1].." "..restPosition[2]);

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
                for i=1,90 do emu.frameadvance() end
                --
                --Walk Past Enemy
                memory.write_s16_le(gameAddresses.mission2.p1_rotation, 792)
                memory.write_s16_le(gameAddresses.mission2.p1_position_1, -7368)
                memory.write_s16_le(gameAddresses.mission2.p1_position_2, -6323)
                for i=1,90 do emu.frameadvance() end

                --SetToRestPos
                memory.write_s16_le(gameAddresses.mission2.p1_rotation, 836)
                memory.write_s16_le(gameAddresses.mission2.p1_position_1, restPosition[1])
                memory.write_s16_le(gameAddresses.mission2.p1_position_2, restPosition[2])
                emu.frameadvance()

                --Move Back and Forward to get valid height
                joypad.set({Down=true}, 1)
                emu.frameadvance()
                joypad.set({Down=true}, 1)
                emu.frameadvance()
                joypad.set({Up=true}, 1)
                emu.frameadvance()
                joypad.set({Up=true}, 1)
                emu.frameadvance()

                --SetBackToRestPos
                memory.write_s16_le(gameAddresses.mission2.p1_rotation, 636)
                memory.write_s16_le(gameAddresses.mission2.p1_position_1, restPosition[1])
                memory.write_s16_le(gameAddresses.mission2.p1_position_2, restPosition[2])
                emu.frameadvance()

                for i=1,1300 do emu.frameadvance() end
            end
        end
    end
end
