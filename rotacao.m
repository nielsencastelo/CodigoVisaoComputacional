function a = rotacao(matriz,angulo)

%Acertando as referâncias para os eixos
%i - linha, corresponde ao eixo x
%j - coluna, corresponde ao eixo y
%|y| _ |sin0 cos0 |*|i|
%|x| - |cos0 -sin0| |j|
[lin col]= size(matriz);
angulo = angulo*pi/180;
a = zeros(lin,col);
rota = [sin(angulo) cos(angulo) 0;cos(angulo) -sin(angulo) 0;0 0 1];
%trans = [1 0 lin/2;0 1 col/2;0 0 1]*rota*[1 0 -lin/2;0 1 -col/2;0 0 1];
trans = rota;
for i=1:lin     %linhas
    for j=1:col %colunas
        pos = round(trans*([i;j;1]-[lin/2;col/2;0]))+[col/2;lin/2;0];
        if(pos(2)>0)&&(pos(2)<=lin)&&(pos(1)>0)&&(pos(1)<=col)
            a(i,j) = matriz(pos(2),pos(1));
        end
    end
end