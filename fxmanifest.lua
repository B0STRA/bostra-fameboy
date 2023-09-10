fx_version 'adamant'
games { 'gta5' }

author 'Bostra'
description 'Fameboy Game Console System'
version '2.0.0'
lua54 'yes'

shared_scripts {
	"@ox_lib/init.lua"
}

client_scripts {
	"locale.lua",
	"locales/*.lua",
	"config.lua",
	"client/client.lua",
}

server_scripts {
	"locale.lua",
	"locales/*.lua",
	"config.lua",
	"server/server.lua",
}

files {
	"html/css/style.css",
	"html/css/reset.css",
	"html/css/img/monitor.png",
	"html/*.html",
	"html/scripts/listener.js",
	"stream/*.*",
}

data_file 'DLC_ITYP_REQUEST' 'stream/fameboy.ytyp'



ui_page "html/index.html"

