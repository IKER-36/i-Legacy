fx_version 'cerulean'
game 'gta5'
version '2.0.0'
lua54 'yes'

-- QBUS VERSION

ui_page 'nui/index.html'
files {
    'nui/**'
}

client_scripts {

    -- Config
    'shared/Config.lua',
    
    -- Client classes
    'client/classes/PedMenu.lua',
    
    -- Client main code
    'client/Main.lua'
    
}

server_scripts {

    -- Config
    'shared/Config.lua',

    -- Mysql Async dependencie
    '@oxmysql/lib/MySQL.lua',
    
    -- Server classes
    'server/classes/PedManarger.lua',
    'server/classes/Menu.lua',
    
    -- Server main code
    'server/Main.lua'

}

dependencies {
    '/server:4752'
}

escrow_ignore { 'shared/Config.lua' }
dependency '/assetpacks'