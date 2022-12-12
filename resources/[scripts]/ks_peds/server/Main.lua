-- Server Core
ESX = exports['es_extended']:getSharedObject()

-- Register Server Main Event
RegisterNetEvent('ks_peds:server:openMenu',
    function()
        _src = source
        local Manarger = PedManarger(_src, ESX)
        Manarger.getPeds(
            function(peds)
                if Config.Debug then
                    print('^2[ks_peds] - ^2debuggin ^1(^3ks_peds:server:openMenu^1)^2 server event ...^7')
                end
                TriggerClientEvent('ks_peds:client:openMenu', _src, peds, GetPlayerName(_src))
                if Config.Debug then
                    print('^2[ks_peds] - ^2debuggin ^1(^3ks_peds:server:openMenu^1)^2 server event peds ^1(^3'..json.encode(peds)..'^1)^2 sended^7')
                end
            end
        )
    end
)

-- Main command
RegisterCommand('ks_peds',
    function(source, arguments, rawCommand)

        if arguments[1] and arguments[2] then
            local Manarger = PedManarger(arguments[2], ESX)
            if Manarger.isAllowed() then
                if arguments[1] == 'add' then
                    Manarger.havePed(arguments[3], function(havePed)
                        if not havePed then
                            Manarger.addPed(tostring(arguments[3]), tostring(arguments[5]), tostring(arguments[4]))
                            Manarger.alert(Config.Lang.AddedPed..arguments[3]..Config.Lang.To..arguments[2]..'')
                        else
                            Manarger.alert(Config.Lang.HavePed)
                        end
                    end)
                end
                if arguments[1] == 'remove' then
                    Manarger.havePed(arguments[3], function(havePed)
                        if havePed then
                            Manarger.removePed(tostring(arguments[3]))
                            Manarger.alert(Config.Lang.RemovedPed..arguments[3]..Config.Lang.To..arguments[2]..'')
                        else
                            Manarger.alert(Config.Lang.HavePed)
                        end
                    end)
                end
            else
                Manarger.alert(Config.Lang.NoPermissions)
            end
        end

    end
)

-- Main command help in chat
Citizen.CreateThread(
    function()
        TriggerClientEvent('chat:addSuggestion', -1, ('/ks_peds'), 'Agregar ped a usuario', {
            {name = 'Funcion', help = 'Funcion (add o remove)'},
            {name = 'ID', help = 'ID del usuario'},
            {name = 'Ped', help = 'ped que quieras añadir o quitar'},
            {name = 'Tipo', help = 'Animal o Ped'},
            {name = 'Label', help = 'Nombre que quieres que tenga en el menu 1 palabra'}
        })
    end
)