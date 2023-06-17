local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-detector:weaponcheck', function(source, cb, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weap = Config.Weapons

    if Player ~= nil then
        for k, v in pairs(weap) do
            if Player.Functions.GetItemByName(v) then
                cb(true)
                return
            end
        end
    end

    cb(false)
end)

local resourceName = GetCurrentResourceName()

-- Function to print a formatted message to the TXAdmin console
local function PrintToTXAdminConsole(message)
    local separator = string.rep("-", 80)
    local header = "[script:" .. resourceName .. "]"
    local brandHeader = [[
  _____   _                _                        _____                       _               
  |_   _| | |__     ___    | |      _   _  __  __   | ____|  _ __ ___    _ __   (_)  _ __    ___ 
    | |   | '_ \   / _ \   | |     | | | | \ \/ /   |  _|   | '_ ` _ \  | '_ \  | | | '__|  / _ \
    | |   | | | | |  __/   | |___  | |_| |  >  <    | |___  | | | | | | | |_) | | | | |    |  __/
    |_|   |_| |_|  \___|   |_____|  \__,_| /_/\_\   |_____| |_| |_| |_| | .__/  |_| |_|     \___|
                                                                        |_|                      
    ]]
    local formattedMessage = "\n" .. message .. "\n"

    print(separator)
    print(header)
    print(brandHeader)
    print(formattedMessage)
    print(separator)
end

-- Example usage
local message = "Welcome to The Lux Empire!"
PrintToTXAdminConsole(message)