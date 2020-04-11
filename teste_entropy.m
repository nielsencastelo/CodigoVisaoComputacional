% testa a entropia da imagem
f = imread('aeroplane_silhouette.png');
Hf = entropyIm(f);
b = imrotate(f,90);
Hb = entropyIm(b);

se = strel('square',20);
fe = imerode(f,se);
He = entropyIm(fe);

fd = imdilate(f,se);
Hd = entropyIm(fd);

figure;
subplot(1,2,1);imshow(f);
subplot(1,2,2);imshow(b);

figure;
subplot(1,2,1);imshow(fe);
subplot(1,2,2);imshow(fd);