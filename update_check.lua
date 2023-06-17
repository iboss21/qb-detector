local currentVersion = '1.1.0' -- Change this to your current version
local resourceName = GetCurrentResourceName() -- Retrieves the name of the currently executing resource

PerformHttpRequest('https://raw.githubusercontent.com/iBoss21/QB-Detectors/main/version.txt', function(errorCode, resultData, resultHeaders)
    if errorCode == 200 then
        local remoteVersion = tostring(resultData)
        if currentVersion ~= remoteVersion then
            -- Trigger an event or notify the players about the update
            TriggerEvent('qb-detect:updateAvailable', remoteVersion)
        else
            -- The resource is up to date
            TriggerEvent('qb-detect:updateUpToDate', currentVersion)
        end
    else
        -- Failed to check for updates
        TriggerEvent('qb-detect:updateError', errorCode)
    end
end, 'GET', '', {})
