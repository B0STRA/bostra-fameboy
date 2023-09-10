# Bostra-Fameboy
![fameboy](https://github.com/B0STRA/bostra-fameboy/assets/119994243/92f10a59-e750-4791-b057-67f5ba3b08a2)




**Features:**

* Fully Open-Source
* Customizable
* Easy to configure
* Simple resource with 0.0ms resmon idle, up to 0.02 when starting ptfx. 
* Standalone Framework-wise as there's no framework dependencies if not using item or QB notify. QB/ESX item setup, I don't use esx so test or pr at your will. 
* Command or Item use.
* Custom prop. 


# [Preview-Video](https://streamable.com/jxw9fn)



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


 <h1>Support</h1>
<u1>

[Bostra-Development Discord](https://dsc.gg/bostra)

</u1>

<u1>

[md-scripts Discord](https://discord.gg/RVx8nVwcEG)

</u1>
