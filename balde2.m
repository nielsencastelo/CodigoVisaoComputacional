function s = balde2(fig,y,x,cor_nova)
tamanho_imagem = size(fig);
corant = fig(y,x);      %indica a cor que sera substituida por cornova
fig(y,x) = cor_nova;
lista = [y x];          %Inicializa a pilha com o primeiro ponto
nelementos = 1;        %Inicializa o topo da pilha com 1
while(nelementos > 0)%Enquanto a pilha nao tiver vazia
    y_ = lista(1,1);
    x_ = lista(1,2);
    if y_+1 <= tamanho_imagem(1)
    if( fig(y_+1,x_) == corant )%Falta verificar as bordas
        fig(y_+1,x_) = cor_nova;
        lista = [lista;y_+1 x_];
        nelementos = nelementos+1;
    end
    end
    if x_+1 <= tamanho_imagem(2)
    if( fig(y_,x_+1) == corant )
        fig(y_,x_+1) = cor_nova;
        lista = [lista;y_ x_+1];
        nelementos = nelementos+1;
    end
    end
    if y_-1 ~= 0
    if( fig(y_-1,x_) == corant )
        fig(y_-1,x_) = cor_nova;
        lista = [lista;y_-1 x_];
        nelementos = nelementos+1;
    end
    end
    if x_-1 ~= 0
    if( fig(y_,x_-1) == corant )
        fig(y_,x_-1) = cor_nova;
        lista = [lista;y_ x_-1];
        nelementos = nelementos+1;
    end
    end
    temp = [];
    for i=1:nelementos
        if (~isequal(lista(i,:),[y_ x_]))
            temp = [temp;lista(i,:)];
        end
    end
    nelementos = nelementos - 1;
    lista = temp;
    imshow(uint8(fig));
    pause(0.01)
    
end
s=fig;