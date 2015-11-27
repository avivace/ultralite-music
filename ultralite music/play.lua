System.usbDiskModeActivate()
snow = Color.new(173,255,47)
IndianRed = Color.new(255,0,0)
OrangeRed = Color.new(255,250,205)
BlueViolet = Color.new(0,192,0)
goldenrod3 = Color.new(205,155,29)
drum = Sound.load("drums.wav",true)
bg = Image.load("bg.png")
tracknumber = 1

blue = Color.new(48,203,239)
dot1 = Image.createEmpty(10,10)
dot1:clear(blue)

dot2 = Image.createEmpty(10,10)
dot2:clear(IndianRed)

dot3 = Image.createEmpty(10,10)
dot3:clear(OrangeRed)

dot4 = Image.createEmpty(10,10)
dot4:clear(BlueViolet)

dot5 = Image.createEmpty(10,10)
dot5:clear(goldenrod3)



dot6 = Image.createEmpty(10,10)
dot6:clear(blue)

dot7 = Image.createEmpty(10,10)
dot7:clear(IndianRed)

dot8 = Image.createEmpty(10,10)
dot8:clear(OrangeRed)

dot9 = Image.createEmpty(10,10)
dot9:clear(BlueViolet)

dot10 = Image.createEmpty(10,10)
dot10:clear(goldenrod3)



dot11 = Image.createEmpty(10,10)
dot11:clear(blue)

dot12 = Image.createEmpty(10,10)
dot12:clear(IndianRed)

dot13 = Image.createEmpty(10,10)
dot13:clear(OrangeRed)

dot14 = Image.createEmpty(10,10)
dot14:clear(BlueViolet)

dot15 = Image.createEmpty(10,10)
dot15:clear(goldenrod3)

line = Image.createEmpty(480,2)
line:clear(snow)
r = math.random (9)


hi = 1
bi = 30
ci = 59
zi = 88
ii = 117
ri = 146
wi = 175
ei = 204
oi = 233
pi = 262

ji = 291
hi = 320
gi = 349
fi = 378
di = 407





drum:play()
while true do

screen:clear()
screen:blit(0,0,bg)



right = true

pad = Controls.read()
r = math.random (9)
w = math.random(20,240)
p = math.random(150,240)
s = math.random(170,240)
z = math.random(0,240)
a = math.random(70,240)


if pad:start()then
drum:stop()
break
end

if pad:select()then
dofile("index.lua")
end




screen:blit(bi,p,dot2)
screen:blit(hi,w,dot1)
screen:blit(ci,s,dot3)
screen:blit(zi,z,dot4)
screen:blit(ii,a,dot5)
screen:blit(ri,p,dot6)
screen:blit(wi,w,dot7)
screen:blit(ei,s,dot8)
screen:blit(oi,z,dot9)
screen:blit(pi,a,dot10)

screen:blit(ji,p,dot11)
screen:blit(hi,w,dot12)
screen:blit(gi,s,dot13)
screen:blit(fi,z,dot14)
screen:blit(di,a,dot15)
screen:blit(0,250,line)
screen:blit(0,0,bg)


if pad:cross()then
drum:play()
pad:right()
end

if pad:right()then
tracknumber = tracknumber + 1
screen.waitVblankStart(5)
end

if pad:left()then
tracknumber = tracknumber - 1
screen.waitVblankStart(5)
end

if pad:triangle() then
Image:save("image.png")
end


	screen.waitVblankStart()
	screen.flip()
end