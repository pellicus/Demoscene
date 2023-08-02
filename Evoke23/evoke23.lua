
--for j=0,47 do                            -- 12
 --   poke(16320+j,math.sin(j/15+math.sin(j%3*6.5))^2*255)
-- end
-- s=math.sin

--[[ void mainImage(out vec4 o, vec2 u) {
    o*=0.;
    vec3 R = iResolution;
    for ( o.z++; R.z++ < 32. ; )
        o += vec4((u+u-R.xy)/R.x,1,0)*(length(vec2(o.a=length(o.xz)-.7,o.y) )-.5);
        
    o += sin( 21.* ( atan(o.y,o.w) - atan(o.z,o.x) - iTime ) ); 
    }
 ]]
-- for i=0,47 do poke(0x3fc0+i,i*5)end

 --for j=0,47 do
 --poke(16320+j,math.sin(j/15+math.sin(j%3*7))^2*250)
 --end

V={}
 for o=0,32000 do
    --  j=o%50
         --x,y,j =o % 240 -120 ,80  -o / 240 -math.sin(t)*20 ,o%50
       ux,uy = o%240, o/240      
      ox, oy, oz, oa = 0, 0, 1, 0
      nx = (ux + ux - 240) / 240
       ny = (uy + uy - 130) / 240
      for c = 1, 64 do
          oa = math.sqrt(ox * ox + oz * oz)
          g = math.sqrt((oa - 0.7) * (oa - 0.7) + oy * oy)
          aa = g - 0.5
          ox = ox + nx * aa
          oy = oy + ny * aa
          oz = oz + aa
      end
      V[o]=math.atan2(oy, oa) - math.atan2(oz, ox)
 --     c=  (math.sin(10 *V[o]  - t))+1)/2
 --     poke4(o,c*16);
      
  end



function TIC()
    t=time()/1000
 --   w=t/100 --,math.sin(t)
   --  k = 16*(math.sin(t)+1)/2
   cx = math.sin(t)*.1
   cy = math.cos(t)*.1

   for o=0,32000 do

    c=  4*(math.sin(10 *V[o]  - t*4)+1)/2
    c=c+ o^2.5%1
 

        

        --  j=o%50
           --x,y,j =o % 240 -120 ,80  -o / 240 -math.sin(t)*20 ,o%50
   --[[       ux,uy = o%240, o/240      
        ox, oy, oz, oa = 0, 0, 1, 0
        nx = (ux + ux - 240) / 240
         ny = (uy + uy - 130) / 240
        for c = 1, 16 do
            oa = math.sqrt(ox * ox + oz * oz)
            g = math.sqrt((oa - 0.7) * (oa - 0.7) + oy * oy)
            aa = g - 0.5
            ox = ox + nx * aa
            oy = oy + ny * aa
            oz = oz + aa
        end
        c=  (math.sin(10 * (math.atan2(oy, oa) - math.atan2(oz, ox) - t))+1)/2
        poke4(o,c*16);
    ]]     
        --c=  (math.sin(10 * (math.atan2(oy, oa) - math.atan2(oz, ox) - t))+1)/2
        poke4(o,c)
    end
 --   for i=0,15 do
  --      rect(i*8,136-8,8,8,i)
 --    end
     
end

--[[ 
// 200 chars - iq and Fabrice not only fix a bug, they kill another 13 chars:

void mainImage(out vec4 o, vec2 u) 
{
    float ox=0.;
    float oy=0.;
    float oz=1.;
    float oa=0.;
    
    
    float Rx = iResolution.x;
    float Ry = iResolution.y;
    
    float nx= (u.x+u.x-Rx)/Rx;
    float ny= (u.y+u.y-Ry)/Rx;
    vec4 nuv=vec4(nx,ny,1,0);
    
    float aa=0.0;
    for (int c=0 ; c++ < 16 ; )
    {
        oa=length(vec2(ox,oz));
        float g=length(vec2(oa-.7,oy));
        aa=(g-.5);
        ox = ox + nx*aa;
        oy = oy + ny*aa;
        oz = oz + aa;
    }
    
    
    float s=sin( 10.* ( atan(oy,oa) - atan(oz,ox) - iTime ) );
    o = vec4(s); 
    
    
}
 ]]


-- <PALETTE>
-- 000:000000482065b13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7ffffff94b0c2566c86333c57
-- </PALETTE>


