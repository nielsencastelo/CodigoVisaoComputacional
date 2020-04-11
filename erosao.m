function c = erosao(a,b)

%as dimensões de b devem ser ímpares

c = a*0;
tam = size(b);
for i = 1+1:size(a,1)-1
    for j = 1+1:size(a,2)-1
        if a( i-1:i+1 , j-1:j+1 ).*b==b
            c(i,j) = 1;
        end
    end
end