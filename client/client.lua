function openConsoleMenu(listGames, console_)
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
		if Config.Emotes == "RP" then
			exports.rpemotes:EmoteCancel(forceCancel)
		elseif Config.Emotes == "Scully" then
			exports.scully_emotemenu:CancelAnimation(forceCancel)
		end
		end,
		options = FameBoy
	})

	lib.showContext("arcade_menu")
end

RegisterNetEvent("bostra-fameboy:client:startGame", function(data)
	usingConsole = true
	SendNUIMessage({
		type = "on",
		game = data.game,
		gpu = data.gpu,
		cpu = data.cpu
	})
	SetNuiFocus(true, true)
end)

RegisterNetEvent('bostra-fameboy:open:console', function(console)
	openConsoleMenu(console.consoleType, console)
	if Config.Emotes == "RP" then
		exports.rpemotes:EmoteCommandStart('fameboy', 0)
	elseif Config.Emotes == "Scully" then
		exports.scully_emotemenu:PlayByCommand('fameboy')
	end
end)

RegisterNetEvent('bostra-fameboy:close:console', function()
	if usingConsole then
		SendNUIMessage({
			type = "off",
			game = "",
		})
		SetNuiFocus(false, false)
		local ped = PlayerPedId()
		EnableAllControlActions(0)
		EnableAllControlActions(1)
		EnableAllControlActions(2)
		FreezeEntityPosition(ped, false)
		ClearPedTasks(ped)
		if Config.Emotes == "RP" then
			exports.rpemotes:EmoteCancel(forceCancel)
		elseif Config.Emotes == "Scully" then
			exports.scully_emotemenu:CancelAnimation(forceCancel)
		end
		usingConsole = false
	end
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

        -- Request the model
        RequestModel(modelHash)
        
        -- Wait for the model to load
        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        -- Add the boxzone to the arcade model
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
