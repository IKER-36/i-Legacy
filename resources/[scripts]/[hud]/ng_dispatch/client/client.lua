local calls = {}
local callnum = 0
local totalcalls = 0
local config = false
local showed = false
local PlayerData = {}
local bigrambo = {}
local nofilterquick = {}
local wackytequiero = {}
local activated = true

ESX = nil 

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
    calls = {}
    callnum = 0
    totalcalls = 0
    SendNUIMessage({
        show = false;
        content = "No alerts";
        callnum = 0;
        totalcalls = 0;
        closeConfigMenu = true;
        newalert = false;
    })
    SetNuiFocus(false, false)
    showed = false
end)

RegisterCommand("showalerts", function()
    if PlayerData.job and PlayerData.job.name == 'police' then
        if not showed then
            if checkTable(calls) then
                SendNUIMessage({
                    show = true;
                    job = "SAPD";
                    alert_type = "red";
                })
                showed = true
            else
                SendNUIMessage({
                    show = true;
                    job = "SAPD";
                })
                showed = true
            end
        else
            SendNUIMessage({
                show = false;
            })
            showed = false
        end
    end

    if PlayerData.job and PlayerData.job.name == 'ambulance' then
        if not showed then
            if checkTable(calls) then
                SendNUIMessage({
                    show = true;
                    job = "SAFD";
                    alert_type = "white";
                })
                showed = true
            else
                SendNUIMessage({
                    show = true;
                    job = "SAFD";
                    alert_type = "white";
                })
                showed = true
            end
        else
            SendNUIMessage({
                show = false;
            })
            showed = false
        end
    end

    if PlayerData.job and PlayerData.job.name == 'mechanic' then
        if not showed then
            if checkTable(calls) then
                SendNUIMessage({
                    show = true;
                    job = "MECH";
                    alert_type = "white";
                })
                showed = true
            else
                SendNUIMessage({
                    show = true;
                    job = "MECH";
                    alert_type = "white";
                })
                showed = true
            end
        else
            SendNUIMessage({
                show = false;
            })
            showed = false
        end
    end

    if PlayerData.job and PlayerData.job.name == 'taxi' then
        if not showed then
            if checkTable(calls) then
                SendNUIMessage({
                    show = true;
                    job = "TAXI";
                    alert_type = "white";
                })
                showed = true
            else
                SendNUIMessage({
                    show = true;
                    job = "TAXI";
                    alert_type = "white";
                })
                showed = true
            end
        else
            SendNUIMessage({
                show = false;
            })
            showed = false
        end
    end

end, false)

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Citizen.Wait(2000)
        SendNUIMessage({
            callnum = 0;
        })
    end
end)

RegisterNetEvent("ng_dispatch:alertToClient")
AddEventHandler("ng_dispatch:alertToClient", function(text, coords, id)
    if PlayerData.job and PlayerData.job.name == 'police' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local distanceToAlert = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords)
        local finalDistanceTo = ESX.Math.Round(ESX.Math.Round(distanceToAlert, 1) * 0.001, 1)
        local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(coords)))
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newalert = true;
            id = id;
            distance = "" .. finalDistanceTo;
            street = "" .. street;
            alert_type = "yellow";
            
        })
        table.insert(calls, {text = text, coords = coords})
    end
end)

RegisterNetEvent("ng_dispatch:vehToClient")
AddEventHandler("ng_dispatch:vehToClient", function(coords, model, color, id)
    if PlayerData.job and PlayerData.job.name == 'police' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local distanceToAlert = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords)
        local finalDistanceTo = ESX.Math.Round(ESX.Math.Round(distanceToAlert, 1) * 0.001, 1)
        local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(coords)))
        if Config.enableVehiclePics then
            SendNUIMessage({
                content = "Un hombre ha robado un modelo de vehículo " ..model.. " de color "..colorssss;
                callnum = callnum;
                totalcalls = totalcalls;
                pic = true;
                model = model;
                newalert = true;
                id = id;
                distance = "" .. finalDistanceTo;
                street = "" .. street;
                alert_type = "yellow";
            })
            table.insert(calls, {text = "Un hombre ha robado un modelo de vehículo " ..model.. " de color "..color, coords = coords})
        else
            SendNUIMessage({
                content = "Un hombre ha robado un modelo de vehículo " ..model;
                callnum = callnum;
                totalcalls = totalcalls;
                newalert = true;
                id = id;
                distance = "" .. finalDistanceTo;
                street = "" .. street;
                alert_type = "yellow";
            })
            table.insert(calls, {text = "Un hombre ha robado un modelo de vehículo " ..model.. " de color "..color, coords = coords})
        end
    end
end)

RegisterCommand("auxilio", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    TriggerServerEvent("ng_dispatch:sendAmbuAlert", text, coords, id)
end, false)

RegisterCommand("meca", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    TriggerServerEvent("ng_dispatch:sendMecaAlert", text, coords, id)
end, false)

RegisterCommand("pedirtaxi", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    TriggerServerEvent("ng_dispatch:sendTaxiaAlert", text, coords, id)
end, false)

