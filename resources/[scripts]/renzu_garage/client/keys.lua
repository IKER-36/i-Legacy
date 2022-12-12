RegisterNUICallback("receive_garagekeys", function(data, cb)
    SetNuiFocus(false,false)
    garagekeysdata = data
end)

RegisterCommand(Config.GarageKeysCommand, function(source, args, rawCommand)
    TriggerServerCallback_("renzu_garage:getgaragekeys",function(sharedkeys,players)
        if Config.GarageKeys and PlayerData.job ~= nil then
            local ped = cache.ped
            local coords = GetEntityCoords(ped)
            local vehicle = GetNearestVehicleinPool(coords, 5)
            local mykeys = {}
            table.insert(mykeys,{identifier = 'own', name = Message[48]})
            if sharedkeys then
                for k,v in pairs(sharedkeys) do
                    table.insert(mykeys,v)
                end
            end
            SendNUIMessage(
                {
                    data = {garages = garagecoord, mykeys = mykeys, action = args[1], players = players},
                    type = "garagekeys"
                }
            )
            SetNuiFocus(true, true)
            while garagekeysdata == nil do Wait(100) end
            if garagekeysdata.action == 'give' then
                TriggerServerEvent('renzu_garage:updategaragekeys',garagekeysdata.action,garagekeysdata.data)
                Config.Notify( 'success', Message[49])
            end
            if garagekeysdata.action == 'del' then
                TriggerServerEvent('renzu_garage:updategaragekeys',garagekeysdata.action,garagekeysdata.data.mygaragekeys)
                LocalPlayer.state:set('garagekey', false, true)
                Config.Notify( 'success', Message[50])
            end
            if garagekeysdata.action == 'use' then
                LocalPlayer.state:set('garagekey', garagekeysdata.data.mygaragekeys ~= 'own' and garagekeysdata.data.mygaragekeys or false, true)
                Config.Notify('success', Message[51])
            end
            garagekeysdata = nil
        end
    end)
end, false)

