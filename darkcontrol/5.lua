--File creato automaticamente da Miro LUA
--Lecture des touches
oldpad = Controls.read()
MS = "ms0:"
--Boucles Principale
while true do

--Lecture des touches
pad = Controls.read()

	--verifica dell'umd
	verifumd = UMD.checkDisk()
	
	--se l'umd è presente
	if verifumd==1 then	
	
	--Clavier..
	nomiso = System.startOSK("ms0:/ISO/-.ISO","Mettere il nome del vostro umd")
	
	--Taille de l'UMD
	tailleumd = UMD.getSize() 
	
	--Espace restant de la MS
	taillems = System.getFreeSpace(MS)  
	
	--V�rification des taille
	if taillems > tailleumd then  
	
	--Si il y a assez d'espace...
	UMD.ripISO(nomiso)	
	
	--Pour tout autre chose
	else
	System.message("Lo spazio nella MS non è sufficiente",0) 
System.currentDirectory("ms0:/PSP/GAME/dc/SYSTEM")
       dofile("4.lua")       
end
	
	--Pas d'UMD...
	else 
	System.message("Nessun umd dentro il lettore",0) end   
	System.currentDirectory("ms0:/PSP/GAME/dc/SYSTEM")
       dofile("4.lua")

	if UMD.ripISO(nomiso) then 
	System.message("Rip dell'umd completato",0) 
       System.currentDirectory("ms0:/PSP/GAME/dc/SYSTEM")
       dofile("4.lua")
end  
	 
	screen.flip() 
	screen.waitVblankStart() 
	oldpad = pad	 
end 
