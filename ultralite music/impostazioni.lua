--File creato automaticamente da Miro LUA
bianco = Color.new(255, 255, 255)
rosso = Color.new(255, 0, 0)
giallo = Color.new(255, 255, 0)
function printc(ypos, text, colour)
xpos = 240 - ((string.len(text) * 8) / 2)
screen:print(xpos, ypos, text, colour)
end

function autoprint(ypos,text,colour) 
xpos = 0 
if string.len(text) > 60 then 
valore = string.len(text) - 60 
newtext = string.lower(string.sub(text, -valore)) 
text = string.rep(text,60) 
screen:print(xpos,ypos,text,colour) 
ypos = ypos + 10 
autoprint(ypos,newtext,colour) 
else 
screen:print(xpos,ypos,text,colour) 
end 
end




while true do
pad = Controls.read()
oldpad= pad
screen:clear() 
printc(20, "Cambia Impostazioni",bianco)
printc(35, "O : Indietro",bianco)
printc(55, "T : a = 110",bianco)
printc(65, "[] : a = 150",bianco)
printc(75, "R : c = 230",bianco)
printc(85, "L : c = 235",bianco)
printc(95, "START : d = ''bello''",bianco)
printc(105, "X : c = ''brutto''",bianco)

if pad:circle() then
io.close()   
dofile ("system.lua")

end

if pad:triangle() then
io.open("dbinfo.lua","w+")   
a = 110
io.write(a) 
end

if pad:square() then
io.open("dbinfo.lua","w+")   
a = 150
io.write(a) 
end

screen.flip() 
screen.waitVblankStart() 
end