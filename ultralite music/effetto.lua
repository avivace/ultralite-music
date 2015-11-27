--File creato automaticamente da Miro LUA
rosso = bianco
bianco = Color.new(255,255,255) 

System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
screen:clear()

function screen:drawLine1(a,b,c,d, colour)
screen:drawLine(b, a, c, d, colour)
end

while true do 
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)   
--Esempio:
--screen:drawLine(0.5, 0, 480, 272, rosso)

screen:drawLine1(0, 0, 0, 272, rosso)
screen:drawLine1(17, 0, 30, 272, rosso)
screen:drawLine1(17*2, 0, 30*2, 272, rosso)
screen:drawLine1(17*3, 0, 30*3, 272, rosso)
screen:drawLine1(17*4, 0, 30*4, 272, rosso)
screen:drawLine1(17*5, 0, 30*5, 272, rosso)
screen:drawLine1(17*6, 0, 30*6, 272, rosso)
screen:drawLine1(17*7, 0, 30*7, 272, rosso)
screen:drawLine1(17*8, 0, 30*8, 272, rosso)
screen:drawLine1(17*9, 0, 30*9, 272, rosso)
screen:drawLine1(17*10, 0,30*10, 272, rosso)
screen:drawLine1(17*11, 0, 30*11, 272, rosso)
screen:drawLine1(17*12, 0, 30*12, 272, rosso)
screen:drawLine1(17*13, 0, 30*13, 272, rosso)
screen:drawLine1(17*14, 0, 30*14, 272, rosso)
screen:drawLine1(17*15, 0, 30*15, 272, rosso)
screen:drawLine1(17*16, 0, 30*16, 272, rosso)


screen:drawLine(0, 0, 480-0, 0, rosso)
screen:drawLine(30, 0, 480, 17, rosso)
screen:drawLine(30*2, 0, 480, 17*2, rosso)
screen:drawLine(30*3, 0, 480, 17*3, rosso)
screen:drawLine(30*4, 0, 480, 17*4, rosso)
screen:drawLine(30*5, 0, 480, 17*5, rosso)
screen:drawLine(30*6, 0, 480, 17*6, rosso)
screen:drawLine(30*7, 0, 480, 17*7, rosso)
screen:drawLine(30*8, 0, 480, 17*8, rosso)
screen:drawLine(30*9, 0, 480, 17*9, rosso)
screen:drawLine(30*10, 0,480, 17*10, rosso)
screen:drawLine(30*11, 0, 480, 17*11, rosso)
screen:drawLine(30*12, 0, 480, 17*12, rosso)
screen:drawLine(30*13, 0, 480, 17*13, rosso)
screen:drawLine(30*14, 0, 480, 17*14, rosso)
screen:drawLine(30*15, 0, 480, 17*15, rosso)
screen:drawLine(30*16, 0, 480, 17*16, rosso)




if pad:circle() then
dofile("System.lua") 
end
pad = Controls.read() 
screen.waitVblankStart()  
screen.flip()  
oldpad = pad  
end 
