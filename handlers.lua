-- CREDITS TO QBX_HUD FOR STRESS SYSTEM

local function isWhitelistedWeaponStress(weapon)
    if weapon then
        for _, v in pairs(Config.Stress.whitelistedWeapons) do
            if weapon == v then
                return true
            end
        end
    end
    return false
end

local function startWeaponStressThread(weapon)
    if isWhitelistedWeaponStress(weapon) then return end
    hasWeapon = true

    CreateThread(function()
        while hasWeapon do
            if IsPedShooting(cache.ped) then
                if math.random() <= Config.Stress.chance then
                    TriggerServerEvent('hud:server:GainStress', math.random(1, 5))
                end
            end
            Wait(0)
        end
    end)
end

AddEventHandler('ox_inventory:currentWeapon', function(currentWeapon)
    hasWeapon = false
    Wait(0)

    if not currentWeapon then return end

    startWeaponStressThread(currentWeapon.hash)
end)