function isVehicleUnlocked()
    local p = cache.ped
    local mycoords = GetEntityCoords(p)
    local veh = nil
    if IsPedInAnyVehicle(p) then
        local v = GetVehiclePedIsIn(p)
        if GetPedInVehicleSeat(v, -1) == cache.ped then
            local plate = GetVehicleNumberPlateText(v)
            plate = string.gsub(plate, '^%s*(.-)%s*$', '%1')
            local r = GetIsVehicleEngineRunning(v)
            if Config.Ox_Inventory then
                local ent = Entity(v).state
                if not DoesPlayerHaveKey(plate) and not ent.hotwired then
                    ent:set('havekeys', false, true)
                    TriggerServerEvent('statebugupdate','havekeys',false, VehToNet(v))
                end
                SetPedConfigFlag(cache.ped,429,false)
                Wait(1)
                --TriggerServerEvent('renzu_garage:vehiclekeyhandler',plate,true)
                --NetworkRequestControlOfEntity(v)
                Wait(1000)
                SetVehicleEngineOn(v,false,true,true)
            end
            TaskLeaveVehicle(p,v,0)
            Wait(1000)
            if r and not Config.Ox_Inventory then
                SetVehicleEngineOn(v,true,true,false)
            end
            local props = GetVehicleProperties(v)
            local Visual = {}
            for k,v in pairs(props) do
                if k == 'tankHealth' or  k == 'dirtLevel' or  k == 'bodyHealth' or  k == 'engineHealth' or k == 'wheel_tires' or k == 'vehicle_window' or k == 'vehicle_doors' then
                    Visual[k] = v
                end
            end
            TriggerServerEvent('renzu_garage:SetPropState',{props = Visual, plate = plate})
            return
        end
    end
    local nearestvehicle = GetNearestVehicleinPool(mycoords)
    if not IsPedInAnyVehicle(p) and nearestvehicle.dist < 10 then
        veh = GetVehiclePedIsEntering(p)
        local c = 0
        while not veh or veh == 0 do
            veh = GetVehiclePedIsTryingToEnter(p)
            if c > 2000 then
                break
            end
            c = c + 10
            Wait(0)
        end
    end
    if GetIsVehicleEngineRunning(veh) and GetEntityPopulationType(veh) ~= 7 then
        local ent = Entity(veh).state
        ent:set('havekeys',true,true)
        ent:set('hotwired',true,true)
        ent:set('unlock',false,true)
        TriggerServerEvent('statebugupdate','havekeys',true, VehToNet(veh))
        TriggerServerEvent('statebugupdate','hotwired',true, VehToNet(veh))
        TriggerServerEvent('statebugupdate','unlock',true, VehToNet(veh))
        return
    end
    if not DoesEntityExist(veh) or entering then return end
    entering = true
    CreateThread(function()
        while Config.EnableKeySystem do
            local sleep = 0
            if veh then
                EnsureEntityStateBag(veh)
                plate = GetVehicleNumberPlateText(veh)
                plate = string.gsub(plate, '^%s*(.-)%s*$', '%1')
                local ent = Entity(veh).state
                local owned_vehicles = GlobalState['vehicles'..PlayerData.identifier] or {}
                local havekeys = DoesPlayerHaveKey(plate)
                if Config.Ox_Inventory and havekeys then
                    ent:set('havekeys', true, true)
                    TriggerServerEvent('statebugupdate','havekeys',true, VehToNet(veh))
                    Wait(111)
                end
                if not ent.havekeys and not Config.Ox_Inventory then
                    ent.havekeys = owned_vehicles[plate] ~= nil and owned_vehicles[plate][owner] == PlayerData.identifier or ent.share ~= nil and ent.share[PlayerData.identifier] or false
                    if ent.hotwired and ent.havekeys then
                        ent.hotwired = false
                        ent:set('hotwired', false, true)
                        TriggerServerEvent('statebugupdate','hotwired',false, VehToNet(veh))
                        ent:set('havekeys', false, true)
                        TriggerServerEvent('statebugupdate','havekeys',false, VehToNet(veh))
                        Wait(200)
                        ent.havekeys = true
                        SetVehicleEngineOn(veh,false,true,false)
                        SetVehicleNeedsToBeHotwired(veh,false)
                        Wait(100)
                    end
                elseif ent.havekeys or not Config.Ox_Inventory and owned_vehicles[plate] ~= nil and owned_vehicles[plate][owner] == PlayerData.identifier or ent.share ~= nil and ent.share[PlayerData.identifier] then
                    SetVehicleEngineOn(veh,false,true,false)
                    SetVehicleNeedsToBeHotwired(veh,false)
                    if havekeys then
                        ent:set('hotwired', false, true)
                        TriggerServerEvent('statebugupdate','hotwired',false, VehToNet(veh))
                    end
                    -- ent:set('havekeys', false, true)
                    -- TriggerServerEvent('statebugupdate','havekeys',false, VehToNet(veh))
                    Wait(200)
                    ent.havekeys = true
                    SetVehicleEngineOn(veh,false,true,false)
                    SetVehicleNeedsToBeHotwired(veh,false)
                    Wait(100)
                end
                if not ent.unlock and Config.LockAllLocalVehicle 
                or not ent.unlock and GetEntityPopulationType(veh) == 7 and not Config.LockAllLocalVehicle then 
                    SetVehicleDoorsLocked(veh, 2)
                else
                    if not Config.LockAllLocalVehicle and GetEntityPopulationType(veh) ~= 7 then
                        local driver = GetPedInVehicleSeat(veh, -1)
                        if not DoesEntityExist(driver) and Config.LockParkedLocalVehiclesOnly and GetLastPedInVehicleSeat(veh,-1) ~= cache.ped then
                            SetVehicleDoorsLocked(veh, 2)
                        else
                            ent.unlock = true
                            SetVehicleEngineOn(veh,false,true,true)
                            SetVehicleNeedsToBeHotwired(veh,false)
                            SetVehicleDoorsLocked(veh, 7)
                            while GetIsVehicleEngineRunning(veh) do Wait(100) SetVehicleEngineOn(veh,false,true,true) end
                        end
                    else
                        SetVehicleDoorsLocked(veh, 1)
                    end
                end
                sleep = 1
                SetPedConfigFlag(cache.ped,429,false)
                if ent.unlock and not ent.havekeys then
                    local c = 0
                    while not GetPedInVehicleSeat(veh,-1) == cache.ped and not IsPedInAnyVehicle(cache.ped) or c < 70 do SetVehicleEngineOn(veh,false,true,true) if IsPedInAnyVehicle(cache.ped) and GetPedInVehicleSeat(veh,-1) == cache.ped then break end Wait(100) c = c + 1 end
                end
                if not ent.havekeys then
                    SetVehicleEngineOn(veh,false,true,true)
                    SetPedConfigFlag(cache.ped,429,true)
                    local vehkey = ent.havekeys
                    while not vehkey and IsPedInAnyVehicle(cache.ped) do
                        local wait = 1000
                        if GetPedInVehicleSeat(veh,-1) == cache.ped then
                            SetPedConfigFlag(cache.ped,429,true)
                            SetVehicleEngineOn(veh,false,true,true)
                            wait = 0
                        elseif GetIsVehicleEngineRunning(veh) then
                            wait = 500
                        end
                        Wait(wait)
                    end
                end
                Wait(100)
                local canhotwire = Config.Ox_Inventory and not ent.havekeys and not owned_vehicles[plate] or not Config.Ox_Inventory and not ent.havekeys
                if Config.EnableHotwire and ent.unlock and canhotwire and GetPedInVehicleSeat(veh,-1) == cache.ped and not GetIsVehicleEngineRunning(veh) then
                    SetVehicleEngineOn(veh,false,true,true)
                    while GetPedInVehicleSeat(veh,-1) == cache.ped and not GetIsVehicleEngineRunning(veh) do
                        ShowFloatingHelpNotification('[H] '..Message[52]..' <br> [F] to '..Message[53], GetEntityCoords(veh), true, 'hotwire')
                        if IsControlJustPressed(0,74) then
                            HotWireVehicle(veh)
                            Wait(1000)
                        end
                        Wait(0)
                    end
                    SetVehicleNeedsToBeHotwired(veh,true)
                end
                if ent.unlock and ent.havekeys and ent.hotwired and GetSeatPedIsTryingToEnter(cache.ped) == -1 then
                    SetPedConfigFlag(cache.ped,429,true)
                    SetVehicleEngineOn(veh,false,true,false)
                    SetVehicleNeedsToBeHotwired(veh,true)
                end
                if ent.unlock and not ent.havekeys and not ent.hotwired then
                    SetVehicleEngineOn(veh,false,true,true)
                    SetVehicleNeedsToBeHotwired(veh,false)
                end
                if not Config.EnableHotwire then
                    SetPedConfigFlag(cache.ped,429,true)
                    SetVehicleEngineOn(veh,false,true,false)
                    SetVehicleNeedsToBeHotwired(veh,false)
                end
                break
            end
            Wait(sleep)
        end
        entering = false
    end)
