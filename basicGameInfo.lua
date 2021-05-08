local mission1 = assert(loadfile("missions/mission1.lua"))()
local mission2 = assert(loadfile("missions/mission2.lua"))()
--local mission3 = assert(loadfile("missions/mission3.lua"))()
--local mission4 = assert(loadfile("missions/mission4.lua"))()
--local mission5 = assert(loadfile("missions/mission5.lua"))()
--local mission6 = assert(loadfile("missions/mission6.lua"))()
--local mission7 = assert(loadfile("missions/mission7.lua"))()
--local mission8 = assert(loadfile("missions/mission8.lua"))()
--local mission9 = assert(loadfile("missions/mission9.lua"))()
--local mission10 = assert(loadfile("missions/mission10.lua"))()
--local mission11 = assert(loadfile("missions/mission11.lua"))()
--local mission12 = assert(loadfile("missions/mission12.lua"))()
--local mission13 = assert(loadfile("missions/mission13.lua"))()
--local mission14 = assert(loadfile("missions/mission14.lua"))()
--local mission15 = assert(loadfile("missions/mission15.lua"))()
--local mission16 = assert(loadfile("missions/mission16.lua"))()
--local mission17 = assert(loadfile("missions/mission17.lua"))()
--local mission18 = assert(loadfile("missions/mission18.lua"))()
--local mission19 = assert(loadfile("missions/mission19.lua"))()
--local mission20 = assert(loadfile("missions/mission20.lua"))()
--local mission21 = assert(loadfile("missions/mission21.lua"))()
--local mission22 = assert(loadfile("missions/mission22.lua"))()
--local mission23 = assert(loadfile("missions/mission23.lua"))()
--local mission24 = assert(loadfile("missions/mission24.lua"))()
--local mission25 = assert(loadfile("missions/mission25.lua"))()

local level_Adr = 0x02B5D1
local textY = 10
local currentLevel = 0

function displayGameInfo()
    gui.cleartext();
    textY = 10

    currentLevel = memory.read_u8(level_Adr)
    displayText("LEVEL: "..currentLevel)

    for k, v in pairs(getCurrentInfoTable()) do
        displayText(v)
    end
end

function getCurrentInfoTable()
    if currentLevel == 1 then return mission1()
    elseif currentLevel == 2 then return mission2()
    else return {}
    end
end

function displayText(string)
    gui.text(10, textY, string)
    textY = textY + 20;
end

event.onframestart(displayGameInfo)