%Negativo da imagem

%Para tirar o negativo da imagem, precisamos transformar valores próximos de 0 em valores próximos de 255, e vice-versa. 
%Uma forma de fazer isso é subtrair 255 da imagem, e depois multiplicar por -1. Neste caso, porém, 
%precisaremos realizar uma mudança no tipo do dado, 
%pois a variável é inteira e sem sinal:

close all; clear; clc
f = imread('toycars1.png');
g = rgb2gray(f);
y = uint8(-1*(double(g)-255));
imshow(f);