end

RegisterCommand('entervehicleg', function()
	isVehicleUnlocked()
end, false)

CreateThread(function()
	RegisterKeyMapping('entervehicleg', Message[54], 'keyboard', 'F')
	return
end)

function SetVehicleOwned(vehicle)
    while not DoesEntityExist(vehicle) do Wait(1) end
    local netid = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdExistsOnAllMachines(netid,true)
    SetEntityAsMissionEntity(vehicle,true,true)
    NetworkRequestControlOfEntity(vehicle)
    local attempt = 0
    while not NetworkHasControlOfEntity(vehicle) and attempt < 500 and DoesEntityExist(vehicle) do
        NetworkRequestControlOfEntity(vehicle)
        Citizen.Wait(0)
        attempt = attempt + 1
    end
end

function getveh()
    local ped = cache.ped
	local v = GetVehiclePedIsIn(cache.ped, false)
	lastveh = GetVehiclePedIsIn(cache.ped, true)
	local dis = -1
	if v == 0 then
		if #(GetEntityCoords(ped) - GetEntityCoords(lastveh)) < 5 then
			v = lastveh
		end
		dis = #(GetEntityCoords(ped) - GetEntityCoords(lastveh))
	end
	if dis > 3 then
		v = 0
	end
	if v == 0 then
		local count = 5
		v = GetClosestVehicle(GetEntityCoords(cache.ped), 8.000, 0, 70)
		while #(GetEntityCoords(ped) - GetEntityCoords(v)) > 10 and count >= 0 do
			v = GetClosestVehicle(GetEntityCoords(cache.ped),8.000, 0, 70)
			count = count - 1
			Wait(1)
		end
        if v == 0 then
            local temp = {}
            for k,v in pairs(GetGamePool('CVehicle')) do
                local dist = #(GetEntityCoords(ped) - GetEntityCoords(v))
                temp[k] = {}
                temp[k].dist = dist
                temp[k].entity = v
            end
            local dist = -1
            local nearestveh = nil
            for k,v in pairs(temp) do
                if dist == -1 or dist > v.dist then
                    dist = v.dist
                    nearestveh = v.entity
                end
            end
            v = nearestveh
        end
	end
	return tonumber(v)
