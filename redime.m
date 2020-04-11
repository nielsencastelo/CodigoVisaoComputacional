function b = redime(a,x_tam)
%A matriz a corresponde à imagem enquanto que x_tam é um valor que
%corresponde ao fator de aumento(x_tam>1)/redução(x_tam<1)
%Prof: Lincoln Machado de Araújo
%Disciplina: Processamento Digital de Imagens

if x_tam > 1                                                %Se for um aumento da imagem
    b = zeros(ceil(size(a,1)*x_tam),ceil(size(a,2)*x_tam)); %Cria matriz de zeros do tamanho especificado
else                                                        %Se for uma redução da imagem
    b = zeros(fix(size(a,1)*x_tam),fix(size(a,2)*x_tam));   %Cria matriz de zeros do tamanho especificado
end

for i = 1:size(b,1)                                         %Varre as linhas da matriz
    for j = 1:size(b,2)                                     %Varre as colunas da matriz
        if x_tam > 1                                        %Se for um aumento da imagem
            b(i,j) = a(ceil(i/x_tam),ceil(j/x_tam));        %Copia o píxel para o lugar especificado
        else                                                %Se for uma redução da imagem
            b(i,j) = a(fix(i/x_tam),fix(j/x_tam));          %Copia o píxel para o lugar especificado
        end
    end
end