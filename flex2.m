function matriz2 = flex2(matriz,x_real,y_real)

linhas = size(matriz,1);
colunas = size(matriz,2);
imagi = [1 colunas colunas 1;1 1 linhas linhas;1 1 1 1];
fisic = [x_real' - x_real(1);y_real' - y_real(1)]+1;
fisic(3,1) = 1;
for i = 2:length(x_real)
    fisic(3,i) = sqrt( (imagi(1,i))^2 + (imagi(2,i))^2 - (fisic(1,i))^2 - (fisic(2,i))^2 );
end
rota = fisic*pinv(imagi);
matriz2 = matriz*0;
for i=1:linhas
    for j=1:colunas
        pos = rota*([i;j;1]);
        %x = round(pos(1)+x_real(1));
        %y = round(pos(2)+y_real(1));
        x = round(pos(1));
        y = round(pos(2));
        if(x>0)&&(x<linhas)&&(y>0)&&(y<colunas)
            matriz2(i,j) = matriz(x,y);
        end
    end
end