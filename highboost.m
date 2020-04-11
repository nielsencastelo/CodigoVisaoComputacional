% Implementando o melhoramento de nitidez usando o filtro high boost
clear;close all; clc;
f = imread('cameraman.tif'); 
% J = imnoise(I,'salt & pepper',0.02);
fb = medfilt2(f,[15 15]);
gm =  f - fb; % ou usar imsubtract(f,f_bar);
k = 3;
g =  f + k * gm;

subplot(2,2,1); imshow(f);
subplot(2,2,2); imshow(fb);
subplot(2,2,3); imshow(gm);
subplot(2,2,4); imshow(g);
