
--for j=0,47 do                            -- 12
 --   poke(16320+j,math.sin(j/15+math.sin(j%3*6.5))^2*255)
-- end
-- s=math.sin

 function TIC()
    t=time()/1000
 --   w=t/100 --,math.sin(t)
    for o=0,32000 do
        x,y,j =o % 240 -120 ,80  -o / 240 -math.sin(t)*20 ,o%50
        poke(16320+j,math.sin(j/15+math.sin(j%3*(6+math.sin(t))))^2*250)
--        v=s(px/50+t)+s(py/22+t)+s(px/32)
 --       poke4(o,v*2%8)
         c,d = 1,(x^2+y^2)^.5 / 400
--        if d<.1 then 

--            x,y = x/80,y/80
--            z =(1-(x^2+y^2))/2 -- .5*vz--^.5
--            x,y =t+x/z,k+ y/z
--            f= c + (s(y*2+t)+s(x+t)+2)/4
--        else
    
 --       r = math.atan(py, px)
 --       p= 3.14
  --      u,v=p*r, p*(.5/d)+t
        

--          x = d^.1
 --          y = r / 7-- 6.28;
     --   vx,vy = x/80,y/80
        j =(1-d)*50 -- .5*vz--^.5
        
        vx,vy =t+x/j, y/j
        f= c + (math.sin(vy*2+t)+math.sin(vx+t)+2)/4

       for i = 1,2 do    
            j= i*t/100-math.atan(y, x)/7
            j =(j- j//1)*20
            vx= (j- j//1)*2-1
            j=( i*t/100-d^.1)*20
            vy =(j- j//1)*2-1 
            c = math.min(c, vx^2+vy^2)
        end
        f = d<.1 and f or  1-d+c*d*(.5-d)*20
        poke4(o,f*8+o^2.5%1);

    end
  --  for i=0,15 do
   --     rect(i*8,136-8,8,8,i)
  --    end
     
end

