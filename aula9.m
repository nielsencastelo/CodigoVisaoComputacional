clear;clc;close all;
% Calcula o número de euler da imagem
f = imread('circles.png');
eu = bweuler(f);
imshow(f);


% Calcula o perimetro da imagem

per = bwperim(f);