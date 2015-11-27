--File creato automaticamente da Miro LUA
red = Color.new(0, 0, 255)
white = Color.new(255, 0, 0)
System.currentDirectory("ms0:/psp/game/dc1/system")
sfondo = Image.load("gs.png")
--Variables
Select = 1 
maxSelect = 6

oldpad = Controls.read() 
--loop 
while true do 
pad = Controls.read() 
screen:clear() 
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)
--checar decicion 
if pad:up() and oldpad:up() ~= pad:up() then 
Select = Select - 1 
end 
if pad:down() and oldpad:down() ~= pad:down() then 
Select = Select + 1 
end 
if Select > maxSelect then 
Select = 1 
elseif Select <= 0 then 
Select = maxSelect 
end 

if Select == 1 then 
screen:print(136,76,"Gestione CPU", red) 
screen:print(136,96,"Connessione USB",white) 
screen:print(136,116,"Varie Manutenzione",white) 
screen:print(136,136,"Informazioni PSP",white) 
screen:print(136,156,"Extra InfoPSP",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 2 then 
screen:print(136,76,"Gestione CPU", white) 
screen:print(136,96,"Connessione USB",red) 
screen:print(136,116,"Varie Manutenzione",white) 
screen:print(136,136,"Informazioni PSP",white) 
screen:print(136,156,"Extra InfoPSP",white)  
screen:print(136,176,"Indietro",white) 
end 
if Select == 3 then 
screen:print(136,76,"Gestione CPU", white) 
screen:print(136,96,"Connessione USB",white) 
screen:print(136,116,"Varie Manutenzione",red) 
screen:print(136,136,"Informazioni PSP",white) 
screen:print(136,156,"Extra InfoPSP",white)
screen:print(136,176,"Indietro",white)   
end 
if Select == 4 then 
screen:print(136,76,"Gestione CPU", white) 
screen:print(136,96,"Connessione USB",white) 
screen:print(136,116,"Varie Manutenzione",white) 
screen:print(136,136,"Informazioni PSP",red)  
screen:print(136,156,"Extra InfoPSP",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 5 then 
screen:print(136,76,"Gestione CPU", white) 
screen:print(136,96,"Connessione USB",white) 
screen:print(136,116,"Varie Manutenzione",white) 
screen:print(136,136,"Informazioni PSP",white)  
screen:print(136,156,"Extra InfoPSP",red)  
screen:print(136,176,"Indietro",white) 
end 
if Select == 6 then 
screen:print(136,76,"Gestione CPU", white) 
screen:print(136,96,"Connessione USB",white) 
screen:print(136,116,"Varie Manutenzione",white) 
screen:print(136,136,"Informazioni PSP",white)  
screen:print(136,156,"Extra InfoPSP",white)  
screen:print(136,176,"Indietro",red)  
end 

if pad:cross() and not oldpad:cross() and Select == 1 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("7.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 2 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("6.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 3 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("8.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 4 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("12.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 5 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("13.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 6 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("1.lua")
end 

screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end