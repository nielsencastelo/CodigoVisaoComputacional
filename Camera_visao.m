%clear; clc; close all;

% configurando a camera
vid = videoinput('winvideo', 1, 'YUY2_160x120');
set(vid,'TriggerRepeat',Inf);
set(vid, 'ReturnedColorSpace', 'rgb');
vid.FrameGrabInterval = 1;

% enqunto o matlab estiver ativo captura fotos do anbiente
while(1)
    start(vid);% liga a camera
   
    img = getdata(vid,1); % captura uma imagem
    img = imresize(img, 0.6); % diminui a scala da imagem (para facilitar os calculos)
    
    % exibe imagem original
    subplot(2,2,1)
    imshow(img);
  
    % converte a imagem em preto e branco a partir da media dos pixels
    img2 = rgb2gray(img);
    
    a=sum(img2);
    b=sum(a);
    
    media = round(b/(size(img2,1)*size(img2,2)));
    img2 = rgb2gray(img)< media;
    
    % exibe imagem binarizada
    subplot(2,2,2)
    imshow(img2)
    
    % cria o esqueleto da imagem
    esqueleto = esqueletizacao(img2);
    
    % exibe imagem esqueletizada
    subplot(2,2,3)
    imshow(esqueleto)
    
    % detecta as pontas dos dedos (e qualquer outro objeto)
    for i=2:size(img,1)-1
        for j=2:size(img,2)-1
            
            % se esistir um ponta marque de vermenho na imagem original
            if((esqueleto(i,j)==1 && ...
                    esqueleto(i-1,j)==0 && ...
                    esqueleto(i,j-1)==0 && ...
                    esqueleto(i,j+1)==0 && ...
                    esqueleto(i-1,j-1)==0 && ...
                    esqueleto(i-1,j+1)==0) || (esqueleto(i,j)==1 && ...
                    esqueleto(i-1,j-1)==0 && ...
                    esqueleto(i+1,j-1)==0 && ...
                    esqueleto(i,j-1)==0 && ...
                    esqueleto(i-1,j)==0 && ...
                    esqueleto(i+1,j)==0 ) || ( esqueleto(i,j)==1 && ...
                    esqueleto(i,j-1)==0 && ...
                    esqueleto(i,j+1)==0 && ...
                    esqueleto(i+1,j)==0 && ...
                    esqueleto(i+1,j-1)==0 && ...
                    esqueleto(i+1,j+1)==0)  || ( esqueleto(i,j)==1 && ...
                    esqueleto(i-1,j)==0 && ...
                    esqueleto(i+1,j)==0 && ...
                    esqueleto(i,j+1)==0 && ...
                    esqueleto(i-1,j+1)==0 && ...
                    esqueleto(i+1,j+1)==0 ) )
                
                img(i,j,1)=255;
                img(i,j,2)=0;
                img(i,j,3)=0;
                
            end
        end
        
    end
    
    % exibe a imegem original com as pontas marcadas
    subplot(2,2,4)
    imshow(img)
    stop(vid) % desliga camera a 

    pause(0.05)
    
end


