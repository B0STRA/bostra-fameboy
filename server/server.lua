local retroconsole = {
	consoleType = Config.RetroMachine,
	consoleGPU = Config.GPUList[1],
	consoleCPU = Config.CPUList[1],
}

local gamingconsole = {
	consoleType = Config.GamingMachine,
	consoleGPU = Config.GPUList[1],
	consoleCPU = Config.CPUList[1],
}

local superconsole = {
	consoleType = Config.SuperMachine,
	consoleGPU = Config.GPUList[1],
	consoleCPU = Config.CPUList[1],
}

if Config.frameworkObj == "QB" then
	QBCore = exports["qb-core"]:GetCoreObject()

	--/command to test all games as the fameboy advanced console
	QBCore.Commands.Add("testgames", "Test Fameboy", {}, false, function(source)
		local src = source
		TriggerClientEvent("bostra-fameboy:open:console", src, superconsole)
	end, "admin")

	--Creates 3 types of fameboy consoles
	QBCore.Functions.CreateUseableItem("retrofameboy", function(src, item)
		TriggerClientEvent("bostra-fameboy:open:console", src, retroconsole, "console")
	end)

	QBCore.Functions.CreateUseableItem("fameboy", function(src, item)
		TriggerClientEvent("bostra-fameboy:open:console", src, gamingconsole, "console")
	end)

	QBCore.Functions.CreateUseableItem("fameboyadvanced", function(src, item)
		TriggerClientEvent("bostra-fameboy:open:console", src, superconsole, "console")
	end)
elseif Config.frameworkObj == "ESX" then
	ESX = exports["es_extended"]:getSharedObject()

	RegisterCommand("fameboy", function(source)
		local src = source
		TriggerClientEvent("bostra-fameboy:open:console", src, superconsole)
	end, Config.AdminOnly)

	--Creates 3 types of fameboy consoles
	ESX.RegisterUsableItem("retrofameboy", function(source)
		TriggerClientEvent("bostra-fameboy:open:console", source, retroconsole, "console")
	end)

	ESX.RegisterUsableItem("fameboy", function(source)
		TriggerClientEvent("bostra-fameboy:open:console", source, gamingconsole, "console")
	end)

	ESX.RegisterUsableItem("fameboyadvanced", function(source)
		TriggerClientEvent("bostra-fameboy:open:console", source, superconsole, "console")
	end)
elseif Config.frameworkObj == "none" then
	RegisterCommand("fameboy", function(source)
		local src = source
		TriggerClientEvent("bostra-fameboy:open:console", src, superconsole, "console")
	end, Config.AdminOnly)
end
