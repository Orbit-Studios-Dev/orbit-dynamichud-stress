fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'QBX Framework (qbx_hud) & Orbit Studios'
description 'Stress Addon for Orbit Studios Dynamic Hud'
version '0.0.1'

shared_script {
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua',
}

ox_libs {
    'cache',
}
