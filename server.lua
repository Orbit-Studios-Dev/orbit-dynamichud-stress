local resetStress = false
-- CREDITS TO QBX_HUD FOR STRESS SYSTEM
local function isPlayerWhitelisted(player)
    local whitelist = Config.Stress.whitelistedJobs
    if #whitelist == 0 then return false end
    for _, job in ipairs(whitelist) do
        if player.job and player.job.name == job then
            return true
        end
    end
    return false
end

RegisterNetEvent('hud:server:GainStress', function(amount)
    if not Config.Stress.enable then return end

    local src = source
    local player = exports['orbit-lib']:GetPlayer(src)
    local newStress
    if isPlayerWhitelisted(player.PlayerData) then
        -- Player is whitelisted
        return
    end
    if not resetStress then
        if not player.PlayerData.metadata.stress then
            player.PlayerData.metadata.stress = 0
        end
        newStress = player.PlayerData.metadata.stress + amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    -- exports.qbx_core:Notify(src, locale('notify.stress_gain'), 'inform', 2500, nil, nil, {'#141517', '#ffffff'}, 'brain', '#C53030')
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    if not Config.Stress.enable then return end

    local src = source
    local player = exports['orbit-lib']:GetPlayer(src)
    local newStress
    if not player then return end
    if not resetStress then
        if not player.PlayerData.metadata.stress then
            player.PlayerData.metadata.stress = 0
        end
        newStress = player.PlayerData.metadata.stress - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    -- exports.qbx_core:Notify(src, locale('notify.stress_removed'), 'inform', 2500, nil, nil, {'#141517', '#ffffff'}, 'brain', '#0F52BA')
end)