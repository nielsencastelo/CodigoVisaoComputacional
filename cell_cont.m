tic
a = imread('celulas_t.bmp');
b = double(a)*255;
count = 0;
tam = size(b);
for i=1:tam(1)
    for j=1:tam(2)
        if b(i,j)==255
            b = balde2(b,i,j,128);
            count= count + 1;
        end
    end
end
imshow(uint8(b));
toc
%296 células
%1646.515412 seconds. balde2
%2814.183777 seconds balde.
%58.5 por cento do tempo total