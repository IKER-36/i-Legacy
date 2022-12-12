local handsup = false
local canHandsUp = true

Citizen.CreateThread(
	function()
		RequestAnimDict('random@mugging3')
		while not HasAnimDictLoaded('random@mugging3') do
			Citizen.Wait(100)
		end
	end
)

RegisterCommand('manos',
	function()
		if handsup then
			print(1)
			handsup = false
			ClearPedSecondaryTask(PlayerPedId())
			TriggerServerEvent('esx_thief:update', handsup)
		else
			print(12)
			handsup = true
			TaskPlayAnim(PlayerPedId(), 'random@mugging3', 'handsup_standing_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
			TriggerServerEvent('esx_thief:update', handsup)
		end
	end
)

RegisterKeyMapping("manos","Levantar las manos","keyboard","X")