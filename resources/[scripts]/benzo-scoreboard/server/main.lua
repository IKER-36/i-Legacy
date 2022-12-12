local ServerSlots = GetConvarInt("sv_maxclients", 48)

ESX.RegisterServerCallback("benzo-Scoreboard:GetPlayers", function(source, cb)
    local xPlayers = ESX.GetExtendedPlayers()
    local SentPlayers = {}
    for i = 1, #xPlayers do
        local xPlayer = xPlayers[i]
        local PlayerPed = GetPlayerPed(xPlayer.source)
        local PlayerHealth = math.floor(GetEntityHealth(PlayerPed) / GetEntityMaxHealth(PlayerPed) * 100) or "N/A"
        local PlayerArmour = GetPedArmour(PlayerPed)
            SentPlayers[#SentPlayers + 1] = {
                Name = xPlayer.getName(),
                identifier = xPlayer.identifier,
                Id = xPlayer.source,
                Ping = GetPlayerPing(xPlayer.source),
                FiveMName = GetPlayerName(xPlayer.source),
                Job = xPlayer.job.label,
                JobGrade = xPlayer.job.grade_label,
                Group = xPlayer.group,
                Health = PlayerHealth,
                Armour = PlayerArmour
            }
    end
    cb(SentPlayers, #xPlayers)
end)

ESX.RegisterServerCallback("benzo-scoreboard:GetSlotCount", function(source, cb)
    cb(ServerSlots)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('[^6INFO^7] ^2' .. resourceName .. '^7 has been ^2Started.^7')
end)