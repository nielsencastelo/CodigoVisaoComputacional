clear;clc;close all;
A = imread ('bobodacorte.jpg');
a = double(A);
r = sqrt (a(:,:,1) + a(:,:,2));
d = a(:,:,3)./r;
 
y = zeros(size(A,1),size(A,2));
t = d > 11.5;

imshow(t)
x=a;
imshow(x)
x(:,:,1) = a(:,:,1)+t*150;
x(:,:,2) = a(:,:,2)+t*150;
x(:,:,3) = a(:,:,3)+t*150;
imshow(uint8(x))
