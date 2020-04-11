% Implementa o c�digo da cadeia
clear;clc;close all;
f = imread('Fig1105(a)(noisy_stroke).tif');
h = fspecial('average',9); % Mascara m�diana de 9x9
g = imfilter(f,h,'replicate');
g = im2bw(g,0.5);% binariza a imagem
B = boundaries(g); % calcula a fronteira

figure;imshow(f);

d = cellfun('length',B);
[max_d,k] = max(d);
b = B{1};

[M N] = size(g);
g = bound2im(b,M,N,min(b(:,1)),min(b(:,2)));

figure;imshow(g);

[s, su] = bsubsamp(b,50);
g2 = bound2im(s,M,N,min(s(:,1)),min(s(:,2)));

figure;imshow(g2)

cn = connectpoly(s(:,1),s(:,2));

g2 = bound2im(cn,M,N,min(cn(:,1)),min(cn(:,2)));
figure;imshow(g2);
c = fchcode(su);

