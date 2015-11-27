--File creato automaticamente da Miro LUA
biancovar = Color.new(255, 255, 255)
font = Font.load("font.ttf")
while true do
System.memclean()
screen:clear()
pad = Controls.read() 

if pad:up() and not oldpad:up() then
ms = ms - 1
end

if pad:down() and not oldpad:down() then
ms = ms + 1
end

if ms > mms then
ms = 1
elseif ms <= 0 then
ms = mms
end


mc = { bianco,bianco,bianco,bianco,bianco,bianco,bianco }
mc[ms] = rosso
 

font:setPixelSizes(55,55)
--screen:fontPrint(font, 49, 140, ".UltraLite Music." , blu)
screen:drawLine(0, 255, 480, 255, giallo)
printc(260,"RAM "..freemem.." MB | Battery: "..System.powerGetBatteryLifePercent().."% | Ora: "..System.getTime(1).."."..System.getTime(2).."."..System.getTime(3).." | CPU "..System.getCpuSpeed().."Mhz", giallo) 

printc( 150, "Browser_MOD x MP3" , mc[1])
printc( 150+15,"Cambia Impostazioni",mc[2]) 
printc(150+30,"Attiva USB",mc[3]) 
printc( 150+45,"Redirect",mc[4])    
printc( 150+60,"Verifika Impostazioni",mc[5])  
printc( 150+75,"Browser Standard (!)",mc[6])  
printc( 150+90,"Effetto2",mc[7])  
screen:print(20,20, "darkpuma presents", biancovar)
if pad:cross() and ms == 1 then 
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("browser_mod.lua") 
end 

if pad:cross() and ms == 2 then 
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("impostazioni.lua") 
end

if pad:cross() and ms == 3 then 
System.usbDiskModeActivate()
end

if pad:cross() and ms == 4 then 
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("redirect.lua") 
end 


if pad:cross() and ms == 5 then 
dofile("set_test.lua")
end 

if pad:cross() and ms == 6 then 
dofile("browser.lua")
end 

if pad:cross() and ms == 7 then 
dofile("effetto2.lua")
end 
if pad:circle() and not oldpad:circle() then
dofile("system.lua")
end
pad = Controls.read()
oldpad = pad 
screen.flip() 
screen.waitVblankStart() 
end