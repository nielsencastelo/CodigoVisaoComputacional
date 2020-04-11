clear
clc
load img;
% a=[1 3 9 6 9 9;
%    1 9 8 4 6 7;
%    2 3 4 0 6 0;
%    2 0 0 4 0 7 ;
%    2 3 0 4 8 8;
%    3 3 8 8 0 0];
a=im;
w=[-1 -1 -1;
    -1 8 -1
    -1 -1 -1];

[lna, cola] = size(a);     
[lnw, colw] = size(w);
nyr = lna + lnw - 1;      
nyc = cola + colw - 1;



%a=rgb2gray(a);

%a=im;

said=zeros(lna+lnw+5,cola+colw+5);
said(1:size(a,1),1:size(a,2))=a;
%a2=[a ]

y1 = zeros(nyr, nyc);  


cont=0;
for yr = 1:nyr            
    for yc = 1:nyc
        soma = 0;
        for mr = 1:lnw    
            for mc = 1:(colw)
                soma = soma + said(yr-mr+lnw, yc-mc+colw) * w(mr, mc);
                %said(mr+yr,yc+mc)=soma
            cont=cont+1;
            end
        end
        y1(yr, yc) = soma;  
    end
end
y1=y1(1:size(a,1),1:size(a,2)) ;
imshow(y1);

