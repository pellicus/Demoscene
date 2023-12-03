
function TIC()
    T=time()/4000
    cx,cy =  math.sin(T*2-11)*-2, math.sin(T)*-3
    scx,ccx,scy,ccy=math.sin(cx),math.sin(cx-11),math.sin(cy),math.sin(cy-11)

    Py,Pz =  -16 * scy, 16 * ccy
    Px, Pz =   -Pz * scx,  Pz * ccx

    k= math.sin(T)/2 + .5 
    r =  math.pi/(9-k*7)

    for i=0,23 do
        poke(16320+i,i>3 and 255/(1+2^(3+i%3-i/4)))
        poke(16320+i+24,math.sin(i/36)*255)
    end

    for o=0,28000 do
        x,y= o%240-120,o/240-50
        D,O,i=x*x+y*y,.6,1
        if  D<1600  then  -- add this to skip lines: and y%2>1
            px, py, pz ,x,y= Px, Py,Pz,x/240,y/240 
            Dy,Dz= y*ccy+scy/2,y*scy-ccy/2
            Dx,Dz= x*ccx-Dz*scx,x*scx+Dz*ccx

            while O > .1 and i > .1 do
                a = (math.atan(pz, py)//r + .5)*r
                i = pz * math.sin(a) + py * math.sin(a-11) -3
                a = (math.atan(px, i)//r  + .5)*r
                i = px * math.sin(a) + i * math.sin(a-11) -.8
                px,py,pz = px +  i * Dx, py +  i * Dy, pz +  i * Dz
                O = O -  .025
            end
            i = O^3*300
            poke4(o,(i>15 and 15 or i)/2 )
        else
            a,i=cx*x-cy*y,cy*x+cx*y
            i=(a//1~i//1)//64
            poke4(o,8.5+i%2*(D^.5-45)/14 +o^2.5%1)
        end
    end 

    for y=90,135 do 
        o=math.sin(T*5+y/2)*2//1
        memcpy(y*120+o/7,(185-y+o)*120,120)
    end 
      
 --    for i=0,15 do
 --     rect(i*8,0,8,8,i)
 --    end

end

function SCN(i)
    if i>90 then
    for i=0,23 do 
        poke(0x3fc0+i,i%3==2 and i*8)
        poke(0x3fc0+24+i,i%3==2 and i*8)
    end
    end
end 



