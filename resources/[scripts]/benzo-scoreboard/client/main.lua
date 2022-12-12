--- For Support join https://discord.gg/pyKDCByzUk

local ServerSlots = 100
CreateThread(function()
    ESX.TriggerServerCallback("benzo-scoreboard:GetSlotCount", function(SlotCount)
        ServerSlots = SlotCount
    end)
end)

local function Menu()
    ESX.TriggerServerCallback("benzo-Scoreboard:GetPlayers", function(SentPlayers, PlayerCount)
    local Elements = {{
        unselectable = true,
        icon = "fas fa-info-circle",
        title = "Jugadores Activos: " .. PlayerCount .. "/" ..ServerSlots
    }}

        for i=1, #SentPlayers do
            Elements[#Elements + 1] = {
                title = SentPlayers[i].FiveMName,
                icon = "fa-solid fa-person",
                value = "player",
                Data = SentPlayers[i]
            }
        end
        Elements[#Elements + 1] = {
            icon = "fa-solid fa-xmark",
            title = "Cerrar",
            value = "close"
        }
            ESX.OpenContext("right", Elements, function(menu, element)
                if element.value == "player" then
                    local SelectedPlayer = element.Data
                    local PlayerHealth = SelectedPlayer.Health
                    local PlayerArmour = SelectedPlayer.Armour
                    local Options = {{
                        unselectable = true,
                        icon = "fa-solid fa-person",
                        title = "Player: ".. element.title
                    }}
                    if Config.ShowID then 
                        Options[#Options + 1] = {
                            icon = "fa-regular fa-id-badge",
                            title = "ID: " .. SelectedPlayer.Id
                        }
                    end
                    if Config.ShowName then 
                        Options[#Options + 1] = {
                            icon = "fa-solid fa-signature",
                            title = "RP Name: " .. SelectedPlayer.Name
                        }
                    end
                    if Config.ShowHealth then 
                        Options[#Options + 1] = {
                            icon = "fa-solid fa-signature",
                            title = "Health: " .. PlayerHealth .. "%"
                        }
                    end
                    if Config.ShowArmour then 
                        Options[#Options + 1] = {
                            icon = "fa-solid fa-signature",
                            title = "Armour: " .. PlayerArmour .. "%"
                        }
                    end
                    if Config.ShowPing then 
                        Options[#Options + 1] = {
                            icon = "fa-solid fa-rss",
                            title = "Ping: " .. SelectedPlayer.Ping
                        }
                    end
                    if Config.ShowJob then 
                        Options[#Options + 1] = {
                            icon = "fa-solid fa-people-line",
                            title = "Job: " .. SelectedPlayer.Job,
                            description = Config.ShowJobGrade and "Grade: " .. SelectedPlayer.JobGrade or ""
                        }
                    end
                    if Config.ShowGroup then 
                        Options[#Options + 1] = {
                        icon = "fa-solid fa-people-group",
                        title = "Group: " .. SelectedPlayer.Group,
                        }
                    end
                    Options[#Options + 1] = {
                        icon = "fa-solid fa-arrow-left",
                        title = "Return",
                        value = "return"
                    }
                    Options[#Options + 1] = {
                        icon = "fa-solid fa-xmark",
                        title = "Close",
                        value = "close"
                    }
                    ESX.RefreshContext(Options)
                elseif element.value == "close" then
                    ESX.CloseContext()
                elseif element.value == "return" then
                    ESX.RefreshContext(Elements)
                end
            end)
    end, function(menu)
    end)
end

ESX.RegisterInput("ScoreBoard", "[B-Scoreboard] Open Scoreboard Menu", "keyboard", Config.Key, Menu)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    ESX.CloseContext()
end)
