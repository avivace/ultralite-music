--File creato automaticamente da Miro LUA
rosso = Color.new(255,0,0) 
bianco = Color.new(255,255,255) 

System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
screen:clear()

function screen:drawLine1(a,b,c,d, colour)
screen:drawLine(a, b, c, d, colour)
end

while true do 
screen:blit(0, 0, sfondo, 0, 0, sfondo:width(), sfondo:height(), false)   
--Esempio:
--screen:drawLine(0.5, 0, 480, 272, rosso)

screen:drawLine1(0, 0, 0, 272, rosso)
screen:drawLine1(30, 0, 0, 272-17, rosso)
screen:drawLine1(30*2, 0, 0, 272-(17*2), rosso)
screen:drawLine1(30*3, 0, 0, 272-(17*3), rosso)
screen:drawLine1(30*4, 0, 0, 272-(17*4), rosso)
screen:drawLine1(30*5, 0, 0, 272-(17*5), rosso)
screen:drawLine1(30*6, 0, 0, 272-(17*6), rosso)
screen:drawLine1(30*7, 0, 0, 272-(17*7), rosso)
screen:drawLine1(30*8, 0, 0, 272-(17*8), rosso)
screen:drawLine1(30*9, 0, 0, 272-(17*9), rosso)
screen:drawLine1(30*10, 0, 0, 272-(17*10), rosso)
screen:drawLine1(30*11, 0, 0, 272-(17*11), rosso)
screen:drawLine1(30*12, 0, 0, 272-(17*12), rosso)
screen:drawLine1(30*13, 0, 0, 272-(17*13), rosso)
screen:drawLine1(30*14, 0, 0, 272-(17*14), rosso)
screen:drawLine1(30*15, 0, 0, 272-(17*15), rosso)
screen:drawLine1(30*16, 0, 0, 272-(17*16), rosso)


screen:drawLine1(0, 272, 480, 272, rosso)
screen:drawLine1(30, 272, 480, 272-17, rosso)
screen:drawLine1(30*2, 272, 480, 272-(17*2), rosso)
screen:drawLine1(30*3, 272, 480, 272-(17*3), rosso)
screen:drawLine1(30*4, 272, 480, 272-(17*4), rosso)
screen:drawLine1(30*5, 272, 480, 272-(17*5), rosso)
screen:drawLine1(30*6, 272, 480, 272-(17*6), rosso)
screen:drawLine1(30*7, 272, 480, 272-(17*7), rosso)
screen:drawLine1(30*8, 272, 480, 272-(17*8), rosso)
screen:drawLine1(30*9, 272, 480, 272-(17*9), rosso)
screen:drawLine1(30*10, 272, 480, 272-(17*10), rosso)
screen:drawLine1(30*11, 272, 480, 272-(17*11), rosso)
screen:drawLine1(30*12, 272, 480, 272-(17*12), rosso)
screen:drawLine1(30*13, 272, 480, 272-(17*13), rosso)
screen:drawLine1(30*14, 272, 480, 272-(17*14), rosso)
screen:drawLine1(30*15, 272, 480, 272-(17*15), rosso)
screen:drawLine1(30*16, 272, 480, 272-(17*16), rosso)



if pad:circle() then
dofile("System.lua") 
end
pad = Controls.read() 
screen.waitVblankStart()  
screen.flip()  
oldpad = pad  
end 
