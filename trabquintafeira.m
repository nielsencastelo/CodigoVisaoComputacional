A=[1 2 3;
   4 5 6;
   7 8 9];
B=[1 2 3 7 0 8;
   2 9 0 1 3 3;
   9 6 0 3 9 7;
   0 8 6 3 1 8;
   3 8 9 3 9 2;
   3 9 7 2 8 1];
aux1 = zeros(3);
c = zeros(3);
for i=1:3
    for j=1:3
        aux1(i,j)=A(i,j)*B(i,j);
        c(i,j) = aux1(i,j);
    end
end
%aux1 <---- 1ª matriz auxiliar
aux1;
aux1(2,2)=min(min(aux1));
c(2,2)=aux1(2,2)
aux1
c
%-----------------montando auxiliar 2---------------------
 aux2 = zeros(3);
 for i=1:3
     for j=1:3
         aux2(i,j)=A(i,j)*B(i,j+3);
         c(i,j+3) = aux2(i,j);
     end
 end
 aux2(2,2)=min(min(aux2));
 c(2,5)=aux2(2,2);
 aux2
 c
% %-----------------montando auxiliar 3---------------------
 aux3 = zeros(3);
 for i=1:3
     for j=1:3
         aux3(i,j)=A(i,j)*B(i+3,j);
         c(i+3,j)=aux3(i,j);
     end
 end
 aux3(2,2)=min(min(aux3));
 c(5,2)=min(min(aux3));
 aux3
 c
% %-----------------montando auxiliar 4---------------------
 aux4 = zeros(3);
 for i=1:3
     for j=1:3
         aux4(i,j)=A(i,j)*B(i+3,j+3);
         c(i+3,j+3)=aux4(i,j);
     end
 end
 aux4(2,2)=min(min(aux4));
 c(5,5)=min(min(aux4));
 aux4
 c