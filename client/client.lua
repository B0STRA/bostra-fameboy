ConsoleOpen = false
function DestroyProp(entity)
	SetEntityAsMissionEntity(entity)
	Wait(5)
	DetachEntity(entity, true, true)
	Wait(5)
	DeleteEntity(entity)
	DeleteObject(entity)
	ExecuteCommand("propstuck")
end
function OpenConsoleMenu(listGames, console_)
	local FameBoy = {}
	local console = console_
	local index = 0
	for _, value in pairs(listGames) do
		index = index + 1
		FameBoy[#FameBoy + 1] = {
			title = value.name,
			event = "bostra-fameboy:client:startGame",
			icon = "gamepad",
			args = {
				game = value.link,
				gpu = console.consoleGPU,
				cpu = console.consoleCPU,
			},
		}
	end
	lib.registerContext({
		id = "arcade_menu",
		title = "Fame Boy:",
		icon = "gamepad",
		iconColor = "#ff0000",
		onExit = function()
			ClearPedTasks(PlayerPedId())
			DestroyProp(FameboyProp)
		end,
		options = FameBoy,
	})
	lib.showContext("arcade_menu")
end

function StartScene(type)
	if type == "console" then
		local model = "fameboy"
		lib.requestAnimDict("amb@code_human_wander_texting_fat@male@base")
		lib.requestModel(model)
		FameboyProp = CreateObject(model, GetEntityCoords(PlayerPedId()), true, true, false)
		AttachEntityToEntity(FameboyProp,PlayerPedId(),90,-0.012811991906801,-0.0047054325280712,-0.062918639160292,0,0,0,true,true,false,true,1,true)
		TaskPlayAnim(PlayerPedId(),"amb@code_human_wander_texting_fat@male@base","static",8.0,8.0,-1,1,0,false,false,false)
		ConsoleOpen = true
	elseif type == "arcade" then
		lib.requestAnimDict("anim_casino_a@amb@casino@games@arcadecabinet@maleright")
		TaskPlayAnim(PlayerPedId(),"anim_casino_a@amb@casino@games@arcadecabinet@maleright","insert_coins",8.0,8.0,-1,1,0,false,false,false)
		Wait(2700)
		TaskPlayAnim(PlayerPedId(),"anim_casino_a@amb@casino@games@arcadecabinet@maleright","playidle_v2",8.0,8.0,-1,1,0,false,false,false)
		ConsoleOpen = true
	end
end

RegisterNetEvent("bostra-fameboy:client:startGame", function(data)
	ConsoleOpen = true
	SendNUIMessage({
		type = "on",
		game = data.game,
		gpu = data.gpu,
		cpu = data.cpu,
	})
	SetNuiFocus(true, true)
end)

RegisterNetEvent("bostra-fameboy:open:console", function(console, type)
	StartScene(type)
	OpenConsoleMenu(console.consoleType, console)
	StartScene(type)
end)

RegisterNetEvent("bostra-fameboy:close:console", function()
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
		DestroyProp(FameboyProp)
	end
	DestroyProp(FameboyProp)
	ConsoleOpen = false
end)

RegisterNUICallback("exit", function()
	TriggerEvent("bostra-fameboy:close:console")
	DestroyProp(FameboyProp)
end)

local retroconsole = {
	consoleType = Config.RetroMachine,
	consoleGPU = Config.GPUList[1],
	consoleCPU = Config.CPUList[1],
}

if Config.useArcades then
	for _, arcadeData in ipairs(Config.arcadeModelHashes) do
		local modelHash = arcadeData.hash
		local coords = arcadeData.coords
		local heading = arcadeData.heading
		if Config.Target == "qb" then
			if arcadeData.coords ~= nil then
				exports["qb-target"]:AddBoxZone("arcade_" .. modelHash, coords, 1.5, 1.6, {
					name = "arcade_" .. modelHash,
					heading = heading,
					debugPoly = Config.Debug,
					minZ = coords.z - 1.0,
					maxZ = coords.z + 1.0,
				}, {
					options = {
						{
							num = 1,
							icon = "fas fa-gamepad",
							label = "Play The Arcade Games",
							targeticon = "fas fa-gamepad",
							action = function(entity)
								if IsPedAPlayer(entity) then
									return false
								end
								TriggerEvent("bostra-fameboy:open:console", retroconsole, "arcade")
							end,
						},
					},
					distance = 2.5,
				})
			else
				exports["qb-target"]:AddTargetModel(modelHash, {
					options = {
						{
							num = 1,
							icon = "fas fa-gamepad",
							label = "Play The Arcade Games",
							targeticon = "fas fa-gamepad",
							action = function(entity)
								if IsPedAPlayer(entity) then
									return false
								end
								TriggerEvent("bostra-fameboy:open:console", retroconsole, "arcade")
							end,
						},
					},
					distance = 2.5,
				})
			end
		elseif Config.Target == "ox" then
			if arcadeData.coords ~= nil then
				local params = {

					coords = coords,
					size = { 1.0, 1.0, 4.0 },
					rotation = heading,
					debug = Config.Debug,
					drawSprite = false,
					options = {
						label = "Play The Arcade Games",
						name = "arcade_" .. modelHash,
						icon = "fas fa-gamepad",
						distance = 2.5,
						onExit = function()
							ClearPedTasks(PlayerPedId())
						end,
						onSelect = function()
							TriggerEvent("bostra-fameboy:open:console", retroconsole, "arcade")
						end,
					},
				}
				exports.ox_target:addBoxZone(params)
			else
				local options = {
					{
						label = "Play The Arcade Games",
						name = "arcade_" .. modelHash,
						icon = "fas fa-gamepad",
						iconColor = "#DA9110",

						distance = 2.5,
						onExit = function()
							ClearPedTasks(PlayerPedId())
						end,
						onSelect = function()
							TriggerEvent("bostra-fameboy:open:console", retroconsole, "arcade")
						end,
					},
				}
				exports.ox_target:addModel(modelHash, options)
			end
		end
	end
end

AddEventHandler("onResourceStop", function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent("bostra-fameboy:close:console")
	end
end)
