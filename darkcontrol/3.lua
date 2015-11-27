--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
red = Color.new(255, 0, 0)
white = Color.new(255, 255, 255)
sfondo = Image.load("hb.png")
--Variables
Select = 1 
maxSelect = 4

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

screen:print(136,76,"PSP Fusi Orari 2 di Gefa", red) 

screen:print(136,96,"Darkmanager",white) 
screen:print(136,116,"PaintMixer 2.5",white) 
screen:print(136,136,"Indietro",white) 
end 
if Select == 2 then 

screen:print(136,76,"PSP Fusi Orari 2 di Gefa", white) 

screen:print(136,96,"Darkmanager",red) 
screen:print(136,116,"PaintMixer 2.5",white) 
screen:print(136,136,"indietro",white) 
end 

if Select == 3 then 
screen:print(136,76,"PSP Fusi Orari 2 di Gefa", white) 

screen:print(136,96,"Darkmanager",white) 
screen:print(136,116,"PaintMixer 2.5",red) 
screen:print(136,136,"indietro",white) 
end 

if Select == 4 then 
screen:print(136,76,"PSP Fusi Orari 2 di Gefa", white) 
screen:print(136,96,"Darkmanager",white) 
screen:print(136,116,"PaintMixer 2.5",white) 
screen:print(136,136,"indietro",red) 
end 

if pad:cross() and not oldpad:cross() and Select == 1 then 
System.currentDirectory("ms0:/psp/game/dc1/system/hb/fo")
dofile("script.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 2 then
System.currentDirectory("")
dofile("2.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 3 then
System.currentDirectory("")
dofile("2.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 4 then
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("1.lua")
end 

screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end