assert(loadfile("gameAddresses.lua"))()
assert(loadfile("missions/missionInfo.lua"))()

local currentTextY = 10

function displayGameInfo()
    gui.cleartext();
    currentTextY = 10

    local currentLevel = memory.read_u8(gameAddresses.general.level)
    local currentLevelInfo = getLevelInfoTable(currentLevel)
    displayText("LEVEL: "..currentLevel)

    for k, v in pairs(currentLevelInfo) do
        displayText(v)
    end
end

function getLevelInfoTable(level)
    if (level > 0 and level <= #missionInfo) then
        return missionInfo[level].getInfoTable()
    end
    return {}
end

function displayText(string)
    gui.text(10, currentTextY, string)
    currentTextY = currentTextY + 20;
end

event.onframestart(displayGameInfo)