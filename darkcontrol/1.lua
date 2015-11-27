--File creato automaticamente da Miro LUA
red = Color.new(255, 0, 0)
white = Color.new(255, 255, 255)
blu = Color.new(0,255,0)
System.currentDirectory("ms0:/psp/game/dc1/system")
sfondo = Image.load("mp.png")
--Variables
Select = 1 
maxSelect = 4 

oldpad = Controls.read() 
--loop 
while true do 








pad = Controls.read() 
screen:clear() 
--checar decicion 
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)
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

if pad:r() and not oldpad:r() then
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("system.lua")
end


if Select == 1 then 

screen:print(156,96,"Gestione Sistema", red) 
screen:print(156,116,"Gestione Umd",white) 
screen:print(156,136,"Crediti",white) 
screen:print(156,156,"Homebrew",white) 
end
if Select == 2 then 
screen:print(156,96,"Gestione Sistema", white) 
screen:print(156,116,"Gestione Umd",red) 
screen:print(156,136,"Crediti",white) 
screen:print(156,156,"Homebrew",white)  

end 
if Select == 3 then 
screen:print(156,96,"Gestione Sistema", white) 
screen:print(156,116,"Gestione Umd",white) 
screen:print(156,136,"Crediti",red) 
screen:print(156,156,"Homebrew",white)  

end 
if Select == 4 then 
screen:print(156,96,"Gestione Sistema", white) 
screen:print(156,116,"Gestione Umd",white) 
screen:print(156,136,"Crediti",white) 
screen:print(156,156,"Homebrew",red)  
end 

if pad:cross() and not oldpad:cross() and Select == 1 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("2.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 2 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("4.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 3 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("9.lua")
end 
if pad:cross() and not oldpad:cross() and Select == 4 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("3.lua")
end 
screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end