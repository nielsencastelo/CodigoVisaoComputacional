clear;clc;close all;
% Esqueletização
f = imread('cromossomo.gif');
f = im2double(f);
h = fspecial('gaussian',25,155);
g = imfilter(f,h,'replicate');
figure;imshow(g);

g = im2bw(g,1.5*graythresh(g));
figure;imshow(g);
s = bwmorph(g,'skel',Inf);
figure;imshow(s);
s1 = bwmorph(s,'spur',8);
figure;imshow(s1);