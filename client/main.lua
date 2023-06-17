local QBCore = exports['qb-core']:GetCoreObject()
local DetectorActive = false

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for q, r in pairs(Config.Detectors) do
            local distanceCheck = #(pedCoords - vector3(r.x, r.y, r.z))
            if distanceCheck <= Config.Detectdistance then
                QBCore.Functions.TriggerCallback('qb-detector:weaponcheck', function(cb)
                    if cb then
                        if not DetectorActive then
                            DetectorActive = true
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", Config.InteractSoundAlertDist, Config.InteractSoundAlert, Config.InteractSoundAlertVol)
                            if Config.TNotify then
                                exports['t-notify']:Alert({ style = 'error', message = Config.DetectorActMessage, duration = 3000 })
                            else
                                QBCore.Functions.Notify(Config.DetectorActMessage, 'error', 3000)
                            end
                        end
                    end
                end)
            end
        end

        if DetectorActive then
            Citizen.Wait(Config.DetectorReChecks)
            DetectorActive = false
        else
            Citizen.Wait(Config.DetectorReChecks)
        end

        Citizen.Wait(500)
    end
end)
