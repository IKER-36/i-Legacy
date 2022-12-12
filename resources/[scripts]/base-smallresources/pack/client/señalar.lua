mp_pointing = false
keyPressed = false

function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    DoAnim("stop")
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

function StopAnyAnim(noRemoveWeapon)
	local player = PlayerPedId()
	TriggerEvent('Radiant_Animations:StopAnimations')
	if(noRemoveWeapon == nil)then
		SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
	end
	if IsPedActiveInScenario(player) then
		ClearPedTasks(player)
	end
	ClearPedTasks(player)
	DecorSetBool(player, 'IsPedCarry', 0)
	if(mp_pointing)then
		stopPointing()
		keyPressed = true
		mp_pointing = false
	end
	if(piggyBackInProgress == true) then
		Espalda()
	end
	if(isRagdolling == true)then
		isRagdolling = false
	end
	if(restorepos ~= nil)then
		local coords      = GetEntityCoords(PlayerPedId())
		if(GetDistanceBetweenCoords(coords, restorepos.x,restorepos.y,restorepos.z-1, true) < 2) then
			SetEntityCoords(player, restorepos.x,restorepos.y,restorepos.z-1)
		end
		restorepos = nil
	end
end

function DoAnim(argh)
	local player = PlayerPedId()
	playerCurrentAnimation = argh
	if argh == 'help' then -- List Anims in Chat Command
		TriggerEvent('chat:addMessage', { args = { '[^1Animations^0]: ok, salute, finger, finger2, phonecall, surrender, facepalm, notes, brief, brief2, foldarms, foldarms2, foldarms3, damn, fail, gang1, gang2, no, pickbutt, grabcrotch, peace, cigar, cigar2, joint, cig, holdcigar, holdcig, holdjoint, dead, holster, aim, aim2, slowclap, box, cheer, bum, leanwall, copcrowd, copcrowd2, copidle, shotbar, drunkbaridle, djidle, djidle2, fdance1, fdance2, mdance1, mdance2, kneelhu, espalda, sit, carry, readyfight' } })
	elseif argh == 'stuckprop' then -- Deletes Clients Props Command
		TriggerEvent('Radiant_Animations:KillProps')
	elseif argh == 'surrender' then -- I'll figure out a better way to do animations with this much depth later.
		TriggerEvent('Radiant_Animations:Surrender')
	elseif argh == 'stop' then -- Cancel Animations
		StopAnyAnim()
	else
		StopAnyAnim()
		if(argh == 'kneelhu') then
			KneelHU()
		elseif( argh == 'espalda') then
			Espalda()
		elseif( argh == 'carry') then
			Carry()
		elseif( argh == 'ragdoll') then
			isRagdolling = true
		else
			local animfound = false
			for i = 1, #Config.Anims, 1 do
				local name = Config.Anims[i].name
				if argh == name then		
					animfound = true		
					local prop_one = Config.Anims[i].data.prop
					local boneone = Config.Anims[i].data.boneone
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 

						if playerCurrentlyHasProp then --- Delete Old Prop

							TriggerEvent('Radiant_Animations:KillProps')
						end

						if Config.Anims[i].data.type == 'prop' then

							TriggerEvent('Radiant_Animations:AttachProp', prop_one, boneone, Config.Anims[i].data.x, Config.Anims[i].data.y, Config.Anims[i].data.z, Config.Anims[i].data.xa, Config.Anims[i].data.yb, Config.Anims[i].data.zc)

						elseif Config.Anims[i].data.type == 'brief' then

							if name == 'brief' then
								GiveWeaponToPed(player, 0x88C78EB7, 1, false, true)
							else
								GiveWeaponToPed(player, 0x01B79F17, 1, false, true)
							end
							return
						elseif Config.Anims[i].data.type == 'scenario' then
							if vehiclecheck() then
								if IsPedActiveInScenario(player) then
									ClearPedTasks(player)
								else
									TaskStartScenarioInPlace(player, Config.Anims[i].data.anim, 0, false)   
								end 
							end
						elseif Config.Anims[i].data.type == 'sitchair' then
							if vehiclecheck() then
								if IsPedActiveInScenario(player) then
									ClearPedTasks(player)
								else
 									pos = GetCoordsInfrontOfEntityWithDistance(player, -0.6)
									head = GetEntityHeading(player)
									local newx = pos['x']
									local newy = pos['y']
									local newz = pos['z'] - 0.5
									print(newx)
									print(newy)
								 	TaskStartScenarioAtPosition(player, 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER', newx, newy, newz, head, 0, 0, false)
								end 
							end
						elseif Config.Anims[i].data.type == 'sitchair2' then
							if vehiclecheck() then
								if IsPedActiveInScenario(player) then
									ClearPedTasks(player)
								else
									pos = GetCoordsInfrontOfEntityWithDistance(player, -0.3)
									head = GetEntityHeading(player)
									local newx = pos['x']
									local newy = pos['y']
									local newz = pos['z'] - 1
									restorepos = GetEntityCoords(player, false)
 									TaskStartScenarioAtPosition(player, 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER', newx, newy, newz, head, 0, 0, false)
								end 
							end
						else

							if vehiclecheck() then
								local ad = Config.Anims[i].data.ad
								local anim = Config.Anims[i].data.anim
								local body = Config.Anims[i].data.body
								local duration = Config.Anims[i].data.duration
							
								TriggerEvent('Radiant_Animations:Animation', ad, anim, body, duration) -- Load/Start animation

								if prop_one ~= 0 then
									local prop_two = Config.Anims[i].data.proptwo
									local bonetwo = nil

									loadPropDict(prop_one)
									TriggerEvent('Radiant_Animations:AttachProp', prop_one, boneone, Config.Anims[i].data.x, Config.Anims[i].data.y, Config.Anims[i].data.z, Config.Anims[i].data.xa, Config.Anims[i].data.yb, Config.Anims[i].data.zc)
									if prop_two ~= 0 then
										bonetwo = Config.Anims[i].data.bonetwo
										prop_two = Config.Anims[i].data.proptwo
										loadPropDict(prop_two)
										TriggerEvent('Radiant_Animations:AttachProp', prop_two, bonetwo, Config.Anims[i].data.twox, Config.Anims[i].data.twoy, Config.Anims[i].data.twoz, Config.Anims[i].data.twoxa, Config.Anims[i].data.twoyb, Config.Anims[i].data.twozc)
									end
								end
							end
						end
					end
				end
			end
			if(animfound == false)then
				ExecuteCommand("emote " .. argh)
			end
		end
	end
end

function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)