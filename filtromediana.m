function matriz = filtromediana(matriz,k)

if mod(k,2)== 0
    disp('k deve ser ímpar.');
else
    tam = size(matriz);
    matriz = double(matriz);
    %filtro = ones(k);
    temp = matriz*0;
    x = (k-1)/2;
    for i=1+x:tam(1)-x
        for j=1+x:tam(2)-x
            local = matriz(i-x:i+x,j-x:j+x);
            local = sort(local(1:numel(local)));
            temp(i,j) = local(round(x^2/2));
        end
    end
    matriz = uint8(abs(temp));
end
        
