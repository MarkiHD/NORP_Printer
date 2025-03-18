Config = {

-- Sounds
PrinterStartSound = '/assets/sounds/drucker.wav'
InkLowSound = '/assets/sounds/tinte.wav'

-- Items
PrinterInkItem = 'drucker-tinte'
GreenCardItem = 'greencard'

-- PIN codes
Pins = {
    ['4655'] = {
        menuTitle = 'Greencard drucken',
        document = Config.GreenCardItem,
    },
}

}    
