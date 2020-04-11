function matriz = alargamentocontraste(matriz,x1,y1,x2,y2)

plot([0 x1 x2 255],[0 y1 y2 255]);
title('Função Transformação');
figure;
imshow(matriz);
title('Imagem Original');
figure;
imhist(matriz);
title('Histograma Original');
matriz = double(matriz);
a1 = y1/x1;
b1 = 0;
a2 = (y2-y1)/(x2-x1);
b2 = y2 - a2*x2;
a3 = (255-y2)/(255-x2);
b3 = y2 - a3*x2;
for i=1:size(matriz,1)
    for j=1:size(matriz,2)
        if matriz(i,j) < x1
            matriz(i,j) =round( a1*matriz(i,j) + b1 );
        end
        if matriz(i,j)>=x1 && matriz(i,j)<x2
            matriz(i,j) = round( a2*matriz(i,j) + b2 );
        end
        if matriz(i,j) >= x2
            matriz(i,j) = round( a3*matriz(i,j) + b3 );
        end
    end
end
matriz = matriz/max(max(matriz))*255;
matriz = uint8(matriz);
figure;
imshow(matriz);
title('Imagem Modificada');
figure;
imhist(matriz);
title('Histograma Modificado');
        