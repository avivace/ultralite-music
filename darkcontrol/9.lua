--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
red = Color.new(255, 0, 0)
white = Color.new(255, 255, 255)
System.currentDirectory("ms0:/psp/game/dc1/system")
sfondo = Image.load("cr.png")
--Variables
Select = 1 
maxSelect = 3

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
if pad:r() then System.quit() end


if Select == 1 then 
screen:print(170,116,"Special Thanks", red) 
screen:print(170,146,"Varie Info",white) 
screen:print(170,176,"Indietro",white) 
end 
if Select == 2 then 
screen:print(170,116,"Special Thanks", white) 
screen:print(170,146,"Varie Info",red) 
screen:print(170,176,"Indietro",white) 
end 
if Select == 3 then 
screen:print(170,116,"Special Thanks", white) 
screen:print(170,146,"Varie Info",white) 
screen:print(170,176,"Indietro",red) 
end 

if pad:cross() and not oldpad:cross() and Select == 1 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("10.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 2 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("11.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 3 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("1.lua")
end 
screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end