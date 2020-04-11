close all; clear; clc
im = imread('Flor.bmp');
imshow(im);
% Converte em escala de cinza
img = rgb2gray(im);

% Binarização da imagem
uimg = graythresh(img);
bw = im2bw(img,uimg);

imshow(bw);

%% Ler outra imagem
imfinfo('cameraman.tif') 

                            %ColorType is gray-scale, width is 256 ... etc.
                    
I1 = imread('cameraman.tif'); %Read in the TIF format cameraman image

imwrite(I1,'cameraman.jpg','jpg');    % Write the resulting array I1 to 
                                      % disk as a JPEG image
                                      
imfinfo('cameraman.jpg')


A=imread('cameraman.tif');      % Read in intensity image

imshow(A);                      % First display image using imshow

imagesc(A);                     % Next display image using imagesc

axis image;                     % Proporção correta da imagem exibida
axis off;                       % desligar o rótulo do eixo
colormap(gray);                 % exibir imagem intensidade em escala de cinza

%%
B=rand(256).*1000;      % Gerar matriz de imagem aleatória na faixa 0-1000 

imshow(B);              % Os maus resultados de contraste usando imshow porque 
                        % os dados excede o intervalo esperado

imagesc(B);             
axis image; axis off;   
colormap(gray); colorbar;

imshow(B,[0 1000]);     % Mas se especificar o intervalo de dados explicitamente seguida
                        % imshow também exibe o contraste da imagem correta

%%                        
B = imread('cell.tif');       % Ler intensidade de imagem em 8-bit

C = imread('spine.tif');      % Ler intensidade de imagem em 8-bit

D = imread('onion.png');      % Ler imagem colorida em 8-bit

subplot(3,1,1); imagesc(B); axis image; 
axis off; colormap(gray);               

subplot(3,1,2); imagesc(C); axis image; 
axis off; colormap(jet);                

subplot(3,1,3); imshow(D);

%%
B=imread('cell.tif');       

imshow(B);                  % examine tons de cinza da imagem em espectador interativo

D=imread('onion.png');      

imshow(B);                  % examine RGB image

B(25,50)                    % print um pixel em (25,50)
B(25,50) = 255;             % definir o valor de pixel (25,50) para branco
imshow(B);                  

D(25,50, :)                     % impressão valor de pixel RGB no local (25,50)
D(25,50, 1)                     % imprimir apenas o valor vermelho na (25,50)
D(25,50, :) = (255, 255, 255);  % definir o valor de pixels para RGB branco
imshow(D);                      

%%
D=imread('onion.png');      

Dgray = rgb2gray(D);        

subplot(2,1,1); imshow(D); axis image;
subplot(2,1,2); imshow(Dgray);         