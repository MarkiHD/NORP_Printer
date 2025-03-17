local printerStarted = false
local inkLow = false

exports.ox_target:addModel({
    name = 'printer',
    options = {
        {
            label = 'Drucker starten',
            icon = 'fa-solid fa-print',
            onSelect = function()
                if not printerStarted then
                    printerStarted = true
                    TriggerEvent('printer:start')
                else
                    print('Drucker ist bereits gestartet.')
                end
            end,
        },
        {
            label = 'Tinte auffüllen',
            icon = 'fa-solid fa-tint',
            item = Config.PrinterInkItem,
            onSelect = function()
                if inkLow then
                    inkLow = false
                    print('Tinte wurde nachgefüllt.')
                else
                    print('Tinte ist noch voll.')
                end
            end,
        },
        {
            label = 'Dokumente drucken',
            icon = 'fa-solid fa-file',
            onSelect = function()
                if printerStarted and not inkLow then
                    TriggerEvent('printer:requestPIN')
                else
                    print('Drucker nicht bereit.')
                end
            end,
        }
    }
})

RegisterNetEvent('printer:start', function()
    TriggerServerEvent('printer:playSound', Config.PrinterStartSound)
    if math.random(1, 100) <= 20 then
        inkLow = true
        TriggerServerEvent('printer:playSound', Config.InkLowSound)
        print('Die Tinte ist leer!')
    else
        print('Drucker bereit.')
    end
end)

-- Request PIN input
RegisterNetEvent('printer:requestPIN', function()
    local input = exports.ox_lib:inputDialog('Gib die PIN ein:', {'PIN'})
    local pin = input and input['PIN']
    if Config.Pins[pin] then
        local menuOptions = {
            {
                label = Config.Pins[pin].menuTitle,
                value = Config.Pins[pin].document,
            }
        }
        local selectedDocument = exports.ox_lib:contextMenu(menuOptions)
        if selectedDocument then
            local copies = exports.ox_lib:inputDialog('Wie viele Kopien?', {'Anzahl'})
            TriggerServerEvent('printer:printDocument', selectedDocument, copies)
        end
    else
        print('Falsche PIN!')
    end
end)
