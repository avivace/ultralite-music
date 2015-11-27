--File creato automaticamente da Miro LUA
bianco = Color.new(255, 255, 255)
rosso = Color.new(255, 0, 0)
giallo = Color.new(255, 255, 0)
function printc(ypos, text, colour) 
xpos = 240 - ((string.len(text) * 8) / 2) 
screen:print(xpos, ypos, text, colour) 
end 
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
io.open("dbinfo.lua","r")  

while true do
dofile("dbinfo.lua")
screen:clear() 
pad = Controls.read()
oldpad= pad
printc(20, "Verifica Impostazioni",bianco)
printc(35, "O : Indietro",bianco)
printc(60, " a ="..a,giallo)

if pad:circle() then
dofile("system.lua")

end
oldpad = pad 
screen.flip() 
screen.waitVblankStart() 
end