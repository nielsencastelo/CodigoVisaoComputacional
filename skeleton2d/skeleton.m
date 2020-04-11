clear all
figure(1)
%%Ler a Imagem
[imagen,map]=imread('perro.jpg');
subplot(2,2,1)
imshow(imagen)
title('imagen original')
%imagen em binario
imagen_binario= im2bw(imagen,map,0.9);
subplot(2,2,2)
imshow(imagen_binario)
title('imagen en binario')
%imagen complemento
imagen_binario_complemento = imcomplement(imagen_binario);
%transformacão
imagen_previa = imfill(imagen_binario_complemento ,'holes');
subplot(2,2,3)
imshow(imagen_previa);
title('imagen rellenada')
%%%skeleton
skeleton_ = bwmorph(imagen_previa ,'skel',inf);
subplot(2,2,4)
imshow((skeleton_));
title('skeleto')
%%Figure 2
figure(2)
frontera=edge(imagen_previa,'canny');
subplot(1,2,1)
imshow(imagen)
hold on;
subplot(1,2,2)
imshow(frontera+skeleton_);