end

function playanimation(animDict,name)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do 
		Wait(1)
		RequestAnimDict(animDict)
	end
	TaskPlayAnim(cache.ped, animDict, name, 2.0, 2.0, -1, 47, 0, 0, 0, 0)
end


GetGarageKeys = function(id)
    local options = {}
    local menus = {}
    local secondmenus = {}

    local haskey = false
    local data = exports.ox_inventory:Search('slots', 'keys')
    local garage = promise:new()
    table.insert(options,{
        ['title'] = 'My Owned Garage',
        ['arrow'] = true,
        onSelect = function(args)
            --garage = {identifier = PlayerData.identifier}
            garage:resolve({identifier = PlayerData.identifier})
        end,
        ['description'] = 'Use my owned garage',
    })
    if data then
        for k,v in pairs(data) do
            if v.metadata and v.metadata.identifier and v.metadata.identifier ~= PlayerData.identifier and v.metadata.garage == id then
                table.insert(options,{
                    ['title'] = v.metadata.description,
                    ['arrow'] = true,
                    onSelect = function(args)
                        garage:resolve(v.metadata)
                    end,
                    ['description'] = 'Choose this '..v.metadata.description,
                })
                haskey = true
            end
        end
    end
    if haskey then
        lib.registerContext({
            id = 'showgaragekeys',
            title = 'Garage Keys',
            onExit = function()
                --garage = {identifier = PlayerData.identifier}
                garage:resolve({identifier = PlayerData.identifier})
            end,
            options = options
        })
        lib.showContext('showgaragekeys')
    else
        garage:resolve({identifier = PlayerData.identifier})
    end
    return Citizen.Await(garage)
end

DoesPlayerHaveKey = function(plate)
    local haskey = false
    local data = exports.ox_inventory:Search('slots', 'keys')
    local gago = {}
    if data then
        local plate = string.gsub(tostring(plate), '^%s*(.-)%s*$', '%1')
        for k,v in pairs(data) do
            local metaplate = v.metadata and v.metadata.plate
            if metaplate and string.gsub(tostring(metaplate), '^%s*(.-)%s*$', '%1') == plate then
                haskey = true
                break
            end
        end
    end
    return haskey
end

VehiclesinArea = function(data)
    near = -1
    nearestveh = nil
    nearestplate = nil
    nearestowner = nil
    for k,v in pairs(data) do
        local ent = Entity(v.entity).state
        if near > v.distance or near == -1 then
            near = v.distance
            nearestveh = v.entity
            nearestplate = v.plate
            nearestowner = v.owner
        end
    end
    return near, nearestveh, nearestplate, nearestowner
end

