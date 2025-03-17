# NORP_Printer
A FiveM resource that adds a functional printer system with PIN code security.

## Features
- Printer interaction using ox_target
- PIN code security system for document printing
- Printer ink management system
- Sound effects for printer actions
- Multiple document copies printing capability

## Dependencies
- ESX Framework
- ox_lib
- ox_target
- InteractSound

## Installation
1. Place the resource in your FiveM resources folder
2. Add `ensure NORP_Printer` to your server.cfg
3. Configure the `config.lua` file to your needs

## Configuration
The printer system can be configured in `config.lua`:
- Custom PIN codes
- Document types
- Required items
- Sound effects

## Usage
1. Approach a printer in-game
2. Start the printer using the target option
3. Fill ink if needed
4. Enter PIN code to print documents
5. Select number of copies

## Default Items
- Printer Ink: `drucker-tinte`
- Green Card: `greencard`

## Version
Current Version: 1.0.0

## Author
Created by Marki
