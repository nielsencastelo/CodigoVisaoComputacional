% mostra vetor caracteristicos
clear; close all; clc;
x1 = [1; 1];
x2 = [1.5; 3.5];
x3 = [3.5; 5];
x4 = [5; 4];
x5 = [1; 2.5];
x6 = [2.5; 3];
x7 = [4; 4];
x8 = [4.4; 5];
x9 = [2; 2];
x10 = [2.6; 1.5];
x11 = [3.8; 6];
x12 = [5; 6];

w1 = [1.5; 2];
w2 = [4; 5];

hold on;

plot(x1(1),x1(2),'rx');
plot(x2(1),x2(2),'rx');
plot(x3(1),x3(2),'ro');
plot(x4(1),x4(2),'ro');
plot(x5(1),x5(2),'rx');
plot(x6(1),x6(2),'rx');
plot(x7(1),x7(2),'ro');
plot(x8(1),x8(2),'ro');
plot(x9(1),x9(2),'rx');
plot(x10(1),x10(2),'rx');
plot(x11(1),x11(2),'ro');
plot(x12(1),x12(2),'ro');

plot(w1(1),w1(2),'bx');
plot(w2(1),w2(2),'bo');

axis([-1 7 -1 7]);