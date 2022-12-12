function PedMenu(peds, core, name)

    self = {}

    self.core = core
    self.peds = peds
    self.name = name
    self.menuPeds = {}

    self.OpenMenu = function()
        
        if Config.Debug then print('^2[ks_peds] - ^2debuggin ^1(^3OpenMenu^1)^2 function in class ^1(^3PedMenu^1)^2 ...') end
        
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "showPeds",
            peds = self.peds
        })

        if Config.Debug then print('^2[ks_peds] - ^2debuggin ^1(^3OpenMenu^1)^2 function in class ^1(^3PedMenu^1)^2 menu opened') end

    end

    self.setPed = function(ped, type)

        if type ~= 'Animal' then
            SetPedDefaultComponentVariation(PlayerPedId())
            self.core.Streaming.RequestModel(GetHashKey(ped), function()
                SetPlayerModel(PlayerId(), GetHashKey(ped))
                SetPedDefaultComponentVariation(PlayerPedId())
                SetModelAsNoLongerNeeded(GetHashKey(ped))
                SetPedComponentVariation(PlayerPedId(), 8, 0, 0, 2)
            end)
        else
            self.core.Streaming.RequestModel(GetHashKey(ped), function()
                SetPlayerModel(PlayerId(),GetHashKey(ped))
                SetPedDefaultComponentVariation(PlayerPedId())
                SetPedComponentVariation(PlayerPedId(), 8, 0, 0, 2)
                SetCanAttackFriendly(GetPlayerPed(-1), false, false)
            end)
        end

    end

    self.setDefaultPed = function()

        self.core.TriggerServerCallback('esx_skin:getPlayerSkin',
            function(skin, jobSkin)
                self.skin = skin
                self.sex = skin.sex == 0
                TriggerEvent('skinchanger:loadDefaultModel', self.sex,
                    function()
                        self.core.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', self.skin)
                            TriggerEvent('dpc:ApplyClothing')
                        end)
                    end
                )
            end
        )

    end

    RegisterNUICallback("close",
        function()
            SetNuiFocus(false, false)
        end
    )

    RegisterNUICallback("default_ped",
        function()
            SetNuiFocus(false, false)
            self.setDefaultPed()
        end
    )

    RegisterNUICallback("setPed",
        function(data)
            SetNuiFocus(false, false)
            self.setPed(data.ped, data.type)
        end
    )

    return self

end