local isUsed = false

RegisterNetEvent("pz_carhud:carhud:show")
RegisterNetEvent("pz_carhud:carhud:hide")

AddEventHandler("pz_carhud:carhud:show", function(interface)
    SendNUIMessage({
        type = "carhud:show",
        velocity = interface.velocity,
        fuel = interface.fuel,
    })
end)

AddEventHandler("pz_carhud:carhud:hide", function()
    SendNUIMessage({
        type = "carhud:hide",
    })
end)

CreateThread(function()
    while true do
        isUsed = false
        if (IsPedInAnyVehicle(PlayerPedId())) then
            isUsed = true
            TriggerEvent("pz_carhud:carhud:show", {
                velocity = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId()))*3.6,
                fuel     = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId())),
            })
        else
            TriggerEvent("pz_carhud:carhud:hide")
            SetTimeout(1000, function()
                isUsed = false
            end)
        end
        if isUsed then
            Wait(150)
        else
            Wait(1000)
        end
    end
end)


   

        

       -- Everything that neededs to be at WAIT 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local player = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(player, false)
		

		

		if GetPedInVehicleSeat(vehicle, -1) == player then
            if IsControlJustPressed(1, 137) then
                
                local vehicleSpeedSource = GetEntitySpeed(vehicle)

                if vehicleCruiser == 'on' then
                    vehicleCruiser = 'off'
                    SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
                    
                else
                    vehicleCruiser = 'on'
                    SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
                end
            end
        else
            Citizen.Wait(1000)
        end

		

		
	end
end)


       

MinimapScaleform = {
    scaleform = nil,
}

