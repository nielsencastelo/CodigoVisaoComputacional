% Filtro de derivada de 1ª ordem (prewitty)
% V = (gx^2 + gy^2)^0.5
clear;close all;clc;
ic = imread('circuit.tif');
px = [-1 0 1; -1 0 1; -1 0 1]; % direção para x
icx = filter2(px,ic);
figure, imshow(icx/255);
py = px';                      % direção para y
icy = filter2(py,ic);
figure, imshow(icy/255);
pedge = sqrt(icx.^2 + icy.^2);
figure, imshow(pedge/255);
fe = im2bw(pedge/255,0.3);
figure, imshow(fe);