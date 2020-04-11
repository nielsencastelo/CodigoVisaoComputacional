function matriz2 = perspectiva(matriz,x_real,y_real)
%matriz - imagem original
%x_real - colunas
%y_real - linhas

linhas = size(matriz,1);
colunas = size(matriz,2);
imagi = [1 1 1 1;1 colunas colunas 1;linhas colunas colunas*linhas 1;linhas 1 linhas 1];
%imagi = [linha coluna linha*coluna 1]
fisic = [y_real x_real x_real.*y_real];
fisic = [fisic [1;1;1;1]];
%fisic = [linha coluna linha*coluna 1]
r = inv(imagi)*fisic(:,1); %transformação para linha
s = inv(imagi)*fisic(:,2); %transformação para coluna
matriz2 = matriz*0;
for i=1:linhas
    for j=1:colunas
        x = round([i j i*j 1]*r);
        y = round([i j i*j 1]*s);
        if(x>0)&&(x<linhas)&&(y>0)&&(y<colunas)
            matriz2(i,j) = matriz(x,y);
        end
    end
end