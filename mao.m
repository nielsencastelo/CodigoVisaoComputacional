a = imread('mao.jpg');
b = rgb2gray(a);
c = b>50;
est = ones(3);
dil = dilatacao(c,est);
ero = erosao(dil,est);
esqu = esqueleto(ero);
figure;
imshow(a);
hold on;
for i=2:size(esqu,1)
    for j= 2:size(esqu,2)
        if(esqu(i,j)==1)
            temp = esqu(i-1:i+1,j-1:j+1);
            temp = sum(sum(temp));
            if(temp==2)
                plot(j,i,'o');
            end
        end
    end
end