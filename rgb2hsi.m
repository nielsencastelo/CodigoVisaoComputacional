function hsi=rgb2hsi(image) 
rgb_r=image(:,:,1); 
rgb_g=image(:,:,2); 
rgb_b=image(:,:,3); 
[width,height]=size(rgb_r); 
hsi=zeros(width,height,3); 
hsi_h=hsi(:,:,1); 
hsi_s=hsi(:,:,2); 
hsi_i=hsi(:,:,3); 
PI=3.1415956; 
for i=1:width 
     for j=1:height 
         R=double(rgb_r(i,j));G=double(rgb_g(i,j));B=double(rgb_b(i,j)); 
        min = R; 
if (G < min) 
   min = G; 
     end 
if (B < min) 
   min = B; 
     end 
I =(R+G+B)/3; 
S = 1 - min/I; 
if (S == 0.0) 
   H = 0; 
     else 
   H = ((R-G)+(R-B))/2.0; 
   H = H/sqrt((R-G)*(R-G) + (R-B)*(G-B)); 
   H = acos(H); 
   if (B > G) 
   
    H = 2*PI - H; 
         end 
   H = H/(2*PI); 
     end 
     hsi_h(i,j)=H;hsi_s(i,j)=S;hsi_i(i,j)=I/255; 
end 
end 
hsi(:,:,1)=hsi_h; 
hsi(:,:,2)=hsi_s; 
hsi(:,:,3)=hsi_i; 