--File creato automaticamente da Miro LUA
--File creato automaticamente da Miro LUA
blu = Color.new (20, 140, 205)
sfondo = Image.load("crd.jpg")
blu = IntraFont.color(0,0,80,255)
blu2 = IntraFont.color(0,128,255,255)
bianco = IntraFont.color(255,255,255,255)
bianco2 = Color.new(255, 255, 255)
grigio = Color.new(100, 100, 100)
nero = IntraFont.color(0,0,0,255)
while true do
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)
function printc(ypos, text, colour)
xpos = 240 - ((string.len(text) * 8) / 2)
screen:print(xpos, ypos, text, colour)
end

pad = Controls.read()
if pad:cross() then 
System.currentDirectory("ms0:/PSP/GAME/dc/SYSTEM") 
dofile("9.lua") 
end 

screen.flip()
screen.waitVblankStart()
end

