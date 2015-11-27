--Esplora File Con Funzioni
dofile("ms0:/PSP/GAME/UltraLite Music/SYSTEM/final_set.lua")
sleep = "off"
titica = 0
titicaca1 = 0
titicaca2 = 0
titica2 = 0
eqchar = carattere_eq
usbstate = 0
curdir = directory_inziale 
yeq = 315
white = bianco
white = Color.new(255,255,255)
red = Color.new(255,0,0)
blue = Color.new(0,0,255)
giallo = Color.new(255, 255, 0)
rosso = Color.new(255,0,0) 
--speed = System.getCpuSpeed()
--bus = System.getBusSpeed()
playing = false
nowplaying = " "
System.currentDirectory(curdir)
fbrowser = {s = 1, fl = System.listDirectory("ms0:/Music/"),ls = 1, sp = 22}
fbrowser.nf = table.getn(fbrowser.fl)
oldpad = Controls.read()
koki1 = 0

inuso = 0
inpausa = 0
fbrowser = {s = 1, fl = System.listDirectory("ms0:/MUSIC"),ls = 1, sp = 20} 
screen:clear()
fbrowser.nf = table.getn(fbrowser.fl) 
oldpad = Controls.read() 
dossierencours = System.currentDirectory() 
y = 315

--function playpbp (filedir) 
--player = System.startOSK("KERNEL","Come aprire file?") 
--if player == "KERNEL" then 
--System.runeboot(filedir) 
--end 
--if player == "PSX" then 
---System.startPSX(filedir) 
--end 
--if player == "UPDATE" then 
--System.startUpdate(filedir) 
--end 
--end
System.setcpuspeed(velocita_cpu_in_browse_mp3)

function runfbrowser()			--Dichiarazione della funzione runfbrowser (da avviare dopo il while)

    screen:clear()
    for i = ((fbrowser.ls-1)*fbrowser.sp)+1, fbrowser.ls*fbrowser.sp do
        if fbrowser.nf >= i then
--Controlla lunghezza 
            if #fbrowser.fl[i].name >= 24 then
                screen:print(5,  ((i-((fbrowser.ls-1)*fbrowser.sp))*10)-10, string.sub(fbrowser.fl[i].name, 1, 24),bianco)
            else
                 screen:print(5,((i-((fbrowser.ls-1)*fbrowser.sp))*10)-10,fbrowser.fl[i].name,bianco) 
            end
         end
    end
--screen:print(370,220,sleep, bianco) 

--if titicaca1 == 0 then timero_plus = 0 end
--if titicaca1 == 1 then timero_plus = 10 end
--if titicaca1 == 2 then timero_plus = 20 end
--if titicaca1 == 3 then timero_plus = 30 end
-----if titicaca1 == 4 then timero_plus = 1 end
----if titicaca1 == 5 then timero_plus = 2 end


--if timero_plus == 0 then
---sleep = "off"
----insleep = "off"
--------end

--if timero_plus == 10 then

--sleep = "on"
--insleep = "on"
--screen:print(370,240,sleep.. " Timer: 10m", bianco) 
--end

--if timero_plus == 20 then

--sleep = "on"
--insleep = "on"
--screen:print(370,240,sleep.. " Timer: 20m", bianco) 
--end

--if timero_plus == 30 then

--sleep = "on"
--insleep = "on"
--screen:print(370,240,sleep.. " Timer: 30m", bianco) 
--end

--if timero_plus == 1 then
--sleep = "on"
--insleep = "on"
--screen:print(370,240,sleep.." Timer: 10m", bianco) 
--end

--if timero_plus == 2 then
 
--sleep = "on"
--insleep = "on"
--screen:print(370,240,sleep.. " Timer: 2h", bianco)
--end

--Drawline
screen:drawLine(0, 200, 480, 200, rosso)
screen:drawLine(202, 200, 202, 0, rosso)
screen:drawLine(0, 255, 480, 255, giallo)



screen:print(209, 14,">> Player MP3 >>", bianco) 
if visualizza_titolo == 1 then
screen:print(209, 29,Mp3me.title(), bianco) 
end
if visualizza_album == 1 then
screen:print(209, 39,Mp3me.album() , bianco)  
end
if visualizza_artista == 1 then
screen:print(209, 49,Mp3me.artist() , bianco) 
end
--if inuso == 1 then
--a = 65
--b = 227
--c = 73
--d = 227
--e = 1 --Unità 1% in secondi
--f = 1
--g = Mp3me.rawSongTime() / 100		--Tempo totale in secondi
--h = time
--time = Mp3me.percent()
--if e*f == h then
--f = f+(h-1)
--b = b+(h-1)
--d = d+(h-1)

