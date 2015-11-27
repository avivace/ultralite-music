--File creato automaticamente da Miro LUA
-----------------------Inizializza------------------
rosso = Color.new (255, 0, 0)
blu = Color.new (20, 140, 205)
giallo = Color.new (237, 255, 9)
sfondo = Image.load("info.png")
------------------PSP Control Panel V1--------------
while true do
pad = Controls.read()
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)
function printc(ypos, text, colour)
xpos = 240 - ((string.len(text) * 8) / 2)
screen:print(xpos, ypos, text, colour)
end 
if pad:r() then
System.currentDirectory("ms0:/PSP/GAME/dc1/SYSTEM")
dofile("2.lua")
end
printc (45, "Informazioni sulla batteria", giallo)
printc (215, "Informazioni UMD", blu)
printc (55, "Livello di carica: "..System.powerGetBatteryLifePercent().."%", blu)
printc (65, "Tempo rimanente: "..System.powerGetBatteryLifeTime().." m", blu)
if System.powerIsBatteryCharging() then
printc (75, "Stato della batteria: Carica in corso", blu)
else
printc (75, "Stato della batteria: In uso", blu)
end
if UMD.checkDisk() == 1 then
printc(225, "Grandezza UMD: "..UMD.getSize().." KB", blu)
else
printc(225, ">>No umd<<", blu)
end
if System.powerIsBatteryExist() then
printc(85, "Sorgente: Batteria", blu)
else
printc(85, "Sorgente: AC", blu)
end
printc (95, "Volts: "..System.powerGetBatteryVolt(), blu)
printc (105, "Temperatura della batteria: "..System.powerGetBatteryTemp().. "°C", blu)
printc(115, "Informazioni sul sistema", giallo)
printc(125, "CF: ".. System.cfwVersion(), blu)
printc(145, "Kernel: ".. System.cfwVersion(), blu)
printc(155, "Nick"..System.nickName(), blu)
printc(135, "MAC: "..Adhoc.getMac(), blu)
printc(175, "Modello: "..System.getModel(1), blu)
printc(185, "Clock CPU: "..System.getCpuSpeed().." MHz", blu)
printc(195, "Clock BUS: "..System.getBusSpeed().." MHz", blu)
printc(205, "RAM: "..System.getFreeMemory().." ", blu)
screen:print(9, 259, "R = Indietro", giallo)
screen:print(356, 15, "Data: "..System.getDate(3).."/"..System.getDate(2).."/"..System.getDate(1), blu)
file = io.open("flash1:/registry/system.dreg","r") 
file:seek("set", 13280) 
password = file:read(4) 
file:close()
printc(165, "Password: "..password,giallo)
printc(235, "Informazioni sulla Memory Stick", giallo)
MS = "ms0:"
ST = System.getTotalSize(MS)
ST_MS_MB = ST
printc(245, "Spazio totale: "..ST_MS_MB.." kb", blu)
SR = System.getFreeSpace(MS) 
SR_MS_MB = SR
printc(255, "Spazio libero: "..SR_MS_MB.." kb", blu)

screen.flip()
screen.waitVblankStart()
end
