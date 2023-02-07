RegisterKeyMapping('lg_machinestore:KeyOpen_' .. config.key_open, 'Open Machine', 'keyboard', config.key_open)
RegisterCommand('lg_machinestore:KeyOpen_' .. config.key_open, function()
	local machine = checkClosesMachine()

	if machine then
		if #(types_machine.all_machines) > 0 then
			TriggerEvent("lg_machinestore:Open", types_machine.all_machines)
		else
			TriggerEvent("lg_machinestore:Open", types_machine[machine])
		end
	end
end)

CreateThread(function()
	local inside = false
	while true do
		local machine = checkClosesMachine()
		if machine and not inside then
			inside = true

			SendNUIMessage({
				hasNotify = true,
				notify = translate.TR_NOTIFY .. ' ' .. config.key_open
			})
		elseif not machine then
			inside = false
		end
		Wait(2000)
	end
end)

RegisterNetEvent('lg_machinestore:ConfirmPayment')
AddEventHandler('lg_machinestore:ConfirmPayment', function()
	SendNUIMessage({
		confirm = true
	})
end)

RegisterNetEvent('lg_machinestore:Open')
AddEventHandler('lg_machinestore:Open', function(products)
	SendNUIMessage({
		open = true,
		products = products
	})	
	SetNuiFocus(true, true)
end)

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false, false)
	cb('ok')
end)

RegisterNUICallback('confirmPayment', function(data, cb)
	TriggerServerEvent("lg_machinestore:ConfirmPayment", data)
	cb('ok')
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
	Wait(5000)
	
	SendNUIMessage({
        config = true,
        translate = translate,
        NameResource = {GetCurrentResourceName(),
		GetCurrentServerEndpoint()
		}
    })
end)

function checkClosesMachine()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local closest = nil
	local dist = 9999

	for i,k in pairs(props_machine) do
		local obj = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.5, GetHashKey(k), false)
		if obj ~= 0 then
			local coord = GetEntityCoords(obj)
			local calc = #(pos - coord)
			if dist > calc then
				dist = calc
				closest = k
			end
		end
	end

	return closest
end
