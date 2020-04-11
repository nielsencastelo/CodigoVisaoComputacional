function result = achapista(imseg)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a = -20:.1:20;
b = a*0;
figure;
for linha = 1:size(imseg,1)
    for coluna = 1:size(imseg,2)
        if(imseg(linha,coluna) == true)
            b = linha - a*coluna;
            plot(a,b);
            pause(.5);
            hold on;
        end
    end
end
end

