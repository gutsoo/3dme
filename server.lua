QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, target, meOrdo)
	local src = source
	local srcCoords = GetEntityCoords(GetPlayerPed(src))
	local targetCoords = GetEntityCoords(GetPlayerPed(target))
	local dist = #(srcCoords - targetCoords)
	if dist > 30.0 then 
		print('^1'..src..' - '..GetPlayerIdentifier(src, 0)..' - '..text..'^0')
		return
	end
	local xPlayer = QBCore.Functions.GetPlayer(src)
	local name = xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname
	if xPlayer ~= nil then
		if meOrdo == '/me' then
			TriggerClientEvent('3dme:triggerDisplay', target, text, src, meOrdo)
			TriggerClientEvent('chat:addMessage', target, {
				template = '<div class="chat-message me"><b>{0}</b></div>',
				args = {'ME | '..name..': '..text}
			})
		elseif meOrdo == '/do' then
			TriggerClientEvent('3dme:triggerDisplay', target, text, src, meOrdo)
			TriggerClientEvent('chat:addMessage', target, {
				template = '<div class="chat-message do"><b>{0}</b></div>',
				args = {'DO | '..name..': '..text}
			})
		else
			TriggerClientEvent('chat:addMessage', target, {
				template = '<div class="chat-message ooc"><b>{0}</b></div>',
				args = {'OOC | '..name..': '..text}
			})
		end
	end
end)