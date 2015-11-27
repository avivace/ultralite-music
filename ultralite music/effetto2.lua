--File creato automaticamente da Miro LUA
bianco = Color.new(255, 255, 255)
rosso = Color.new(255,0,0)
a = 1
b = 1
c = 1
plus = 1
biancovar = Color.new(255, 255, 255)
sfondo = Image.createEmpty (480, 272)
pad = Controls.read()
oldpad = pad 
ms = 1
mms = 7
white = bianco
white = Color.new(255,255,255)
red = Color.new(255,0,0)
blu = Color.new(0,0,255)
giallo = Color.new(255, 255, 0)
rosso = Color.new(255,0,0) 
font = Font.load("font.ttf")
d = 10
text = 0
title = 0
e = -100
menu = 1
function printCenteredfont(y,text,color) 
local length = string.len(text) 
local x = 240 - ((length*8)/2) 
screen:fontPrint(font,x,y,text,color) 
end

function printc(ypos, text, colour) 
xpos = 240 - ((string.len(text) * 8) / 2) 
screen:print(xpos, ypos, text, colour) 
end

while true do
--if passo_suc == 1 then
--System.memclean() 
--dofile("re_eff.lua")
--end
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
 
biancovar = Color.new(a, b, c)

font:setPixelSizes(d,d)
if text == 1 then
screen:fontPrint(font, 49, 140, "UltraLite Music" , blu)
--printCenteredfont(100,"UltraLite Music",blu) 
end
screen:drawLine(0, 255, 480, 255, giallo)
printc(260,"RAM "..freemem.." MB | Battery: "..System.powerGetBatteryLifePercent().."% | Ora: "..System.getTime(1).."."..System.getTime(2).."."..System.getTime(3).." | CPU "..System.getCpuSpeed().."Mhz", giallo) 


if pad:circle() then
dofile("system.lua")
end

if text ==1 then
if d < 55 then
d = d+1
end
if d ==40 then
title = 1
end
end

if plus == 1  then 
a = a+2
b = b+2
c = c+2
end
if a > 251 then 
plus = 0
end
if a > 200 then
text = 1
end

if title == 1 and e < 150 then
e = e + 1.8
if e == 150.2 then
passo_suc = 1
end
end


--if plus == 0 then 
--a = a-1
--b = b-1
--c = c-1
--if a == 0 then 
--plus = 1
--end
--end
screen:print(20,20, "darkpuma presents", biancovar)
screen:print(350,15,e.." "..ms.." "..a.." "..d.." "..title,bianco)


--Menù

printc( e, "Browser_MOD x MP3" , mc[1])
printc( e+15,"Cambia Impostazioni",mc[2]) 
printc(e+30,"Attiva USB",mc[3]) 
printc( e+45,"Redirect",mc[4])    
printc( e+60,"Verifika Impostazioni",mc[5])  
printc( e+75,"Browser Standard (!)",mc[6])  
printc( e+90,"Effetto2",mc[7])  

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
dofile("effetto2.lua")
end 


--screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)  
pad = Controls.read()
oldpad = pad 
screen.flip() 
screen.waitVblankStart() 
end