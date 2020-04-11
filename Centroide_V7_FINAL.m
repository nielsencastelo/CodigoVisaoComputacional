
clc
im=d2;
im=im2bw(im);
ac2=0;

for i=1:size(im,1) 
    ac=0;
    for j=1:size(im,2) 
        if(im(i,j)==0)
            ac=ac+1;

        end
    end
    
    x=x+i*ac; 
    ac2=ac2+ac; 
end
x=x/ac2;
ac2=0;
    for j=1:size(im,2) 
        ac=0;
        for i=1:size(im,1) 
            if(im(i,j)==0)
                ac=ac+1;
                

            end
        end
y=y+j*ac;
ac2=ac2+ac;
    end
    y=y/ac2;
k=im;
k2=im;
x=round(x)
y=round(y)
k2(x,y)=1;
subplot(1,2,1),imshow(k),title('original')
subplot(1,2,2),imshow(k2),title('centroide')