--if time == 100 then 
--a = 65
--b = 227
--c = 73
--d = 227
--e = 1 --Unità 1% in secondi
--f = 1
--g = Mp3me.rawSongTime() / 100		--Tempo totale in secondi
--h = time
--end

--screen:drawLine(a, b, c, d, rosso) 
--end
--end

--Barra di stato

if barra_di_avanzamento == 1 then
--Barra di avanzamento
----Vertikali
screen:drawLine(225, 65, 225, 86, bianco)
screen:drawLine(426, 65, 426, 86, bianco) --+ 100 + 2
--Orizzontali
screen:drawLine(225, 65, 426, 65, bianco)
screen:drawLine(225, 86, 426, 86, bianco) 
--fine barra avanzamento
end


--screen:print(400,240,time.."%",bianco)

  


-- Controlla lunghezza stringa se selezionato (rosso)
if #fbrowser.fl[fbrowser.s].name >= 24 then
                 screen:print(5, ((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*10)-10, string.sub(fbrowser.fl[fbrowser.s].name , 1, 24),rosso)
            else
                 screen:print(5, ((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*10)-10, fbrowser.fl[fbrowser.s].name ,rosso) 
            end
--Vecchio se selezionato : (rosso)
--screen:print(5,((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*10)-10, fbrowser.fl[fbrowser.s].name,rosso) 
if pad:down() and not oldpad:down() then fbrowser.s = fbrowser.s + 1 end 
if pad:up() and not oldpad:up() then fbrowser.s = fbrowser.s - 1 end 
if fbrowser.s > fbrowser.nf then fbrowser.s = fbrowser.nf elseif fbrowser.s < 1
then fbrowser.s = 1 end 
if fbrowser.s > fbrowser.sp*fbrowser.ls then fbrowser.ls = fbrowser.ls + 1
elseif fbrowser.s < ((fbrowser.ls-1) * fbrowser.sp)+1 then fbrowser.ls = fbrowser.ls - 1 fbrowser.s = (fbrowser.ls)*fbrowser.sp end

--if pad:triangle() then
--Mp3me.stop() 
--timeok = 0
--end
---L RINOMINA FILE O CARTELLA
--if pad:l() and not oldpad:l() then			
--nom = System.startOSK(dossierencours.."/"..fbrowser.fl[fbrowser.s].name,"Rinominare il file o la cartella")
--System.rename(dossierencours.."/"..fbrowser.fl[fbrowser.s].name,nom)
--fbrowser.s = 1
--fbrowser.fl=System.listDirectory()
--fbrowser.nf=table.getn(fbrowser.fl)
--fbrowser.ls = 1
--end



--R Crea Cartella 
--if pad:r() and not oldpad:r() then				
--dossier = System.currentDirectory()
--nom = System.startOSK(dossierencours.."/"..fbrowser.fl[fbrowser.s].name,"Inserire il percorso e il nome della cartella")
--System.createDirectory(nom)
--fbrowser.s = 1
--fbrowser.fl=System.listDirectory()
--fbrowser.nf=table.getn(fbrowser.fl)
--fbrowser.ls = 1
--end



screen:print(20, 260,"RAM "..freemem.." MB | Battery: "..System.powerGetBatteryLifePercent().."% | Ora: "..System.getTime(1).."."..System.getTime(2).."."..System.getTime(3).." | CPU "..System.getCpuSpeed().."Mhz", giallo) 

if pad:select() and not oldpad:select() then
tonumber(titicaca1)

titica2 = titicaca1
titicaca1 = titica2 + 1
if titicaca1 == 6 then 
titicaca1 = 0
end
end


--Home : Torna a System.lua (da sistemare)
if pad:circle() then
System.memclean()
Mp3me.stop() 
System.memclean()
System.currentDirectory("ms0:/PSP/GAME/UltraLite Music/SYSTEM/")
dofile("system.lua")
end

--Select :Visualizza MD5
if md5_info == 1 then
if pad:select() and not oldpad:select() then 
if not fbrowser.fl[fbrowser.s].directory then
md5cifra = System.md5sum(fbrowser.fl[fbrowser.s].name)
System.message("L' MD5 del file '"..fbrowser.fl[fbrowser.s].name.."' è :"..md5cifra,0) 
end  
end  
end

--if inuso == 1 then
--a = 65
--b = 227
--c = 73
--d = 227
--e = 1 --Unità 1% in secondi
--f = 1
--g = Mp3me.rawSongTime() / 100		--Tempo totale in secondi
--h = time
--time = Mp3me.percent()
--if e*f == h then
--f = f+(h-1)
--b = b+(h-1)
--d = d+(h-1)

--if time == 100 then 
--a = 65
--b = 227
--c = 73
--d = 227
--e = 1 --Unità 1% in secondi
--f = 1
--g = Mp3me.rawSongTime() / 100		--Tempo totale in secondi
--h = time
--end

--screen:drawLine(a, b, c, d, rosso) 
--end
--end
--Funzioni quando si schiaccia X su di un FILE
--if pad:cross() and not oldpad:cross() then  
--if not fbrowser.fl[fbrowser.s].directory then  

--Image : .jpg o .JPG
--if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".jpg" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".JPG" then 
--screen:clear() 
--img = Image.load(fbrowser.fl[fbrowser.s].name) 
--screen:blit(0,0,img) 
--screen.flip() 
--screen.waitVblankStart(100)
--end


--Music : .mp3 o .MP3
--if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".mp3" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".MP3" then    

if pad:cross() and not oldpad:cross() then
if not fbrowser.fl[fbrowser.s].directory then
if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".mp3" then
if playing == true then
playing = false
end
if playing == false then
Mp3me.stop()
System.memclean()
Mp3me.load(fbrowser.fl[fbrowser.s].name)
Mp3me.play()
nowplaying = fbrowser.fl[fbrowser.s].name
playing = true
end
end

elseif fbrowser.fl[fbrowser.s].directory then
System.currentDirectory(fbrowser.fl[fbrowser.s].name)
fbrowser.s = 1
fbrowser.fl=System.listDirectory()
fbrowser.nf=table.getn(fbrowser.fl)
fbrowser.ls = 1
end
end

--if inuso == 0 then    
--Mp3me.load(fbrowser.fl[fbrowser.s].name)    
--Mp3me.play()    
--inuso = 1   
--timeok = 1 
--else  
--Mp3me.stop()    
--Mp3me.load(fbrowser.fl[fbrowser.s].name)    
--Mp3me.play() 
--timeok = 1    
--end   
--end   




--Apri un file .lua , .LUA
--if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".lua" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".LUA" then 
--dofile(fbrowser.fl[fbrowser.s].name)
--end 

--Apri un file .lua , .LUA
--if fbrowser.fl[fbrowser.s].name == "eboot.pbp" or fbrowser.fl[fbrowser.s].name == "EBOOT.PBP" then 
--playpbp(fbrowser.fl[fbrowser.s].name)
--end 

--if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".iso" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".ISO" then 
--System.startISO(fbrowser.fl[fbrowser.s].name)
--end 


--Music : .png o .PNG
--if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".png" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".PNG" then 
--screen:clear() 
--img = Image.load(fbrowser.fl[fbrowser.s].name) 
--screen:blit(0,0,img) 
--screen.flip() 
--screen.waitVblankStart(100) 
--end 

--Image : .bmp o .BMP
--if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".bmp" or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".BMP" then 
--screen:clear()  
--img = Image.load(fbrowser.fl[fbrowser.s].name)  
--screen:blit(0,0,img)  
--screen.flip()  
--screen.waitVblankStart(100)  
--end  


--Destra : Modalità USB
if pad:right() and not oldpad:right() then  
if usbstate == 0 then
System.usbDiskModeActivate()
usbstate = 1
else
System.usbDiskModeDeactivate()    
usbstate = 0 
end  
end

--elseif fbrowser.fl[fbrowser.s].directory then   
--ystem.currentDirectory(fbrowser.fl[fbrowser.s].name)   
--fbrowser.s = 1   
--fbrowser.fl=System.listDirectory()   
--fbrowser.nf=table.getn(fbrowser.fl)   
--fbrowser.ls = 1   
--end    
--end 



--elseif pad:triangle() and not oldpad:triangle() then
--if System.currentDirectory ~= "ms0:/" then
--System.currentDirectory("./..")
--fbrowser.s = 1
--fbrowser.fl=System.listDirectory()
--fbrowser.nf=table.getn(fbrowser.fl)
--fbrowser.ls = 1
--end
--end
--end

end  --Fine fbrowser (NON AVVIATO)

while true do   
pad = Controls.read()  


runfbrowser()   --(AVVIA FBROWSER)
--Equalizzatore

if playing == true then
time = Mp3me.percent()
songtime = Mp3me.songTime()
artist = Mp3me.artist()
title = Mp3me.title()
album = Mp3me.album()
vis = Mp3me.vis(5)
vis1 = Mp3me.vis(10)
vis2 = Mp3me.vis(15)
vis3 = Mp3me.vis(20)
vis4 = Mp3me.vis(25)
vis5 = Mp3me.vis(30)
vis6 = Mp3me.vis(35)
vis7 = Mp3me.vis(40)
vis8 = Mp3me.vis(45)
vis9 = Mp3me.vis(50)
vis10 = Mp3me.vis(55)
vis11 = Mp3me.vis(60)
vis12 = Mp3me.vis(65)
vis13 = Mp3me.vis(70)
vis14 = Mp3me.vis(75)
vis15 = Mp3me.vis(80)
vis16 = Mp3me.vis(85)
vis17 = Mp3me.vis(90)
vis18 = Mp3me.vis(95)
vis19 = Mp3me.vis(100)
year = Mp3me.year()
ibit = Mp3me.instantBitrate()
if visualizza_percent_canzone == 1 then
screen:print(430,70,time.."%",white)
end 
end
--Barra di Avanzamento
if playing == true then
if barra_di_avanzamento == 1 then 
screen:fillRect(226, 66, time*2, 20, rosso) 
end 
end

if visualizza_eq == 1 then
if playing == true then
screen:print(10,(yeq-vis),eqchar,Color.new(0,0,255))
screen:print(12,(yeq-vis1),eqchar,Color.new(0,30,255))
screen:print(14,(yeq-vis2),eqchar,Color.new(0,60,255))
screen:print(16,(yeq-vis3),eqchar,Color.new(0,90,255))
screen:print(18,(yeq-vis4),eqchar,Color.new(0,120,255))
screen:print(20,(yeq-vis5),eqchar,Color.new(0,150,255))
screen:print(22,(yeq-vis6),eqchar,Color.new(0,170,255))
screen:print(24,(yeq-vis7),eqchar,Color.new(0,200,255))
screen:print(26,(yeq-vis8),eqchar,Color.new(0,230,255))
screen:print(28,(yeq-vis9),eqchar,Color.new(0,255,255))
screen:print(30,(yeq-vis10),eqchar,Color.new(30,255,255))
screen:print(32,(yeq-vis11),eqchar,Color.new(60,255,255))
screen:print(34,(yeq-vis12),eqchar,Color.new(90,255,255))
screen:print(36,(yeq-vis13),eqchar,Color.new(120,255,255))
screen:print(38,(yeq-vis14),eqchar,Color.new(150,255,255))
screen:print(40,(yeq-vis15),eqchar,Color.new(170,255,255))
screen:print(42,(yeq-vis16),eqchar,Color.new(200,255,255))
screen:print(44,(yeq-vis17),eqchar,Color.new(230,255,255)) 
screen:print(46,(yeq-vis18),eqchar,Color.new(245,255,255)) 
screen:print(48,(yeq-vis19),eqchar,Color.new(255,255,255))
end
end
--STOP
if pad:triangle() and not oldpad:triangle() then
if playing == true then
Mp3me.stop()
System.memclean()
time = "0"
playing = false
nowplaying = " "
end
end

--Controllo eos
if Mp3me.eos() == "true" then
	nextsong = true
	while nextsong == true do
	
	fbrowser.s = fbrowser.s + 1
	if fbrowser.s < 1 then
			fbrowser.s = 1
			nextsong = false
	end
	if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".mp3" then 
		Mp3me.stop()
		Mp3me.load(fbrowser.fl[fbrowser.s].name)
		Mp3me.play()
		nextsong = false
		playing = true
		nowplaying = fbrowser.fl[fbrowser.s].name
	end
	end
end

--Pausa
if pad:square() and not oldpad:square() then
if playing == true then
Mp3me.pause()
end
end
--Avanti
if pad:r() then
nextsong = true
	while nextsong == true do
	
	fbrowser.s = fbrowser.s + 1
	if fbrowser.s < 1 then
			fbrowser.s = 1
			nextsong = false
	end
	if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".mp3" then
		Mp3me.stop()
		Mp3me.load(fbrowser.fl[fbrowser.s].name)
		Mp3me.play()
		nextsong = false
		playing = true
		nowplaying = fbrowser.fl[fbrowser.s].name
	end
	end
end

--Indietro
if pad:l() then
nextsong = true
	while nextsong == true do
	
	fbrowser.s = fbrowser.s - 1
	if fbrowser.s == 0 then
			fbrowser.s = 1
			nextsong = false
	end
	if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".mp3" then
		Mp3me.stop()
		Mp3me.load(fbrowser.fl[fbrowser.s].name)
		Mp3me.play()
		nextsong = false
		playing = true
		nowplaying = fbrowser.fl[fbrowser.s].name
	end
	end
end
if pad:circle() then
System.memclean()
dofile("./SYSTEM/system.lua")
end
--Fine
screen.waitVblankStart()   
screen.flip()  
oldpad = pad  

end 
 