fx_version 'cerulean'
game 'gta5'

author 'GitHub: iBoss21'
description 'QB Detectors - The Lux Empire RP'
version '1.1.0' 

shared_scripts {
	'config.lua',
}

server_script {
	'config.lua',
	'server/main.lua',
}

client_scripts {
	'config.lua',
	'client/main.lua',
}

repository 'iBoss21/QB-Detector'
github 'https://github.com/iBoss21/QB-Detector'
brand 'The Lux Empire'
discord 'discord.gg/theluxempire'
live_server 'The Lux Empire RP'

dependency 'qb-core'

-- Update check
server_script 'update_check.lua'
