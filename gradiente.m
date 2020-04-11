function [df Gx Gy] = gradiente(matriz)

tam = size(matriz);
matriz = double(matriz);
Gx = matriz*0;
Gy = Gx;
for i=2:tam(1)-1
    for j=2:tam(2)-1
        local = matriz(i-1:i+1,j-1:j+1);
        Gx(i,j) = local(3) + 2*local(6) + local(9) - (local(1) + 2*local(4) + local(7));
        Gy(i,j) = local(7) + 2*local(8) + local(9) - (local(1) + 2*local(2) + local(3));
    end
end
df = abs(Gx)+abs(Gy);
df = uint8(df);
Gy = uint8(Gy);
Gx = uint8(Gx);
        