function Keyless()
    local plate = nil
    local vehiclesinarea = {}
    -- ITERATE AND RETURN NEAREST OWNED VEHICLE
    local mycoords = GetEntityCoords(cache.ped)
    local owned_vehicles = GlobalState['vehicles'..PlayerData.identifier] or {}
    local ox = Config.Ox_Inventory
    for k,v in pairs(GetGamePool('CVehicle')) do
        local p = GetVehicleNumberPlateText(v)
        plate = string.gsub(p, '^%s*(.-)%s*$', '%1')
        vehiclesinarea[plate] = {}
        vehiclesinarea[plate].entity = v
        vehiclesinarea[plate].plate = plate
        vehiclesinarea[plate].distance = #(mycoords - GetEntityCoords(v, false))
        vehiclesinarea[plate].owner = not ox and owned_vehicles[plate] ~= nil and owned_vehicles[plate][owner] or GlobalState.Gshare and GlobalState.Gshare[plate] 
        or ox and DoesPlayerHaveKey(plate) and PlayerData.identifier or false
    end
    local near = -1
    local nearestveh = nil
    local nearestplate = nil
    near, nearestveh, nearestplate, nearestowner = VehiclesinArea(vehiclesinarea)
    if not nearestveh or near > 40 then return end
    EnsureEntityStateBag(nearestveh)
    -- check nearest owned vehicle
    local ent = Entity(nearestveh).state
    if ox and DoesPlayerHaveKey(nearestplate) -- priorities ox
    or owned_vehicles[nearestplate] and owned_vehicles[nearestplate][owner] == PlayerData.identifier and not ox -- player owned
    or not ox and owned_vehicles[nearestplate] and ent.share ~= nil and ent.share[PlayerData.identifier] and ent.share[PlayerData.identifier] -- shared vehicle entity state
    or GlobalState.Gshare and GlobalState.Gshare[nearestplate] and GlobalState.Gshare[nearestplate][PlayerData.identifier] and GlobalState.Gshare[nearestplate][PlayerData.identifier] then -- shared vehicle from global state
        ent.unlock = not ent.unlock
        PlaySoundFromEntity(-1, "Remote_Control_Fob", cache.ped, "PI_Menu_Sounds", 1, 0)
        if not IsPedInAnyVehicle(cache.ped, false) then 
            if ent.unlock then 
                local attempt = 1000
                while not NetworkHasControlOfEntity(nearestveh) and attempt < 100 and DoesEntityExist(nearestveh) do
                    NetworkRequestControlOfEntity(nearestveh)
                    Citizen.Wait(1)
                    attempt = attempt + 1
                end
                SetEntityAsMissionEntity(nearestveh,true,true)
                SetVehicleEngineOn(nearestveh,false,true,false) 
            end
            playanimation('anim@mp_player_intmenu@key_fob@','fob_click')
            SetVehicleLights(nearestveh, 2);Citizen.Wait(100);SetVehicleLights(nearestveh, 0);Citizen.Wait(200);SetVehicleLights(nearestveh, 2)
        end
		Citizen.Wait(100)
		SetVehicleLights(nearestveh, 0)	
        ent:set('hotwired', false, true)
        TriggerServerEvent('statebugupdate','hotwired',false, VehToNet(nearestveh))
        --ent:set('unlock', ent.havekeys, true)
        SetVehicleDoorsLocked(nearestveh, 1)
        if not IsPedInAnyVehicle(cache.ped, false) then
            SetVehicleEngineOn(nearestveh,false,true,false)
        end
        if ent.unlock then
            --ent.havekeys = true
            ent:set('unlock', true, true)
            SetVehicleDoorsLocked(nearestveh,1)
            TriggerServerEvent('statebugupdate','unlock',true, VehToNet(nearestveh))
            --local payload = msgpack_pack(v)
            --SetStateBagValue(es, s, payload, payload:len(), r)
            PlaySoundFromEntity(-1, "Door_Open", nearestveh, "Lowrider_Super_Mod_Garage_Sounds", 0, 0)
            Config.Notify('success', Message[55])
            --StartVehicleHorn(nearestveh,2)
            StartVehicleHorn(nearestveh, 11, "HELDDOWN", false)
            Wait(200)
            StartVehicleHorn(nearestveh, 0, "HELDDOWN", false)
        else
            ent.havekeys = false
            ent:set('unlock', false, true)
            SetVehicleDoorsLocked(nearestveh,2)
            TriggerServerEvent('statebugupdate','unlock',false, VehToNet(nearestveh))
            TriggerServerEvent('statebugupdate','havekeys',false, VehToNet(nearestveh))
            StartVehicleHorn(nearestveh, 11, "HELDDOWN", false)
            Wait(200)
            StartVehicleHorn(nearestveh, 0, "HELDDOWN", false)
            Config.Notify( 'success', Message[56])
        end
        Wait(500)
        ClearPedTasks(cache.ped)
        return
    end
    Config.Notify( 'info', Message[57])
end

RegisterCommand('keyless'..Config.CarlockKey, function()
	Keyless()
end, false)

CreateThread(function()
	RegisterKeyMapping('keyless'..Config.CarlockKey, Message[58], 'keyboard', Config.CarlockKey)
	return
end)

-- LOCKPICK
CreateThread(function()
    if Config.EnableLockpickCommand then
        RegisterCommand(Config.LockpickCommand, function()
            LockPick()
        end, false)
    end
    return
end)

RegisterNetEvent('renzu_garage:lockpick', function()
    LockPick()
end)

exports('lockpick', LockPick)

