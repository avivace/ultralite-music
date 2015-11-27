red = Color.new(0, 0, 255)
blu = Color.new(0,255,0)
white = Color.new(0, 0, 0)
System.currentDirectory("ms0:/psp/game/dc1/system")
sfondo = Image.load("lng.png")
--Variables
Select = 1 
maxSelect = 2

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
if pad:r() and not oldpad:r() then System.Quit() end
---een:fontPrint(font, 27, 33, "Hello World" , blu)

if pad:circle() then System.usbDiskModeActivate()  end
if Select == 1 then 
screen:print(186,117,"English", red) 
screen:print(186,127,"Italian",white) 

end 
if Select == 2 then 
screen:print(186,117,"English", white) 
screen:print(186,127,"Italian",red) 
end 

if pad:cross() and Select == 1 then 
--System.currentDirectory("ms0:/psp/game/dc1/system")
--dofile("1.lua")
System.message("Versione inglese non disponibile",0)
end
if pad:cross() and Select == 2 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("1.lua")
end 
screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end
