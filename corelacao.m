% Saulo Daniel F. Pontes
% Jonas Honorato Costa
% Alex Pereira da Silva
% Brunno Samuel da Silva Correa
% Marcos Barca
%

function [img_out] = corelacao(img,M)
 
% i=imread('cameraman.tif');
% i=im2bw(i);
% % M= [-1 -1 -1; -1 8 -1; -1 -1 -1];%passa auta
% M= [0 -1 0; -1 4 -1; 0 -1 0];filtro laplaciano - detector de bordas
% i2=corelacao(i,M);
% subplot(1,2,1)
% imshow(i)
% subplot(1,2,2)
% imshow(i2)

 img_out1=zeros(size(img,1),size(img,2));
 img_out2=zeros(size(img,1),size(img,2));
 img_out3=zeros(size(img,1),size(img,2));
 img_out4=zeros(size(img,1),size(img,2));
 
for i=1:size(img,1)
    
    for j=1:size(img,2)
                     
       if(i>1 && i<size(img,1) && j>1 && j<size(img,2)) 
           
         img_out1(i,j)= max([ (img(i-1,j-1)*M(1,1))/255 , (img(i-1,j)*M(1,2))/255 , (img(i-1,j+1)*M(1,3))/255 , (img(i,j-1)*M(2,1))/255 , (img(i,j)*M(2,2))/255 , (img(i,j+1)*M(2,3))/255 , (img(i+1,j-1)*M(3,1))/255 , (img(i+1,j)*M(3,2))/255 , (img(i+1,j+1)*M(3,3))/255 ]);
        
         img_out2(i,j)= min([ (img(i-1,j-1)*M(1,1))/255 , (img(i-1,j)*M(1,2))/255 , (img(i-1,j+1)*M(1,3))/255 , (img(i,j-1)*M(2,1))/255 , (img(i,j)*M(2,2))/255 , (img(i,j+1)*M(2,3))/255 , (img(i+1,j-1)*M(3,1))/255 , (img(i+1,j)*M(3,2))/255 , (img(i+1,j+1)*M(3,3))/255 ]);
        
         img_out3(i,j)= (img(i-1,j-1)*M(1,1))/255 + (img(i-1,j)*M(1,2))/255 + (img(i-1,j+1)*M(1,3))/255+(img(i,j-1)*M(2,1))/255+ (img(i,j)*M(2,2))/255+(img(i,j+1)*M(2,3))/255+ (img(i+1,j-1)*M(3,1))/255+(img(i+1,j)*M(3,2))/255+ (img(i+1,j+1)*M(3,3))/255;
         
         a=[ (img(i-1,j-1)*M(1,1))/255 , (img(i-1,j)*M(1,2))/255 , (img(i-1,j+1)*M(1,3))/255 , (img(i,j-1)*M(2,1))/255 , (img(i,j)*M(2,2))/255 , (img(i,j+1)*M(2,3))/255 , (img(i+1,j-1)*M(3,1))/255 , (img(i+1,j)*M(3,2))/255 , (img(i+1,j+1)*M(3,3))/255 ];
         
         img_out4(i,j)=mode(double(a));
         
       end
       
    end
end

 subplot(1,5,1)
 imshow(img)
 subplot(1,5,2)
 imshow(img_out1)
 subplot(1,5,3)
 imshow(img_out2)
  subplot(1,5,4)
 imshow(img_out3)
  subplot(1,5,5)
 imshow(img_out4)
end