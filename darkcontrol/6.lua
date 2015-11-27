--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
red = Color.new(100, 255, 0)
white = Color.new(0, 0, 0)
System.currentDirectory("ms0:/psp/game/dc1/system")
sfondo = Image.load("usb.png")
--Variables
Select = 1 
maxSelect = 8

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
screen:print(136,36,"Flash0", red) 
screen:print(136,56,"Flash1",white) 
screen:print(136,76,"Flash2",white) 
screen:print(136,96,"Flash3",white) 
screen:print(136,116,"MemoryStick",white) 
screen:print(136,136,"UMD",white) 
screen:print(136,156,"Disattiva",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 2 then 
screen:print(136,36,"Flash0", white) 
screen:print(136,56,"Flash1",red) 
screen:print(136,76,"Flash2",white) 
screen:print(136,96,"Flash3",white) 
screen:print(136,116,"MemoryStick",white) 
screen:print(136,136,"UMD",white) 
screen:print(136,156,"Disattiva",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 3 then 
screen:print(136,36,"Flash0", white) 
screen:print(136,56,"Flash1",white) 
screen:print(136,76,"Flash2",red) 
screen:print(136,96,"Flash3",white) 
screen:print(136,116,"MemoryStick",white) 
screen:print(136,136,"UMD",white) 
screen:print(136,156,"Disattiva",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 4 then 
screen:print(136,36,"Flash0", white) 
screen:print(136,56,"Flash1",white) 
screen:print(136,76,"Flash2",white) 
screen:print(136,96,"Flash3",red) 
screen:print(136,116,"MemoryStick",white) 
screen:print(136,136,"UMD",white) 
screen:print(136,156,"Disattiva",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 5 then 
screen:print(136,36,"Flash0", white) 
screen:print(136,56,"Flash1",white) 
screen:print(136,76,"Flash2",white) 
screen:print(136,96,"Flash3",white) 
screen:print(136,116,"MemoryStick",red) 
screen:print(136,136,"UMD",white) 
screen:print(136,156,"Disattiva",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 6 then 
screen:print(136,36,"Flash0", white) 
screen:print(136,56,"Flash1",white) 
screen:print(136,76,"Flash2",white) 
screen:print(136,96,"Flash3",white) 
screen:print(136,116,"MemoryStick",white) 
screen:print(136,136,"UMD",red) 
screen:print(136,156,"Disattiva",white) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 7 then 
screen:print(136,36,"Flash0", white) 
screen:print(136,56,"Flash1",white) 
screen:print(136,76,"Flash2",white) 
screen:print(136,96,"Flash3",white) 
screen:print(136,116,"MemoryStick",white) 
screen:print(136,136,"UMD",white) 
screen:print(136,156,"Disattiva",red) 
screen:print(136,176,"Indietro",white) 
end 
if Select == 8 then 
screen:print(136,36,"Flash0", white) 
screen:print(136,56,"Flash1",white) 
screen:print(136,76,"Flash2",white) 
screen:print(136,96,"Flash3",white) 
screen:print(136,116,"MemoryStick",white) 
screen:print(136,136,"UMD",white) 
screen:print(136,156,"Disattiva",white) 
screen:print(136,176,"Indietro",red) 
end 

if pad:cross() and not oldpad:cross() and Select == 1 then 
System.usbDevFlash0()    --flash0
System.usbDiskModeActivate()
end 
if pad:cross() and not oldpad:cross() and Select == 2 then 
System.usbDevFlash1()  
System.usbDiskModeActivate()
end 
if pad:cross() and not oldpad:cross() and Select == 3 then 
System.usbDevFlash2()  
System.usbDiskModeActivate()
end 
if pad:cross() and not oldpad:cross() and Select == 4 then 
System.usbDevFlash3()  
System.usbDiskModeActivate()
end 
if pad:cross() and not oldpad:cross() and Select == 5 then 
System.usbDiskModeActivate()
end 
if pad:cross() and not oldpad:cross() and Select == 6 then 
System.usbDiskModeActivate()
System.usbDevUMD()  -- umd
end 
if pad:cross() and not oldpad:cross() and Select == 7 then 
System.usbDiskModeDeactivate()
end 
if pad:cross() and not oldpad:cross() and Select == 8 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("2.lua")
end 

screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end