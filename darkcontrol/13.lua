--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA


blu = IntraFont.color(0,0,80,255)
blu2 = IntraFont.color(0,128,255,255)
bianco = IntraFont.color(255,255,255,255)
bianco2 = Color.new(255, 255, 255)
grigio = Color.new(100, 100, 100)
nero = IntraFont.color(0,0,0,255)
IntraFont.init()
IntraFont.load("flash0:/font/ltn8.pgf",2)
while true do

function printc(ypos, text, colour)
xpos = 240 - ((string.len(text) * 8) / 2)
screen:print(xpos, ypos, text, colour)
end
pad = Controls.read()
if pad:cross() then 
System.currentDirectory("ms0:/PSP/GAME/dc/SYSTEM") 
dofile("2.lua") 
end 
IntraFont.print(7, 14, "Ulteriori InfoPSP",1.6, bianco,bianco)
IntraFont.print(7, 24, "Ulteriori InfoPSP",1.6, bianco,bianco)
screen.flip()
screen.waitVblankStart()
end

