
im=imread('retangulo.bmp');
imshow(im)
%im=imrotate(im,90);
[lin col]=size(im);
somb=0;
somw=0;
for x=1:lin
    for y=1:col
        if(im(x,y)==0)
           somb=somb+1;
        end
        if(im(x,y)==1)
           somw=somw+1;
        end
    end
end
somb
somw