% operação do logaritmo
% s = c * log(1+r)
% s = c * r^gama
% onde, 0<= s <= 1, 0<= r <= 1
clear;clc;close all;
a = imread('cameraman.tif');
ad = im2double(a);
x = ad;
y = ad;
[r,c] = size(ad);
factor = 1;
for i = 1 : r
    for j = 1 : c
        x(i,j) = factor * log(1+ ad(i,j)); % Log
        y(i,j) = factor * ad(i,j)^2;       % Exponencial
    end
end

subplot(1,2,1);imshow(ad);title('Antes');
subplot(1,2,2);imshow(x);title('Depois');
