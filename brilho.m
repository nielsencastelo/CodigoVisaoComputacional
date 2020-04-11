%Aumentando e reduzindo o brilho

%Aumentar o brilho significa deixar a imagem mais clara. 
%Esta operação é feita somando uma constante à imagem: 

close all; clear; clc
f = imread('toycars1.png');
g = rgb2gray(f);
y = g + 50;
imshow(y);