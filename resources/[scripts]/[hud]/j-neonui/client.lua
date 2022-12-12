CreateThread(function()
    while true do
        local s = 1000;
        local ESX = exports["es_extended"]:getSharedObject()

        TriggerEvent('esx_status:getStatus', 'hunger', function(status) 
            hunger = status.val / 10000 
        end)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status) 
            thirst = status.val / 10000 
        end)

        SendNUIMessage({
            action  = ("updateStatusHUD");
            whenUse = (Config.WhenUse);
            useLogo = (Config.UseLogo);
            logo    = (Config.LogoURL);
            health  = (GetEntityHealth(PlayerPedId()) - 100);
            shield  = (GetPedArmour(PlayerPedId()));
            hunger  = (hunger);
            thirst  = (thirst);
        })

        if IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({inVeh = true})
            DisplayRadar(true)
        else
            SendNUIMessage({inVeh = false})
            DisplayRadar(false)
        end

        Wait(s)
    end
end)

-- Cinematic Mode

local cinMa = nil

RegisterCommand("cinematicMode", function()
    cinMa = not cinMa

    if (cinMa) then
        radar = false
        cinMa = true;
    elseif not (cinMa) then 
        radar = false
        cinMa = false;
    elseif IsPedInAnyVehicle(PlayerPedId()) then 
        radar = true
    elseif not IsPedInAnyVehicle(PlayerPedId()) then
        radar = false
    end

    DisplayRadar(radar)
    SendNUIMessage({cinemaMode = cinMa})
end)


if Config.whenKey then
    RegisterKeyMapping("cinematicMode", "Cinematic Mode", "keyboard", "INSERT") -- Dale al insert y ves el modo cine
end