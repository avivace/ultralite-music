--Esplora File Con Funzioni
giallo = Color.new(255, 255, 0)
aka = System.buttonPressed(1)
System.currentDirectory("ms0:/") 
rosso = Color.new(255,0,0) 
bianco = Color.new(255,255,255) 
inuso = 0
inpausa = 0
fbrowser = {s = 1, fl = System.listDirectory("ms0:/"),ls = 1, sp = 20} 
screen:clear()
fbrowser.nf = table.getn(fbrowser.fl) 
oldpad = Controls.read() 
dossierencours = System.currentDirectory() 



function runfbrowser() 
screen:clear() 
for i = ((fbrowser.ls-1)*fbrowser.sp)+1, fbrowser.ls*fbrowser.sp do 
if fbrowser.nf >= i then 
screen:print(5,((i-((fbrowser.ls-1)*fbrowser.sp))*10)-10,fbrowser.fl[i].name,bianco) 



elseif fbrowser.nf < i then break end
end 



screen:print(5,((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*10)-10, 
fbrowser.fl[fbrowser.s].name,rosso) 
if pad:down() and not oldpad:down() then fbrowser.s = fbrowser.s + 1 end 
if pad:up() and not oldpad:up() then fbrowser.s = fbrowser.s - 1 end 
if fbrowser.s > fbrowser.nf then fbrowser.s = fbrowser.nf elseif fbrowser.s < 1
then fbrowser.s = 1 end 
if fbrowser.s > fbrowser.sp*fbrowser.ls then fbrowser.ls = fbrowser.ls + 1
elseif fbrowser.s < ((fbrowser.ls-1) * fbrowser.sp)+1 then fbrowser.ls = fbrowser.ls - 1 fbrowser.s = (fbrowser.ls)*fbrowser.sp end



--Funzioni quando si schiaccia X su di un FILE
if pad:cross() and not oldpad:cross() then  
if not fbrowser.fl[fbrowser.s].directory then  

--Destra : Modalità USB
if pad:right() and not oldpad:right() then
System.UsbModeActivate() 
end 

elseif fbrowser.fl[fbrowser.s].directory then  
System.currentDirectory(fbrowser.fl[fbrowser.s].name)  
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
