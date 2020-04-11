a = imread('mao.jpg');
%a = imread('esticado4.jpg');
figure;
imshow(a);
a1 = rgb2gray(a);
figure;
imshow(a1);
a2 = a1>50;
figure;
imshow(a2);
b = ones(3);
c = dilatacao(a2,b);
figure;
imshow(c);
c = erosao(c,b);
figure;
imshow(c);
d = esqueleto(c);
mask1 = [0 1 0;0 1 0;0 0 0];%cima
mask2 = [0 0 0;0 1 0;0 1 0];%baixo
mask3 = [0 0 0;1 1 0;0 0 0];%esquerda
mask4 = [0 0 0;0 1 1;0 0 0];%direita
mask5 = [1 0 0;0 1 0;0 0 0];
mask6 = [0 0 1;0 1 0;0 0 0];
mask7 = [0 0 0;0 1 0;1 0 0];
mask8 = [0 0 0;0 1 0;0 0 1];
imshow(a);
hold on;
for i=2:size(d,1)-1
    for j=2:size(d,2)-1
        if(d(i,j)==1)
            seg = d(i-1:i+1,j-1:j+1);
            if(  (isequal(seg,mask1))||(isequal(seg,mask2))||(isequal(seg,mask3))||(isequal(seg,mask4))||(isequal(seg,mask5))||(isequal(seg,mask6))||(isequal(seg,mask7))||(isequal(seg,mask8))  )
                plot(j,i,'o');
                hold on;
            end
        end
    end
end
        