RegisterNetEvent("ng_dispatch:auxToClient")
AddEventHandler("ng_dispatch:auxToClient", function(text, coords, id)
    if PlayerData.job and PlayerData.job.name == 'ambulance' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local distanceToAlert = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords)
        local finalDistanceTo = ESX.Math.Round(ESX.Math.Round(distanceToAlert, 1) * 0.001, 1)
        local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(coords)))
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newambualert = true;
            newalert = true;
            id = id;
            distance = "" .. finalDistanceTo;
            street = "" .. street;
            alert_type = "yellow";
        })
        table.insert(calls, {text = text, coords = coords})
    end
    
end)
RegisterNetEvent("ng_dispatch:taxiToClient")
AddEventHandler("ng_dispatch:taxiToClient", function(text, coords, id)
    if PlayerData.job and PlayerData.job.name == 'taxi' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local distanceToAlert = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords)
        local finalDistanceTo = ESX.Math.Round(ESX.Math.Round(distanceToAlert, 1) * 0.001, 1)
        local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(coords)))
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newtaxialert = true;
            newalert = true;
            id = id;
            distance = "" .. finalDistanceTo;
            street = "" .. street;
            alert_type = "yellow";
            
        })
        table.insert(calls, {text = text, coords = coords})
    end
    
end)


RegisterNetEvent("ng_dispatch:mecaToClient")
AddEventHandler("ng_dispatch:mecaToClient", function(text, coords, id)
    if PlayerData.job and PlayerData.job.name == 'mechanic' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local distanceToAlert = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords)
        local finalDistanceTo = ESX.Math.Round(ESX.Math.Round(distanceToAlert, 1) * 0.001, 1)
        local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(coords)))
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newmecaalert = true;
            newalert = true;
            id = id;
            distance = "" .. finalDistanceTo;
            street = "" .. street;
            alert_type = "yellow";
        })
        table.insert(calls, {text = text, coords = coords})
    end
    
end)


