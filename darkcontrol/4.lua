--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
red = Color.new(255, 0, 0)
white = Color.new(255, 255, 255)
System.currentDirectory("ms0:/psp/game/dc1/system")
sfondo = Image.load("umd.png")
--Variables
Select = 1 
maxSelect = 4 

oldpad = Controls.read() 
--loop 
while true do 
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)

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
screen:print(136,76,"Avvia UMD", red) 
screen:print(136,96,"Dump UMD in ms",white) 
screen:print(136,116,"Stop UMD",white) 
screen:print(136,136,"Indietro",white) 
end 
if Select == 2 then 
screen:print(136,76,"Avvia UMD", white) 
screen:print(136,96,"Dump UMD in ms",red) 
screen:print(136,116,"Stop UMD",white) 
screen:print(136,136,"Indietro",white)  
end 
if Select == 3 then 
screen:print(136,76,"Avvia UMD", white) 
screen:print(136,96,"Dump UMD in ms",white) 
screen:print(136,116,"Stop UMD",red) 
screen:print(136,136,"Indietro",white)  
end 
if Select == 4 then 
screen:print(136,76,"Avvia UMD", white) 
screen:print(136,96,"Dump UMD in ms",white) 
screen:print(136,116,"Stop UMD",white) 
screen:print(136,136,"Indietro",red)  
end 
cu = UMD.checkDisk()
if pad:cross() and Select == 1 then 
if cu==1 then
System.startUMD()
else
System.message("Nessun Umd",0)
end
end
 
if pad:cross() and not oldpad:cross() and Select == 2 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("5.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 3 then 
UMD.term()
end 
if pad:cross() and not oldpad:cross() and Select == 4 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("1.lua")
end 
screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end