function matriz2 = flex(matriz,x_real,y_real)

linhas = size(matriz,1);
colunas = size(matriz,2);
imagi = [1 colunas colunas 1;1 1 linhas linhas;1 1 1 1];
fisic = [x_real';y_real';1 1 1 1];
rota = fisic*pinv(imagi);%invertido
matriz2 = matriz*0;
for i=1:linhas
    for j=1:colunas
        pos = rota*([i;j;1]);
        %pos = pos+[linhas/2;colunas/2;1;1];
        x = round(pos(1));
        y = round(pos(2));
        if(x>0)&&(x<linhas)&&(y>0)&&(y<colunas)
            matriz2(i,j) = matriz(x,y);
        end
    end
end