


System.irdaInit()
pad = Controls.read()
data2 = "prova"
bianco = Color.new(255,255,255)
while true do
if pad:circle() then
dofile("system.lua")
end
screen:clear()
data2 = System.irdaRead()
screen.print(15, 15, data2, bianco)
screen.flip()
screen.waitVblankStart()
end