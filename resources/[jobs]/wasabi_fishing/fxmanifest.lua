-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Wasabi ESX Skill Based Fishing'
author 'wasabirobby#5110'

version '2.0.2'

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'configuration/*.lua'
}

dependencies {
    'es_extended',
    'ox_lib'
}
