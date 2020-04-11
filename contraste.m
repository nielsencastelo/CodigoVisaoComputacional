% Aumentando e reduzindo o contraste
% Para aumentar o contraste, deixamos as cores claras mais claras e 
% as cores escuras mais escuras. 
% Isso pode ser feito facilmente no Matlab com algumas operações matemáticas. 
% Primeiro, definimos o que são cores claras e o que são cores escuras, 
% através de um limiar: 
close all; clear; clc
f = imread('toycars1.png');
g = rgb2gray(f);

limiar = 180;
% Esta variável indica que todos os valores com intensidade acima de 180 serão 
% realçados enquanto todos abaixo de 180 serão atenuados. Com o limiar 
% definido, fazemos uma operação de divisão: 
a = double(g)/limiar;

% O resultado da divisão será: 
% Números entre 0 e 1, para valores de g menores que 180 
% Números maiores que 1, para valores maiores que 180

% Por isso a conversão de g para o tipo double foi necessária, já que o tipo 
% uint8 não permite representar esses resultados. Após a divisão, o aumento 
% no contraste é realizado por uma potenciação: 
b = a.^2;

% Essa operação faz com que os valores maiores que 1 fiquem ainda maiores, 
% e os valores menores que 1 ainda menores. A operação é concluída ao 
% multiplicar os valores pelo limiar, e converter os dados para uint8 
% novamente: 
c = uint8(b*limiar);

imshow(c);