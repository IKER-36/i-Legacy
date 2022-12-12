ESX = nil
Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject',
                function(core)
                    ESX = core
                end
            )
        end
        Playerdata = {}
    end
)

RegisterNetEvent('ks_peds:client:openMenu',
    function(peds, name)
        if peds then
            if Config.Debug then
                print('^2[ks_peds] - ^2debuggin ^1(^3ks_peds:client:openMenu^1)^2 client event ...')
            end
            local PedMenu = PedMenu(peds, ESX, name..math.random(0, 10000))
            PedMenu.OpenMenu()
            if Config.Debug then
                print('^2[ks_peds] - ^2debuggin ^1(^3ks_peds:client:openMenu^1)^2 client event peds ^1(^3'..json.encode(peds)..'^1)^2 sended to ^1(^3PedMenu^1)^2 class successfully!')
            end
        else
            ESX.ShowNotification(Config.Lang.NoPed)
        end
    end
)

RegisterCommand('PedMenu',
    function(source, arguments)
        TriggerServerEvent('ks_peds:server:openMenu')
    end
)

if Config.KeyMapping then
    RegisterKeyMapping('PedMenu','Abrir menu ks peds','keyboard',Config.KeyMapping.Key)
end

AddEventHandler('onClientResourceStart',
    function (resourceName)
        if GetCurrentResourceName() == resourceName then
            TriggerEvent('chat:addSuggestion', ('/ks_peds'), 'Agregar ped a usuario', {
                {name = 'Funcion', help = 'Funcion (add o remove)'},
                {name = 'ID', help = 'ID del usuario'},
                {name = 'Ped', help = 'ped que quieras añadir o quitar'},
                {name = 'Tipo', help = 'Animal o Ped'},
                {name = 'Label', help = 'Nombre que quieres que tenga en el menu 1 palabra'}
            })
        end
    end
)