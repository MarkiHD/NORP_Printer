Config = {}

-- Sounds
Config.PrinterStartSound = '/assets/sounds/drucker.wav'
Config.InkLowSound = '/assets/sounds/tinte.wav'

-- Items
Config.PrinterInkItem = 'drucker-tinte'
Config.GreenCardItem = 'greencard'

-- PIN codes
Config.Pins = {
    ['4655'] = {
        menuTitle = 'Greencard drucken',
        document = Config.GreenCardItem,
    },
}