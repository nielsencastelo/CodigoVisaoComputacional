%Rotacionar 


img = imread('mao.jpg');
d=img;
A=d;
ang=90;
x1=zeros([size(A,1)*size(A,2) 1]);
x2=zeros([size(A,2)*size(A,1) 1]);



%Mudar o tamanho da imagem
C=uint8(zeros([size(A,1) size(A,2) 3 ]));

m=1;
%Encontrar o centro da imagem
midx=ceil((size(C,1)+1)/2);
midy=ceil((size(C,2)+1)/2);



for i=1:size(A,1)
    i1=i-midx;
    for j=1:size(A,2)
        %convert de polar para cartesiano
        [t,r]=cart2pol(i1,j-midy);
        %converte de graus para cartesiano e adiciona o angulo
        t1=((t*180)/pi)+ang;
        %Converte de graus para radianos
        t=((t1*pi)/180);
        %Converte de cartesiano para coordenadas
        [x,y]=pol2cart(t,r);
        x1(m)=round(x+midx);
        x2(m)=round(y+midy);
       
         
        m=m+1;
       
       
       
    end
   
end
%Chequa se o valor gerado é do tamanho do valor original.
x1(find(x1 < 1))=1;
x2(find(x2 < 1))=1;

n=1;
for i=1:size(A,1)
    for j=1:size(A,2)
        C(x1(n),x2(n),:)=A(i,j,:);
       
        n=n+1;
    end
   
end


imshow(C);