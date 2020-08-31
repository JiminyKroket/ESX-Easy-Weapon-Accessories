local attachmentTypes = {'suppressor', 'flashlight', 'grip', 'yusuf'}

local ESX = nil
 
TriggerEvent('esx:getSharedObject', function( obj ) ESX = obj end)

for i = 1,#attachmentTypes do
	ESX.RegisterUsableItem(attachmentTypes[i], function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('eden_accesories:use', xPlayer.source, attachmentType[i])
		xPlayer.removeInventoryItem(attachmentType[i], 1)
	end)
end

RegisterServerEvent('eden_accesories:giveBack')
AddEventHandler('eden_accesories:giveBack', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, 1)
end)
