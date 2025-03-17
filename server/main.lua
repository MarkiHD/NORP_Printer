ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('printer:playSound', function(sound)
    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, sound)
end)

RegisterNetEvent('printer:printDocument', function(document, copies)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = Config.GreenCardItem
    if document == item then
        for i = 1, tonumber(copies) do
            xPlayer.addInventoryItem(item, 1)
        end
        TriggerClientEvent('printer:playSound', source, Config.PrinterStartSound)
    end
end)
