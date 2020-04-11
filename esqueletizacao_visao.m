function [seg] = esqueletizacao(img)

%figure,imshow(img)

if  size(img,3)==1
    seg = img;    
else
     %seg = rgb2gray(img)>210; % techoud     
     seg = im2bw(img);
end

cont = 1;
x = seg;

%laco para as condicoes de entrada passo 1 ou passo 2
while cont == 1
    cont = 0;

%passo 1:
for i=2:size(img,1)-1
    for j=2:size(img,2)-1
        num = 0;
        if(seg(i,j) == 1)
        b = seg(i-1:i+1,j-1:j+1);
        num = sum(sum(b))-1;
        e = [seg(i-1,j) seg(i-1,j+1) seg(i,j+1) seg(i+1,j+1) seg(i+1,j) seg(i+1,j-1) seg(i,j-1) seg(i-1,j-1)];
        f = [e(2:end) e(1)];
        g = sum((f-e) == 1);
        end
        if (num>=2)&&(num<=6) && (g == 1) && (seg(i-1,j)*seg(i,j+1)*seg(i+1,j) == 0)&&(seg(i,j+1)*seg(i+1,j)*seg(i,j-1) == 0)
            x(i,j) = 0;
            cont = 1;
            g = 0;
            
        end
    end
end

% valores marcados em 'x' valores marcados em 'x' passados para 'seg'(Matriz Original) - passo 1
seg = x;

%passo 2:
 for i=2:size(img,1)-1
     for j=2:size(img,2)-1
         num = 0;
         if (seg(i,j) == 1)
         b = seg(i-1:i+1,j-1:j+1);
         num = sum(sum(b))-1;
         e = [seg(i-1,j) seg(i-1,j+1) seg(i,j+1) seg(i+1,j+1) seg(i+1,j) seg(i+1,j-1) seg(i,j-1) seg(i-1,j-1)];
         f = [e(2:end) e(1)];
         g = sum((f-e) == 1);
         end
         if (num>=2)&&(num<=6)&&(g == 1) && (seg(i-1,j)*seg(i,j+1)*seg(i,j-1) == 0)&&(seg(i-1,j)*seg(i+1,j)*seg(i,j-1) == 0)
             x(i,j) = 0;
             cont = 1;
             g = 0;
         end
     end
 end
% valores marcados em 'x' passados para 'seg'(Matriz Original) - passo 1
 seg = x;
end

end