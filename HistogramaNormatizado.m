clc
a = [1 3 9 6 9 9;
1 9 8 4 6 7;
2 3 4 0 6 0;
2 0 0 4 0 7 ;
2 3 0 4 8 8;
3 3 8 8 0 0];
%hist(a)
[l,c]=size(a);
temp=zeros(3,(10));
temp2=temp(1,:);
salta=1;
for i = 1:l
    for j = 1:c
      tp = find(a == a(i,j));
           atual = a(i,j);
          tmh_tp = size(tp,1);
            if(size(find(temp2==a(i,j)),2)==0)
                temp2(1,salta)=a(i,j);
                temp(1,salta)=a(i,j);
                temp(2,salta)=tmh_tp;
                temp(3,salta)=round(((a(i,j)/(l*c)))*10);
                salta = salta+1;
            end
    end
end
subplot(1,2,1),hist(a),title('Histograma Original');
subplot(1,2,2),hist(temp(3,:)),title('Histograma Normalizado');

%temp(1,:)Pixels presentes na imagem
%temp(2,:)Quantização dos Pixels na imagem
%%temp(3,:)Varlor normalizado por round(Gnx*7)
%temp=temp(:,1:salta-1);
