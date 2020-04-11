function matriz = filtropassaalta(matriz,k)

if mod(k,2)== 0
    disp('k deve ser ímpar.');
else
    x = (k-1)/2;
    tam = size(matriz);
    matriz = double(matriz);
    filtro = ones(k)*-1;
    filtro( round(x^2/2) ) = numel(filtro) - 1;
    temp = matriz*0;
       for i=1+x:tam(1)-x
        for j=1+x:tam(2)-x
            local = matriz(i-x:i+x,j-x:j+x);
            local = local.*filtro;
            f = mean(local(1:numel(local)));
            %f = sum(local(1:numel(local)));
            temp(i,j) = f;
        end
    end
    matriz = uint8(abs(temp));
end
        
