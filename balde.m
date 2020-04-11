function s = balde(fig,y,x,cor_nova)

tamanho_imagem = size(fig);
corant = fig(y,x);      %indica a cor que sera substituida por cornova
pilha = [y x];          %Inicializa a pilha com o primeiro ponto
topo = 1;        %Inicializa o topo da pilha com 1
while(topo > 0)%Enquanto a pilha nao tiver vazia
    y_ = pilha(topo,1);
    x_ = pilha(topo,2);
    fig(y_,x_) = cor_nova;
    topo = topo-1;
    if((y_-1>0)&(fig(y_-1,x_)==corant))%Visinho da esquerda
        topo = topo +1;
        pilha(topo,1) = y_-1;
        pilha(topo,2) = x_;
    end
    if((x_-1>0)&(fig(y_,x_-1)==corant))%Visinho de cima
        topo = topo +1;
        pilha(topo,1) = y_;
        pilha(topo,2) = x_-1;
    end
    if((y_+1<=tamanho_imagem(1))&(fig(y_+1,x_)==corant))%Visinho da direita
        topo = topo +1;
        pilha(topo,1) = y_+1;
        pilha(topo,2) = x_;
    end
    if((x_+1<=tamanho_imagem(2))&(fig(y_,x_+1)==corant))%Visinho de baixo
        topo = topo +1;
        pilha(topo,1) = y_;
        pilha(topo,2) = x_+1;
    end
    imshow(uint8(fig));
    pause(.01);
end    
s=fig;