fx_version 'adamant'

game 'gta5'

description 'ESX Addon Inventory'
lua54 'yes'
version '1.8.5'

server_scripts {
	'@es_extended/imports.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/classes/addoninventory.lua',
	'server/main.lua'
}

dependency 'es_extended'
