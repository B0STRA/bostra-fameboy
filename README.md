# Bostra-Fameboy
![fameboy](https://github.com/B0STRA/bostra-fameboy/assets/119994243/6430173e-0047-4817-beaa-ed882392946a)




**Features:**

* Fully Open-Source
* Customizable
* Easy to configure
* Simple resource with 0.0ms resmon idle, up to 0.02 when starting ptfx. 
* Standalone Framework-wise as there's no framework dependencies if not using item or QB notify. QB/ESX item setup, I don't use esx so test or pr at your will. 
* Command or Item use.
* Custom prop. 
* Arcade Model for basic games, OX/QB Target support. 
* Unique animations per console or arcade machine use. 


# [Preview-Video](https://medal.tv/games/gta-v/clips/U2XYQKE7xqxUn/N3wBf16pZo6T)



# How To Install
* Drag and drop `bostra-fameboy`
* Ensure after ox_lib, and framework if using items.
* Add to items.lua
* qb/lj/ps-inventory goes into qb-core/shared/items.lua
```lua
	['fameboy']                   = { ['name'] = 'fameboy', ['label'] = 'Fameboy', ['weight'] = 125,
		['type'] = 'item', ['image'] = 'fameboy.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true,
		['combinable'] = { accept = { 'trojan_usb' }, reward = 'fameboyadvanced',
		anim = { ['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@',
			['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Doing techy stuff...', ['timeOut'] = 7500, } }, ['description'] = 'The Famed and fabled Fameboy' },
	["brokenretrofameboy"]        = { ["name"] = "brokenretrofameboy", ["label"] = "Broken Retro Fameboy", ["weight"] = 200,
		["type"] = "item",
		["image"] = "retrofameboy.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false,
		['combinable'] = { accept = { 'electronickit' }, reward = 'retrofameboy',
			anim = { ['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@',
				['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Doing techy stuff...', ['timeOut'] = 7500, } },
		["description"] = "The electronics look fried..." },
	['retrofameboy']              = { ['name'] = 'retrofameboy', ['label'] = 'Retro Fameboy', ['weight'] = 125,
		['type'] = 'item', ['image'] = 'retrofameboy.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true,
		['combinable'] = { accept = { 'usb_drive' }, reward = 'fameboy',
		anim = { ['dict'] = 'anim@amb@business@weed@weed_inspecting_high_dry@',
			['lib'] = 'weed_inspecting_high_base_inspector', ['text'] = 'Doing techy stuff...', ['timeOut'] = 7500, } }, ['description'] = 'The classic and reliable Retro Fameboy' },
	['fameboyadvanced']           = { ['name'] = 'fameboyadvanced', ['label'] = 'Fameboy Advanced', ['weight'] = 125,
		['type'] = 'item', ['image'] = 'fameboyadvanced.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true,
		['combinable'] = nil, ['description'] = 'The advanced Fameboy model' },
```

# How to Use
* Use ```/fameboy``` if not locked to ```Config.AdminOnly```, or item-use.


# Dependencies
[ox_lib](https://github.com/overextended/ox_lib)


# Troubleshooting & Support
[Mustache Scripts - Discord](https://discord.gg/RVx8nVwcEG)

# Tip / Commission Me
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/A0A46AZW4)
