function matriz = realcelocal(matriz,k)

matriz = double(matriz);
tam = size(matriz);
M = mean(matriz(1:numel(matriz)));
temp = matriz*0;
for i=2:tam(1)-1
    for j=2:tam(2)-1
        local = matriz(i-1:i+1,j-1:j+1);
        m = mean(local(1:9));
        sigma = std(local(1:9));
        A = k*M/sigma;
        temp(i,j) = A*(matriz(i,j) - m) + m;
    end
end
matriz = uint8(abs(temp));
        
