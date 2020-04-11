function matriz = filtroautoreforco(matriz,k,a)

if mod(k,2)== 0
    disp('k deve ser ímpar.');
else
    tam = size(matriz);
    matriz = double(matriz);
    filtro = ones(k);
    temp = matriz*0;
    x = (k-1)/2;
    for i=1+x:tam(1)-x
        for j=1+x:tam(2)-x
            local = matriz(i-x:i+x,j-x:j+x);
            f = local.*filtro;
            f = mean(f(1:numel(f)));
            temp(i,j) = f;
        end
    end
    matriz = uint8(abs(a*matriz - temp));
end
        
