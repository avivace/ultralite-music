--File creato automaticamente da Miro LUA

while true do
screen:clear() 

pad = Controls.read()
rosso = Color.new(0, 255, 0)
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
screen:print(120, 21, "Pagina di aggiornamento, premi O per tornare ;)", rosso)



if pad:circle() then
dofile("system.lua")
end


oldpad = pad 
screen.flip()
screen.waitVblankStart()
end