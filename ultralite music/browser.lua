--Esplora File Con Funzioni
aka = System.buttonPressed(1)
System.currentDirectory("ms0:/") 
rosso = Color.new(255,0,0) 
bianco = Color.new(255,255,255) 
fbrowser = {s = 1, fl = System.listDirectory("ms0:/"),ls = 1, sp = 20} 
screen:clear()
fbrowser.nf = table.getn(fbrowser.fl) 
oldpad = Controls.read() 
dossierencours = System.currentDirectory() 

-- Tasti Utilizzati :
-- X T O [] Select Home Giù Destra Sinistra Su R L Select (uniko : START)
function runfbrowser() 
screen:clear() 
for i = ((fbrowser.ls-1)*fbrowser.sp)+1, fbrowser.ls*fbrowser.sp do 
if fbrowser.nf >= i then 
screen:print(10,((i-((fbrowser.ls-1)*fbrowser.sp))*10)-10,fbrowser.fl[i].name,bianco) 
elseif fbrowser.nf < i then break end
end 

screen:print(10,((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*10)-10, 
fbrowser.fl[fbrowser.s].name,rosso) 
if pad:down() and not oldpad:down() then fbrowser.s = fbrowser.s + 1 end 
if pad:up() and not oldpad:up() then fbrowser.s = fbrowser.s - 1 end 
if fbrowser.s > fbrowser.nf then fbrowser.s = fbrowser.nf elseif fbrowser.s < 1
then fbrowser.s = 1 end 
if fbrowser.s > fbrowser.sp*fbrowser.ls then fbrowser.ls = fbrowser.ls + 1
elseif fbrowser.s < ((fbrowser.ls-1) * fbrowser.sp)+1 then fbrowser.ls = fbrowser.ls - 1 fbrowser.s = (fbrowser.ls)*fbrowser.sp end

---L RINOMINA FILE O CARTELLA
if pad:l() and not oldpad:l() then			
nom = System.startOSK(dossierencours.."/"..fbrowser.fl[fbrowser.s].name,"Rinominare il file o la cartella")
System.rename(dossierencours.."/"..fbrowser.fl[fbrowser.s].name,nom)
fbrowser.s = 1
fbrowser.fl=System.listDirectory()
fbrowser.nf=table.getn(fbrowser.fl)
fbrowser.ls = 1
end



--R Crea Cartella 
if pad:r() and not oldpad:r() then				
dossier = System.currentDirectory()
nom = System.startOSK(dossierencours.."/"..fbrowser.fl[fbrowser.s].name,"Inserire il percorso e il nome della cartella")
System.createDirectory(nom)
fbrowser.s = 1
fbrowser.fl=System.listDirectory()
fbrowser.nf=table.getn(fbrowser.fl)
fbrowser.ls = 1
end

--Cerchio : Elimina File e/o Cartelle
if pad:circle() and not oldpad:circle() then          
if fbrowser.fl[fbrowser.s].directory == true then
dossierencours = System.currentDirectory()
System.removeDirectory(dossierencours.."/"..fbrowser.fl[fbrowser.s].name)
fbrowser.s = 1
fbrowser.fl=System.listDirectory()
fbrowser.nf=table.getn(fbrowser.fl)
fbrowser.ls = 1
else
dossierencours = System.currentDirectory()
System.removeFile(dossierencours.."/"..fbrowser.fl[fbrowser.s].name)
fbrowser.s = 1
fbrowser.fl=System.listDirectory()
fbrowser.nf=table.getn(fbrowser.fl)
fbrowser.ls = 1
end
end

 

--Home : Torna a System.lua (da sistemare)
if pad:home() then
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("system.lua")
end

--Select :Visualizza MD5
if pad:select() and not oldpad:select() then 
if not fbrowser.fl[fbrowser.s].directory then
md5cifra = System.md5sum(fbrowser.fl[fbrowser.s].name)
System.message("L' MD5 del file '"..fbrowser.fl[fbrowser.s].name.."' è :"..md5cifra,0) 
end
end

--Funzioni quando si schiaccia X su di un FILE
if pad:cross() and not oldpad:cross() then 
if not fbrowser.fl[fbrowser.s].directory then 

--Image : .jpg o .JPG
if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".jpg" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".JPG" then 
screen:clear() 
img = Image.load(fbrowser.fl[fbrowser.s].name) 
screen:blit(0,0,img) 
screen.flip() 
screen.waitVblankStart(100)
end


--Music : .mp3 o .MP3
if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".mp3" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".MP3" then 
Mp3me.load(fbrowser.fl[fbrowser.s].name)
Mp3me.play()
end 

--Apri un file .lua , .LUA
if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".lua" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".LUA" then 
dofile(fbrowser.fl[fbrowser.s].name)
end 
if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".iso" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".ISO" then 
System.startISO(fbrowser.fl[fbrowser.s].name)
end 


--Music : .png o .PNG
if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".png" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".PNG" then 
screen:clear() 
img = Image.load(fbrowser.fl[fbrowser.s].name) 
screen:blit(0,0,img) 
screen.flip() 
screen.waitVblankStart(100) 
end 

--Image : .bmp o .BMP
if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".bmp" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".BMP" then 
screen:clear() 
img = Image.load(fbrowser.fl[fbrowser.s].name) 
screen:blit(0,0,img) 
screen.flip() 
screen.waitVblankStart(100) 
end 


--Destra : Modalità USB
if pad:right() then
System.UsbModeActivate()
end

elseif fbrowser.fl[fbrowser.s].directory then 
System.currentDirectory(fbrowser.fl[fbrowser.s].name) 
fbrowser.s = 1 
fbrowser.fl=System.listDirectory() 
fbrowser.nf=table.getn(fbrowser.fl) 
fbrowser.ls = 1 
end  





elseif pad:triangle() and not oldpad:triangle() then
if System.currentDirectory ~= "ms0:/" then
System.currentDirectory("./..")
fbrowser.s = 1
fbrowser.fl=System.listDirectory()
fbrowser.nf=table.getn(fbrowser.fl)
fbrowser.ls = 1
end
end
end


while true do
pad = Controls.read()
runfbrowser()
screen.waitVblankStart()
screen.flip()
oldpad = pad
end