function HotWireVehicle(veh)
    SetVehicleNeedsToBeHotwired(veh,false)
    SetVehicleDoorsLocked(veh, 1)
    local ent = Entity(veh).state
    while not ent.havekeys do
        Wait(20)
        SetVehicleEngineOn(veh,false,true,true)
        TaskEnterVehicle(cache.ped, veh, 10.0, -1, 2.0, 0)
        while not IsPedInAnyVehicle(cache.ped) do Wait(100) SetVehicleDoorsLocked(veh, 1) end
        local o = {
            dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            name = "machinic_loop_mechandplayer",
            speed = 1,
            flag = 49,
        }
        SetTimeout(1000,function()
            local lockpick = lib.progressBar({
                duration = 5000,
                label = 'Hot Wiring..',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                    clip = 'machinic_loop_mechandplayer' 
                },
            })
        end)
        local ret = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'})
        if lib.progressActive() then
            lib.cancelProgress()
        end
        if ret then
            SetVehicleEngineOn(veh,false,true,false)
            SetVehicleNeedsToBeHotwired(veh,true)
            ent.havekeys = true
            ent:set('havekeys', true, true)
            ent:set('hotwired', true, true)
            TriggerServerEvent('statebugupdate','havekeys',true, VehToNet(veh))
            TriggerServerEvent('statebugupdate','hotwired',true, VehToNet(veh))
            break
        elseif Config.EnableAlert then
            Config.FailAlert()
        end
    end
end

function LockPick()
    local playerPed = cache.ped
    local coords    = GetEntityCoords(playerPed)
    local distanceincar = 2.0
    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, distanceincar) then
        if not Config.EnableLockpick then return end
        local veh = getveh()
        if veh ~= 0 then
            local ent = Entity(veh).state
            if not ent.unlock then
                SetTimeout(1000,function()
                    local lockpick = lib.progressBar({
                        duration = 5000,
                        label = 'Lockpicking..',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                        },
                        anim = {
                            dict = 'veh@break_in@0h@p_m_one@',
                            clip = 'low_force_entry_ds' 
                        },
                    })
                end)
                local ret = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'})
                if lib.progressActive() then
                    lib.cancelProgress()
                end
                if ret then
                    ent.unlock = not ent.unlock
                    ent:set('unlock', ent.unlock, true)
                    TriggerServerEvent('statebugupdate','unlock',ent.unlock, VehToNet(veh))
                    SetVehicleDoorsLocked(veh, 1)
                    HotWireVehicle(veh)
                else
                    if Config.EnableAlert then
                        Config.FailAlert()
                    end
                    SetVehicleAlarmTimeLeft(veh,20)
                    SetVehicleAlarm(veh,true)
                    StartVehicleAlarm(veh)
                end
            end
        end
    end
end

-- Vehicle Keys

RegisterNUICallback("requestvehkey", function(data, cb)
    SetNuiFocus(false,false)
    vehiclekeysdata = data
end)

RegisterNetEvent('requestvehkey', function()
    TriggerServerCallback_("renzu_garage:getgaragekeys",function(sharedkeys,players)
        if Config.GarageKeys and PlayerData.job ~= nil then
            local owned_vehicles = GlobalState['vehicles'..PlayerData.identifier] or {}
            local ped = cache.ped
            local coords = GetEntityCoords(ped)
            local vehicles = {}
            for k,v in pairs(owned_vehicles) do
                vehicles[k] = {}
                vehicles[k].plate = v.plate
                vehicles[k].name = v.name
            end
            local p = GetVehicleNumberPlateText(GetVehiclePedIsIn(cache.ped))
            local plate = 'NULL'
            if p then
                plate = string.gsub(p, '^%s*(.-)%s*$', '%1')
            end
            SendNUIMessage(
                {
                    data = {vehicles = vehicles, players = players, current = Config.EnableDuplicateKeys and IsPedInAnyVehicle(cache.ped) and vehicles[plate] or false},
                    type = "requestvehiclekey"
                }
            )
            SetNuiFocus(true, true)
            while vehiclekeysdata == nil do Wait(100) end
            if vehiclekeysdata.action == 'request' then
                local owned = false
                local vehicle = GetVehiclePedIsIn(cache.ped)
                for k,v in pairs(owned_vehicles) do
                    if vehiclekeysdata.data and string.gsub(v.plate, '^%s*(.-)%s*$', '%1') == string.gsub(vehiclekeysdata.data.vehiclelist, '^%s*(.-)%s*$', '%1') and v[owner] == PlayerData.identifier then
                        owned = true
                        plate = string.gsub(vehiclekeysdata.data.vehiclelist, '^%s*(.-)%s*$', '%1')
                        break
                    end
                end
                if owned then
                    TriggerServerEvent('renzu_garage:vehiclekeyhandler',plate,true)
                    Config.Notify( 'success', "Duplicate Vehicle Key has been requested")
                end
            end
            vehiclekeysdata = nil
        end
    end)
end, false)

