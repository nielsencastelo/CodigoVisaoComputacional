function c = dilatacao(a,b)

%a é a imagem e b é o elemento estruturante.

c = a*0;
tam = size(b);
for i = 2:size(a,1)-1
    for j = 2:size(a,2)-1
        if a(i,j)==1
            c(i-1:i+1,j-1:j+1) = b;
        end
    end
end