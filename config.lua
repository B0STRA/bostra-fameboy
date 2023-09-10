Config = {}

-- Which translation you wish to use ?
Config.frameworkObj = "QB" -- "QB" or "ESX" or "none" (if you don't use any framework it will execute by /fameboy)
Config.AdminOnly = true -- true or false to lock the /fameboy command to admins only

-- Emotes to use for the fameboy, RPEmotes or ScullyEmoteMenu, "RP" or "Scully" accordingly
Config.Emotes = "RP"

-- do not change unless you know what you're doing
Config.GPUList = {
	[1] = "ETX2080",
	[2] = "ETX1050",
	[3] = "ETX660",
}

-- do not change unless you know what you're doing
Config.CPUList = {
	[1] = "U9_9900",
	[2] = "U7_8700",
	[3] = "U3_6300",
	[4] = "BENTIUM",
}
Config.useArcades = true -- true or false to enable/disable arcade machines with Retro games list
Config.arcadeModelHashes = {
	{ hash = -165961666, coords = vector3(-1554.33, -450.19, 39.52), heading = 319.71 }, --Add props at coords or by model, 
	{ hash = -1501557515, coords = vector3(-1558.38, -446.76, 39.52), heading = 319.71 },
	{ hash = `prop_arcade_01` },
	{ hash = `ch_prop_arcade_degenatron_01a` },
	{ hash = `ch_prop_arcade_monkey_01a` },
	{ hash = `ch_prop_arcade_penetrator_01a` },
	{ hash = `ch_prop_arcade_street_01a` },
	{ hash = `ch_prop_arcade_street_01a_off` },
	{ hash = `ch_prop_arcade_street_01b` },
	{ hash = `ch_prop_arcade_street_01b_off` },
	{ hash = `ch_prop_arcade_invade_01a` },
	{ hash = `ch_prop_arcade_street_01c` },
	{ hash = `ch_prop_arcade_street_01c_off` },
	{ hash = `ch_prop_arcade_street_01d` },
	{ hash = `ch_prop_arcade_street_01d_off` },
	{ hash = `ch_prop_arcade_street_02b` },
	{ hash = `ch_prop_arcade_wizard_01a` },
	{ hash = `sum_prop_arcade_qub3d_01a` },
	{ hash = `vw_prop_vw_arcade_01a` },
	{ hash = `vw_prop_vw_arcade_02a` },
	{ hash = `vw_prop_vw_arcade_02b` },
	{ hash = `vw_prop_vw_arcade_02c` },
	{ hash = `vw_prop_vw_arcade_02d` },
}

-- game list for gaming machine
Config.GamingMachine = {
	-- emulatorjs powers this second page, it takes in a rom url, a "core" type (eg nes, snes, etc) a game name, and an id for network play (yep! some cores support network play!)
	-- for more info see :
	-- https://github.com/ethanaobrien/emulatorjs/tree/main/docs
	-- some cores require a bios, you may pass it in like this
	{
		name = "Pokemon Emerald",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s&bios=%s",
			"https://serve.emulatorgames.net/roms/gameboy-advance/Pokemon%20-%20Emerald%20Version%20(U).zip",
			"gba",
			"PokemonEmerald-gba",
			"4203",
			"https://downloads.retrostic.com/bioses/gba_bios.zip"
		),
	},
	-- you may need to encode characters such as "&" in urls, or the query parser might get confused.
	{
		name = "Kirby & The Amazing Mirror",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s&bios=%s",
			"https://static.emulatorgames.net/roms/gameboy-advance/Kirby%20%26%20The%20Amazing%20Mirror%20(U).zip",
			"gba",
			"KirbyTheAmazingMirror-gba",
			"4204",
			"https://phoenixnap.dl.sourceforge.net/project/gameboid/gba_bios907607290.bin"
		),
	},
	{
		name = "The Legend Of Zelda - A Link To The Past",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s&bios=%s",
			"https://static.emulatorgames.net/roms/gameboy-advance/Legend%20of%20Zelda,%20The%20-%20A%20Link%20To%20The%20Past%20Four%20Swords%20(U)%20[!].zip",
			"gba",
			"LegendOfZeldaALinkToThePast-gba",
			"4206",
			"https://phoenixnap.dl.sourceforge.net/project/gameboid/gba_bios907607290.bin"
		),
	},
	{
		name = "Super Mario Advance 4 - Super Mario Bros. 3",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s&bios=%s",
			"https://serve.emulatorgames.net/roms/gameboy-advance/Super%20Mario%20Advance%204%20-%20Super%20Mario%20Bros.%203%20(U)%20(V1.1).zip",
			"gba",
			"SuperMarioAdvance4-SuperMarioBros.3-gba",
			"4207",
			"https://phoenixnap.dl.sourceforge.net/project/gameboid/gba_bios907607290.bin"
		),
	},
	{
		name = "Sonic Advance",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s",
			"https://server.emulatorgames.net/roms/gameboy-advance/Sonic%20Advance%20(U)%20[!].zip",
			"gba",
			"SonicAdvance-gba",
			"4210"
		),
	},
	{
		name = "Pokemon - Yellow",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s",
			"https://serve.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Yellow%20Version%20(UE)%20[C][!].zip",
			"gbc",
			"PokemonYellow-gbc",
			"4210"
		),
	},
}

-- game list for retro machine
Config.RetroMachine = {
	{
		name = "Uno",
		link = "https://duowfriends.eu/",
	},
	{
		name = "Contra III",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s",
			"https://static.emulatorgames.net/roms/super-nintendo/Contra%20III%20-%20The%20Alien%20Wars%20(U)%20[!].zip",
			"snes",
			"Contraiii-snes",
			"4205"
		),
	},
	{
		name = "Circus Charlie",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s",
			"https://www.retrogames.cz/NES/Circus_Charlie.nes",
			"nes",
			"Circus_Charlie-nes",
			"4201"
		),
	},
}

-- game list for super console
Config.SuperMachine = {
	{
		name = "Wolfenstein 3D",
		link = string.format(
			"nui://bostra-fameboy/html/msdos.html?url=%s&params=%s",
			"https://www.retrogames.cz/dos/zip/Wolfenstein3D.zip",
			"./WOLF3D.EXE"
		),
	},
	{
		name = "Castlevania Aria Of Sorrow",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s&bios=%s",
			"https://serve.emulatorgames.net/roms/gameboy-advance/Castlevania%20-%20Aria%20of%20Sorrow%20GBA.zip",
			"gba",
			"Castlevania-AriaOfSorrow-gba",
			"4208",
			"https://phoenixnap.dl.sourceforge.net/project/gameboid/gba_bios907607290.bin"
		),
	},
	{
		name = "Metroid Zero Mission",
		link = string.format(
			"nui://bostra-fameboy/html/ejs.html?url=%s&params=%s&name=%s&id=%s&bios=%s",
			"https://static.emulatorgames.net/roms/gameboy-advance/Metroid%20-%20Zero%20Mission%20(U)%20[!].zip",
			"gba",
			"Metroid-ZeroMission-gba",
			"4209",
			"https://phoenixnap.dl.sourceforge.net/project/gameboid/gba_bios907607290.bin"
		),
	},
}

for i = 1, #Config.RetroMachine do
	table.insert(Config.SuperMachine, Config.RetroMachine[i])
end

for i = 1, #Config.GamingMachine do
	table.insert(Config.SuperMachine, Config.GamingMachine[i])
end
