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
                                                                                                                              
888888888888  88                          88                                       88888888888                                   88                          
     88       88                          88                                       88                                            ""                          
     88       88                          88                                       88                                                                        
     88       88,dPPYba,    ,adPPYba,     88          88       88  8b,     ,d8     88aaaaa      88,dPYba,,adPYba,   8b,dPPYba,   88  8b,dPPYba,   ,adPPYba,  
     88       88P'    "8a  a8P_____88     88          88       88   `Y8, ,8P'      88"""""      88P'   "88"    "8a  88P'    "8a  88  88P'   "Y8  a8P_____88  
     88       88       88  8PP"""""""     88          88       88     )888(        88           88      88      88  88       d8  88  88          8PP"""""""  
     88       88       88  "8b,   ,aa     88          "8a,   ,a88   ,d8" "8b,      88           88      88      88  88b,   ,a8"  88  88          "8b,   ,aa  
     88       88       88   `"Ybbd8"'     88888888888  `"YbbdP'Y8  8P'     `Y8     88888888888  88      88      88  88`YbbdP"'   88  88           `"Ybbd8"'  
                                                                                                                    88                                       
                                                                                                                    88                                       
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