
if boot ~= true then
	System.memclean()
	dofile("ms0:/PSP/GAME/UltraLite Music/SYSTEM/settings.cfg")
	System.setcpuspeed(speed)
	Mp3me.stop()
end

speed = System.getCpuSpeed()
bus = System.getBusSpeed()
playing = false
nowplaying = " "
System.currentDirectory("ms0:/Music/")
white = Color.new(255,255,255)
red = Color.new(255,0,0)
blue = Color.new(0,0,255)
fbrowser = {s = 1, fl = System.listDirectory("ms0:/Music/"),ls = 1, sp = 22}
fbrowser.nf = table.getn(fbrowser.fl)
oldpad = Controls.read()

function runfbrowser()

for i = ((fbrowser.ls-1)*fbrowser.sp)+1, fbrowser.ls*fbrowser.sp do
if fbrowser.nf >= i then
screen:print(15,((i-((fbrowser.ls-1)*fbrowser.sp))*10)+10,
fbrowser.fl[i].name,white)
elseif fbrowser.nf < i then break end
end

screen:print(15,((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*10)+10,
fbrowser.fl[fbrowser.s].name,red)

if pad:down() and not oldpad:down() then fbrowser.s = fbrowser.s + 1 end
if pad:up() and not oldpad:up() then fbrowser.s = fbrowser.s - 1 end

if fbrowser.s > fbrowser.nf then fbrowser.s = fbrowser.nf elseif fbrowser.s < 1 then fbrowser.s = 1 end
if fbrowser.s > fbrowser.sp*fbrowser.ls then fbrowser.ls = fbrowser.ls + 1
elseif fbrowser.s < ((fbrowser.ls-1) * fbrowser.sp)+1 then fbrowser.ls = fbrowser.ls - 1 fbrowser.s = (fbrowser.ls)*fbrowser.sp end

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
battime = System.powerGetBatteryLifeTime()
battime = tonumber(battime)
batpercent = System.powerGetBatteryLifePercent()
batpercent = tonumber(batpercent)
if batpercent < 0 then
	batpercent = "Power Adapter"
end
if battime <= 0 then
	battime = "Power Adapter"
else
battime = battime / 60
end
pad = Controls.read()
screen:clear()
--screen:blit(1,1,bg,false)
runfbrowser()
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
screen:print(400,240,time.."%",white)
screen:print(400,250,songtime,white)
screen:print(30,250,artist.."--"..title,white)
screen:print(30,260,album.."--"..year,white) 
screen:print(10,(270-vis),"X",Color.new(0,0,255))
screen:print(30,(270-vis1),"X",Color.new(0,30,255))
screen:print(50,(270-vis2),"X",Color.new(0,60,255))
screen:print(70,(270-vis3),"X",Color.new(0,90,255))
screen:print(90,(270-vis4),"X",Color.new(0,120,255))
screen:print(110,(270-vis5),"X",Color.new(0,150,255))
screen:print(130,(270-vis6),"X",Color.new(0,170,255))
screen:print(150,(270-vis7),"X",Color.new(0,200,255))
screen:print(170,(270-vis8),"X",Color.new(0,230,255))
screen:print(190,(270-vis9),"X",Color.new(0,255,255))
screen:print(210,(270-vis10),"X",Color.new(30,255,255))
screen:print(230,(270-vis11),"X",Color.new(60,255,255))
screen:print(250,(270-vis12),"X",Color.new(90,255,255))
screen:print(270,(270-vis13),"X",Color.new(120,255,255))
screen:print(290,(270-vis14),"X",Color.new(150,255,255))
screen:print(310,(270-vis15),"X",Color.new(170,255,255))
screen:print(330,(270-vis16),"X",Color.new(200,255,255))
screen:print(350,(270-vis17),"X",Color.new(230,255,255))
screen:print(370,(270-vis18),"X",Color.new(245,255,255))
screen:print(390,(270-vis19),"X",Color.new(255,255,255))
end
screen:print(370,5,"CPU "..speed.." BUS "..bus,white)
screen:print(1,5,"Time "..battime,white)
screen:print(220,5,batpercent.."%",white)
screen:print(420,260,"Settings",red)
screen.waitVblankStart()
screen.flip()

if pad:circle() and not oldpad:circle() then
if playing == true then
Mp3me.stop()
System.memclean()
time = "0"
playing = false
nowplaying = " "
end
end

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

if pad:square() and not oldpad:square() then
if playing == true then
Mp3me.pause()
end
end
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

oldpad = pad
if pad:start() then
dofile("./System/settings.lua")
end
end
