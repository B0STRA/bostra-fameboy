ConsoleOpen = false
function OpenConsoleMenu(listGames, console_)
	local FameBoy = {}
    local console = console_
    local index = 0
    for key, value in pairs(listGames) do
        index = index + 1
		FameBoy[#FameBoy + 1] = {
			title = value.name,
			event = "bostra-fameboy:client:startGame",
			icon = "gamepad",
			args = {
				game = value.link,
				gpu = console.consoleGPU,
				cpu = console.consoleCPU
			}
		}
    end
	lib.registerContext({
		id = "arcade_menu",
		title = "Fame Boy:",
		icon = "gamepad",
		iconColor = "#ff0000",
		onExit = function()
		ClearPedTasks(PlayerPedId())
		DeleteEntity(FameboyProp)
		end,
		options = FameBoy
	})
	lib.showContext("arcade_menu")
end

function StartScene()
	local model = "fameboy"
	RequestAnimDict("amb@code_human_wander_texting_fat@male@base")
	while not HasAnimDictLoaded("amb@code_human_wander_texting_fat@male@base") do
		Wait(0)
	end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
	FameboyProp = CreateObject(model, GetEntityCoords(PlayerPedId()), true, true, false)
	AttachEntityToEntity(FameboyProp, PlayerPedId(), 90, -0.012811991906801, -0.0047054325280712, -0.062918639160292, 0, 0, 0, true, true, false, true, 1, true)
	TaskPlayAnim(PlayerPedId(), "amb@code_human_wander_texting_fat@male@base", "static", 8.0, 8.0, -1, 1, 0, false, false, false)
	ConsoleOpen = true
end

RegisterNetEvent("bostra-fameboy:client:startGame", function(data)
	ConsoleOpen = true
	SendNUIMessage({
		type = "on",
		game = data.game,
		gpu = data.gpu,
		cpu = data.cpu
	})
	SetNuiFocus(true, true)
end)

RegisterNetEvent('bostra-fameboy:open:console', function(console)
	OpenConsoleMenu(console.consoleType, console)
	StartScene()
end)

RegisterNetEvent('bostra-fameboy:close:console', function()
	if ConsoleOpen then
		SendNUIMessage({
			type = "off",
			game = "",
		})
		SetNuiFocus(false, false)
		local ped = PlayerPedId()
		EnableAllControlActions(0)
		EnableAllControlActions(1)
		EnableAllControlActions(2)
		ClearPedTasks(ped)
	end
	SetEntityAsNoLongerNeeded(FameboyProp)
	DeleteEntity(FameboyProp)
	ConsoleOpen = false
end)

RegisterNUICallback('exit', function()
	TriggerEvent('bostra-fameboy:close:console')
end)

local retroconsole = {
    consoleType = Config.RetroMachine,
    consoleGPU = Config.GPUList[1],
    consoleCPU = Config.CPUList[1],
}

if Config.useArcades then
CreateThread(function()
    for _, arcadeData in ipairs(Config.arcadeModelHashes) do
        local modelHash = arcadeData.hash
        local coords = arcadeData.coords
        local heading = arcadeData.heading
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(0)
        end
		if coords then
        exports['qb-target']:AddBoxZone("arcade_" .. modelHash, coords, 1.5, 1.6, {
            name = "arcade_" .. modelHash,
            heading = heading,
            debugPoly = false,
            minZ = 38,
            maxZ = 41,
        }, {
            options = {
                {
                    num = 1,
                    icon = 'fas fa-gamepad',
                    label = 'Play The Arcade Games',
                    targeticon = 'fas fa-gamepad',
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end 
                        TriggerEvent('bostra-fameboy:open:console', retroconsole)
                    end,
                }
            },
            distance = 2.5,
        })
	else
		exports['qb-target']:AddTargetModel(modelHash, {
			options = {
				{
					num = 1,
					icon = 'fas fa-gamepad',
					label = 'Play The Arcade Games',
					targeticon = 'fas fa-gamepad',
					action = function(entity)
						if IsPedAPlayer(entity) then return false end 
						TriggerEvent('bostra-fameboy:open:console', retroconsole)
					end,
				}
			},
			distance = 2.5,
		})
	end
    end
end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		DeleteEntity(FameboyProp)
		TriggerEvent('bostra-fameboy:close:console')
	end
end)