RegisterNUICallback("receive_vehiclekeys", function(data, cb)
    SetNuiFocus(false,false)
    vehiclekeysdata = data
end)

RegisterCommand(Config.VehicleKeysCommand, function(source, args, rawCommand)
    TriggerServerCallback_("renzu_garage:getgaragekeys",function(sharedkeys,players)
        if Config.GarageKeys and PlayerData.job ~= nil and not Config.Ox_Inventory then
            local owned_vehicles = GlobalState['vehicles'..PlayerData.identifier] or {}
            local ped = cache.ped
            local coords = GetEntityCoords(ped)
            local vehicles = {}
            for k,v in pairs(owned_vehicles) do
                vehicles[k] = {}
                vehicles[k].plate = v.plate
                vehicles[k].name = v.name
            end
            local p = GetVehicleNumberPlateText(GetVehiclePedIsIn(cache.ped))
            local plate = 'NULL'
            if p then
                plate = string.gsub(p, '^%s*(.-)%s*$', '%1')
            end
            SendNUIMessage(
                {
                    data = {vehicles = vehicles, players = players, current = Config.EnableDuplicateKeys and IsPedInAnyVehicle(cache.ped) and vehicles[plate] or false},
                    type = "vehiclekeys"
                }
            )
            SetNuiFocus(true, true)
            while vehiclekeysdata == nil do Wait(100) end
            if vehiclekeysdata.action == 'give' then
                local owned = false
                local vehicle = GetVehiclePedIsIn(cache.ped)
                for k,v in pairs(owned_vehicles) do
                    if vehiclekeysdata.data and string.gsub(v.plate, '^%s*(.-)%s*$', '%1') == string.gsub(vehiclekeysdata.data.vehiclelist, '^%s*(.-)%s*$', '%1') and v[owner] == PlayerData.identifier then
                        owned = true
                        plate = string.gsub(vehiclekeysdata.data.vehiclelist, '^%s*(.-)%s*$', '%1')
                        break
                    end
                end
                if owned then
                    TriggerServerEvent('renzu_garage:transfercar',plate,vehiclekeysdata.data.playerslist)
                    Config.Notify( 'success', Message[59])
                end
            end
            if vehiclekeysdata.action == 'dupe' and p then
                local owned = false
                local vehicle = GetVehiclePedIsIn(cache.ped)
                for k,v in pairs(owned_vehicles) do
                    if string.gsub(v.plate, '^%s*(.-)%s*$', '%1') == string.gsub(p, '^%s*(.-)%s*$', '%1') and v[owner] == PlayerData.identifier then
                        owned = true
                        break
                    end
                end
                if owned and vehiclekeysdata.data ~= nil and string.gsub(vehiclekeysdata.data.vehiclelist, '^%s*(.-)%s*$', '%1') == plate then
                    local ent = Entity(vehicle).state
                    local share = ent.share or {}
                    share[vehiclekeysdata.data.playerslist] = PlayerData.identifier
                    ent:set('share', share, true)
                    TriggerServerEvent('statebugupdate','share',share, VehToNet(vehicle))
                    Config.Notify('success', Message[60])
                else
                    Config.Notify( 'warning', Message[61])
                end
            end
            vehiclekeysdata = nil
        end
    end)
end, false)

CheckKeysOnItemRemove = function(item,count)
    Wait(1000)
    local owned_vehicles = GlobalState['vehicles'..PlayerData.identifier] or {}
    if item == 'keys' then
        for k,v in pairs(GetAllVehicleFromPool()) do
            if GetEntityPopulationType(v) > 4 then
                local plate = string.gsub(GetVehicleNumberPlateText(v), '^%s*(.-)%s*$', '%1')
                if owned_vehicles[plate] and not DoesPlayerHaveKey(plate) then
                    local ent = Entity(v).state
                    ent:set('havekeys', false, true)
                    TriggerServerEvent('statebugupdate','havekeys',false, VehToNet(v))
                end
            end
        end
    end
end

RegisterNetEvent('esx:removeInventoryItem', CheckKeysOnItemRemove)
RegisterNetEvent('ox_inventory:itemCount', CheckKeysOnItemRemove)