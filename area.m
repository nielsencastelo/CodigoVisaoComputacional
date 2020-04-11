clear;
im = imread ('ret.bmp');
[l c]=size(im);
areapreta=0;
areabranca=0;
for x=1:l
    for y=1:c
         if (im(x,y)==0)
            areapreta=areapreta+1;
         end
          if (im(x,y)==1)
            areabranca=areabranca+1;
         end
    end
    end
areapreta
areabranca
imshow(im);


        

