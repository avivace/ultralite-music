--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
red = Color.new(255, 0, 0)
white = Color.new(255, 255, 255)
green = Color.new(0,0,0)
sfondo = Image.load("cpu.png")
--Variables
Select = 1 
maxSelect = 6

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
screen:print(136,56,"99 Mhz", red) 
screen:print(136,76,"222 Mhz",white) 
screen:print(136,96,"333 Mhz",white) 
screen:print(136,117,"AutoCpu",white) 
screen:print(136,136,"Personalizza",white) 
screen:print(136,157,"Indietro",white)
screen:print(136,176,"Clock Attuale CPU:"..System.getCpuSpeed().."BUS: "..System.getBusSpeed(),green) 
end
 
if Select == 2 then 
screen:print(136,56,"99 Mhz", white) 
screen:print(136,76,"222 Mhz",red) 
screen:print(136,96,"333 Mhz",white) 
screen:print(136,117,"AutoCpu",white) 
screen:print(136,136,"Personalizza",white) 
screen:print(136,157,"Indietro",white)
screen:print(136,176,"Clock Attuale CPU:"..System.getCpuSpeed().."BUS: "..System.getBusSpeed(),green)  
end 

if Select == 3 then 
screen:print(136,56,"99 Mhz", white) 
screen:print(136,76,"222 Mhz",white) 
screen:print(136,96,"333 Mhz",red) 
screen:print(136,116,"AutoCpu",white) 
screen:print(136,136,"Personalizza",white) 
screen:print(136,157,"Indietro",white)
screen:print(136,176,"Clock Attuale CPU:"..System.getCpuSpeed().."BUS: "..System.getBusSpeed(),green)  
end 

if Select == 4 then 
screen:print(136,56,"99 Mhz", white) 
screen:print(136,76,"222 Mhz",white) 
screen:print(136,96,"333 Mhz",white) 
screen:print(136,116,"AutoCpu",red) 
screen:print(136,136,"Personalizza",white) 
screen:print(136,157,"Indietro",white) 

screen:print(136,176,"Clock Attuale CPU:"..System.getCpuSpeed().."BUS: "..System.getBusSpeed(),green) 
end 
if Select == 5 then 
screen:print(136,56,"99 Mhz", white) 
screen:print(136,76,"222 Mhz",white) 
screen:print(136,96,"333 Mhz",white) 
screen:print(136,116,"AutoCpu",white) 
screen:print(136,136,"Personalizza",red) 
screen:print(136,157,"Indietro",white) 
screen:print(136,176,"Clock Attuale CPU:"..System.getCpuSpeed().."BUS: "..System.getBusSpeed(),green) 
end 
if Select == 6 then 
screen:print(136,56,"99 Mhz", white) 
screen:print(136,76,"222 Mhz",white) 
screen:print(136,96,"333 Mhz",white) 
screen:print(136,116,"AutoCpu",white) 
screen:print(136,136,"Personalizza",white) 
screen:print(136,157,"Indietro",red) 
screen:print(136,176,"Clock Attuale CPU:"..System.getCpuSpeed().."BUS: "..System.getBusSpeed(),green) 
end 


if pad:cross() and not oldpad:cross() and Select == 1 then 
System.setLow()
end 
if pad:cross() and not oldpad:cross() and Select == 2 then 
System.setReg()
end 
if pad:cross() and not oldpad:cross() and Select == 3 then 
System.setHigh()
end 
if pad:cross() and not oldpad:cross() and Select == 4 then 
System.autoCpu()  
end 
if pad:cross() and not oldpad:cross() and Select == 5 then 
int = System.startOSK("  ","Inserisci il valore dei Mhz che vuoi impostare")

if int > 0 then System.message("Non puoi impostare un valore minore di zero!",0) else
if int > 333 then System.message("il valore massimo è 333 mhz",0) else

System.setcpuspeed(tonumber(int))
System.message("CPU:"..System.getCpuSpeed().."mhz BUS:"..System.getBusSpeed().."mhz",0) 
end
end
end 
if pad:cross() and Select == 6 then 
System.currentDirectory("ms0:/psp/game/dc1/system")
dofile("2.lua")
end 




screen.waitVblankStart() 
screen.flip() 
oldpad = pad 
end
