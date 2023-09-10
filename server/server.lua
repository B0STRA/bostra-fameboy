
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
QBCore = exports['qb-core']:GetCoreObject()

--/command to test all games as the fameboy advanced console
QBCore.Commands.Add('testgames', 'Test Fameboy', {}, false, function(source)
    local src = source
    TriggerClientEvent('bostra-fameboy:open:console', src, superconsole)
end, 'admin')

--Creates 3 types of fameboy consoles
QBCore.Functions.CreateUseableItem("retrofameboy", function(src,item)
    TriggerClientEvent('bostra-fameboy:open:console', src, retroconsole)
end)

QBCore.Functions.CreateUseableItem("fameboy", function(src,item)
    TriggerClientEvent('bostra-fameboy:open:console', src, gamingconsole)
end)

QBCore.Functions.CreateUseableItem("fameboyadvanced", function(src,item)
    TriggerClientEvent('bostra-fameboy:open:console', src, superconsole)
end)

elseif Config.frameworkObj == "ESX" then
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand('fameboy', function(source)
    local src = source
    TriggerClientEvent('bostra-fameboy:open:console', src, superconsole)
end, Config.AdminOnly)

--Creates 3 types of fameboy consoles
ESX.RegisterUsableItem("retrofameboy", function(source)
    TriggerClientEvent('bostra-fameboy:open:console', source, retroconsole)
end)

ESX.RegisterUsableItem("fameboy", function(source)
    TriggerClientEvent('bostra-fameboy:open:console', source, gamingconsole)
end)

ESX.RegisterUsableItem("fameboyadvanced", function(source)
    TriggerClientEvent('bostra-fameboy:open:console', source, superconsole)
end)

elseif Config.frameworkObj == "none" then


RegisterCommand('fameboy', function(source)
    local src = source
    TriggerClientEvent('bostra-fameboy:open:console', src, superconsole)
end, Config.AdminOnly)
end

