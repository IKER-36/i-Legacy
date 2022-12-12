Config = {}

Config.DrawDistance = 25.0
Config.ZoneSize = {x = 2.3, y = 2.3, z = 0.5}
Config.MarkerColor = {r = 212, g = 67, b = 91}
Config.MarkerType = 23
Config.Debug = ESX.GetConfig().EnableDebug

Config.Locale = GetConvar('esx:locale', 'es')

Config.Zones = {
  vector3(-544.91, -204.34, 37.25)
}

Config.Blip = {
  Enabled = true, 
  Sprite = 407, 
  Display = 4, 
  Scale = 0.8, 
  Colour = 48, 
  ShortRange = true
}
