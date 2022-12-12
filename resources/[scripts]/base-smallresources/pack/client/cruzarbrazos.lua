Citizen.CreateThread(function()
    local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
end)

RegisterCommand('cruzar',
    function()
        if not handsup then
            local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
            TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
            handsup = true
        else
            handsup = false
            ClearPedTasks(GetPlayerPed(-1))
        end
    end
)

RegisterKeyMapping('cruzar','Cruzar los brazos','keyboard','Z')