RegisterNetEvent("ng_dispatch:robberyToClient")
AddEventHandler("ng_dispatch:robberyToClient", function(type, coords, id)
    if PlayerData.job and PlayerData.job.name == 'police' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        if Config.enableRobberyPics then
            if type == "247" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un 24/7, ¡por favor venga!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = 247;
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un 24/7, ¡por favor venga!", coords = coords, model = 247})
            elseif type == "vangelico" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en la joyería, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "vangelico";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "Ha saltado una alarma en la joyería, ¡venga, por favor!", coords = coords, model = "vangelico"})
            elseif type == "ammunation" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en una AmmuNation, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "ammunation";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "Ha saltado una alarma en una AmmuNation, ¡venga, por favor!", coords = coords, model = "ammunation"})
            elseif type == "fleeca" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en un Fleeca, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "fleeca";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "Ha saltado una alarma en un Fleeca, ¡venga, por favor!", coords = coords, model = "fleeca"})
            elseif type == "humane" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en los Laboratorios Humane, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "humane";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "Ha saltado una alarma en los Laboratorios Humane, ¡venga, por favor!", coords = coords, model = "humane"})
            elseif type == "pacific" then
                SendNUIMessage({
                    content = "Ha sonado una alarma en el Pacific Standard, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "pacific";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "Ha sonado una alarma en el Pacific Standard, ¡venga, por favor!", coords = coords, model = "pacific"})
            end
        else
            if type == "247" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un 24/7, ¡por favor venga!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un 24/7, ¡por favor venga!", coords = coords})
            elseif type == "vangelico" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en la joyería, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "Ha saltado una alarma en la joyería, ¡venga, por favor!", coords = coords})
            elseif type == "ammunation" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en una AmmuNation, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "Ha saltado una alarma en una AmmuNation, ¡venga, por favor!", coords = coords})
            elseif type == "fleeca" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en un Fleeca, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "Ha saltado una alarma en un Fleeca, ¡venga, por favor!", coords = coords})
            elseif type == "humane" then
                SendNUIMessage({
                    content = "Ha saltado una alarma en los Laboratorios Humane, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "Ha saltado una alarma en los Laboratorios Humane, ¡venga, por favor!", coords = coords})
            elseif type == "pacific" then
                SendNUIMessage({
                    content = "Ha sonado una alarma en el Pacific Standard, ¡venga, por favor!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "Ha sonado una alarma en el Pacific Standard, ¡venga, por favor!", coords = coords})
            end
        end
    end
end)

RegisterCommand("forzar", function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        local coords = GetEntityCoords(PlayerPedId())
        local id = GetPlayerServerId(PlayerId())
        local color = GetVehicleColor(vehicle)
        local klk = tostring(color)
        local finalColor = Config.Colors[klk]
        TriggerServerEvent("ng_dispatch:sendVehRob", coords, model, finalColor, id)
    end
end, false)

-- Added by Jaareet

local function KickPlayer()
    ESX.TriggerServerCallback('kickPlayer', function() end)
    return
end

RegisterCommand("entorno", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    if (not text:match('<style>')) then
        if (not text:match('</style>')) then
            if (not text:match('<div>')) then
                if (not text:match('</div>')) then
                    TriggerServerEvent("ng_dispatch:sendAlert", text, coords, id)
                else
                    KickPlayer()
                end
            else
                KickPlayer()
            end
        else
            KickPlayer()
        end
    else
        KickPlayer()
    end
end, false)

RegisterCommand("right", function()
    if calls[callnum + 1] ~= nil then
        local num = callnum + 1
        if calls[callnum + 1]['model'] ~= nil then
            SendNUIMessage({
                content = calls[callnum + 1]['text'];
                callnum = num;
                right = true;
                pic = true;
                model = calls[callnum + 1]['model'];
            })
        else
            SendNUIMessage({
                content = calls[callnum + 1]['text'];
                callnum = num;
                right = true;
            })
        end
        callnum = callnum + 1 
    end
end, false)

RegisterCommand("left", function()
    if calls[callnum - 1] ~= nil then
        local num = callnum - 1
        if calls[callnum - 1]['model'] ~= nil then
            SendNUIMessage({
                content = calls[callnum - 1]['text'];
                callnum = num;
                left = true;
                pic = true;
                model = calls[callnum - 1]['model'];
            })
        else
            SendNUIMessage({
                content = calls[callnum - 1]['text'];
                callnum = num;
                left = true;
            })
        end
        callnum = callnum - 1 
    end
end, false)

RegisterCommand("mover", function(source, args)
    if showed then 
        SetNuiFocus(true, true)
        SendNUIMessage({
            inConfig = true;
        })
    end
end, false)

RegisterCommand("acceptentorno", function(source, args)
    if callnum ~= 0 then
        SetNewWaypoint(calls[callnum]['coords'])
        ESX.ShowNotification('Las coordenadas han sido marcadas en tu ~r~GPS')
        SendNUIMessage({
            avkey = true;
        })
    end
end, false)

RegisterKeyMapping("mover", ("Config"), 'keyboard', 'i')

RegisterKeyMapping("right", ("Move to right alert"), 'keyboard', 'right')

RegisterKeyMapping("left", ("Move to left alert"), 'keyboard', 'left')

RegisterKeyMapping("showalerts", ("Open dispatch"), 'keyboard', 'f4')

RegisterKeyMapping("acceptentorno", ("Got to the marker"), 'keyboard', 'o')

RegisterNUICallback("exit", function()
    SetNuiFocus(false, false)
    if checkTable(calls) then
        if calls[callnum]['model'] == nil then
            SendNUIMessage({
                content = calls[callnum]['text'];
                callnum = num;
            })
        else

            SendNUIMessage({
                content = calls[callnum]['text'];
                callnum = num;
                pic = true;
                model = calls[callnum]['model'];
            })
        end
    else
        if checkTable(calls) then
            SendNUIMessage({
                content = calls[callnum]['text'];
                callnum = num;
            })
        else
            SendNUIMessage({
                content = "No se recibieron alertas";
                callnum = num;
            })
        end
    end
end)

RegisterNUICallback("tooglepic", function()
    if Config.enableVehiclePics then
        Config.enableVehiclePics = false
        ESX.ShowNotification('Las imágenes han sido deshabilitadas')
    else
        Config.enableVehiclePics = true
        ESX.ShowNotification('Las imágenes han sido habilitadas')
    end
end)

RegisterNUICallback("deletealerts", function()
    callnum = 0
    totalcalls = 0
    calls = {}
    SendNUIMessage({
        content = "No se recibieron alertas";
        restart = true;
        newalert = false;
        
    })
    ESX.ShowNotification('Todas las alertas se han eliminado')
end)

RegisterNUICallback("togglealerts", function()
    if activated then
        activated = false
        ESX.ShowNotification('Las alertas han sido deshabilitadas')
    else
        activated = true
        ESX.ShowNotification('Las alertas han sido habilitadas')
    end
end)

RegisterNUICallback("deletealert", function(cb)
    totalcalls = totalcalls - 1
    
    if (cb.selectedId + 1) == callnum then
        if checkTable(calls) then
            if calls[callnum + 1] ~= nil then
                SendNUIMessage({
                    content = calls[callnum + 1]['text'];
                    callnum = num;
                    totalcalls = totalcalls;
                })
                callnum = callnum + 1
            elseif calls[callnum - 1] ~= nil then
                local num = callnum - 1
                SendNUIMessage({
                    content = calls[callnum - 1]['text'];
                    callnum = num;
                    totalcalls = totalcalls;
                })
                callnum = callnum - 1
            else

                callnum = 0
                totalcalls = 0
                calls = {}
                SendNUIMessage({
                    content = "Todas las alertas eliminadas";
                    restart = true;
                    newalert = false;
                    
                })
            end
        end
    else
        callnum = callnum - 1
        SendNUIMessage({
            callnum = callnum;
            totalcalls = totalcalls;
        })
    end
    table.remove(calls, cb.selectedId + 1)
    
end)

function checkTable(table)
    local init = false
    for k,v in pairs(table) do
        inIt = true
    end
    if inIt then
        return true
    else
        return false
    end
end
