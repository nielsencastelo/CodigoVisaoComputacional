function matriz2 = flex3(matriz,x_real,y_real)
%matriz - Matriz que carrega a imagem;
%x_real - Carrega as colunas;
%y_real - Carrega as linhas;
linhas = size(matriz,1);
colunas = size(matriz,2);
centro = [mean(y_real);mean(x_real)];
%centro[linha,coluna];
imagi = [1 colunas colunas 1;1 1 linhas linhas;1 1 1 1;0 0 0 1];
%imagi[colunas;linhas;1;1]
%imagi(1,:) = imagi(1,:) - colunas/2;
%imagi(2,:) = imagi(2,:) - linhas/2;
fisic = [x_real';y_real'];
%fisic(1,:) = fisic(1,:) - centro(1);
%fisic(2,:) = fisic(2,:) - centro(2);
%fisic(3,1) = 1;
for i = 1:length(x_real)
    fisic(3,i) = sqrt( (imagi(1,i)-centro(1))^2 + (imagi(2,i)-centro(2))^2 - (fisic(1,i)-centro(1))^2 - (fisic(2,i)-centro(2))^2 );
end
fisic = [fisic;0 0 0 1];
rota = fisic*inv(imagi);
matriz2 = matriz*0;
for i=1:linhas
    for j=1:colunas
        pos = rota*([j;i;1;1]);
        x = round(pos(2));
        y = round(pos(1));
        if(x>0)&&(x<linhas)&&(y>0)&&(y<colunas)
            matriz2(i,j) = matriz(x,y);
        end
    end
end