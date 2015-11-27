--Sfondo:
dofile("ms0:/PSP/GAME/UltraLite Music/SYSTEM/final_set.lua")
standarstartcpu = velocita_cpu_in_home
sfondo = Image.createEmpty (480, 272)
--Colori
usbstate = 0
function printc(ypos, text, colour) 
xpos = 240 - ((string.len(text) * 8) / 2) 
screen:print(xpos, ypos, text, colour) 
end
function System.UsbMode()
if pad:right() and not oldpad:right() then  
if usbstate == 0 then
System.usbDiskModeActivate()
usbstate = 1
else
System.usbDiskModeDeactivate()    
usbstate = 0 
end  
end
end
bianco = Color.new(255, 255, 255)
rosso = Color.new(255, 0, 0)
giallo = Color.new(255, 255, 0)
--Varie
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
oldpad = Controls.read()
--Variabili Menù
ms = 1
mms = 7
cpu = 0
msi = 1
mmsi = 6
--Fonts
--font = Font.load("font.ttf")
--Inzio del loop
while true do 
--Menù2


--font:setPixelSizes(15,15) 
mem1 = System.getFreeMemory() /1048576
mem2 =  tostring(mem1)

	     if #mem2 >= 5 then
                freemem = string.sub(mem2, 1, 5)
            else
                freemem = mem2
            end


screen:clear() 
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)   
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
mc = { bianco,bianco,bianco,bianco,bianco,bianco,bianco} 
mc[ms] = rosso 
if cpu == 0 then 
System.setcpuspeed(standarstartcpu)
cpu = 1
end
--screen:print( 10,85,"CPU:",bianco) 
screen:drawLine(0, 255, 480, 255, giallo)
printc(260,"RAM "..freemem.." MB | Battery: "..System.powerGetBatteryLifePercent().."% | Ora: "..System.getTime(1).."."..System.getTime(2).."."..System.getTime(3).." | CPU "..System.getCpuSpeed().."Mhz", giallo) 


--screen:fillRect(50, 60, 60, 90, rosso)
printc( 25, "Browser_MOD x MP3" , mc[1])
printc( 40,"Cambia Impostazioni",mc[2]) 
printc(55,"Attiva USB",mc[3]) 
printc( 70,"Redirect",mc[4])    
printc( 85,"Verifika Impostazioni",mc[5])  
printc( 100,"Browser Standard (!)",mc[6])  
printc( 115,"Effetto2",mc[7])  


if pad:cross() and not oldpad:cross() and ms == 1 then 
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("browser_mod.lua") 
end 

if pad:cross() and not oldpad:cross() and ms == 2 then 
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("impostazioni.lua") 
end

if pad:cross() and not oldpad:cross() and ms == 3 then 
System.usbDiskModeActivate()
end

if pad:cross() and not oldpad:cross() and ms == 4 then 
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("redirect.lua") 
end 


if pad:cross() and not oldpad:cross() and ms == 5 then 
dofile("set_test.lua")
end 

if pad:cross() and not oldpad:cross() and ms == 6 then 
dofile("browser.lua")
end 

if pad:cross() and not oldpad:cross() and ms == 7 then 
dofile("re_eff.lua")
end 

if pad:circle() and not oldpad:circle() then
System.quit()
end

oldpad = pad 
screen.flip() 
screen.waitVblankStart() 
end






