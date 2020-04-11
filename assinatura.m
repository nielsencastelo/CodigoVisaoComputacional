a = imread('triangulo.bmp');




for i = 2:21
    for j = 2:20
    if a(i,j+1) || a(i+1,j) || a(i-1,j) || a(i,j-1) || a(i+1,j+1) ||a(i-1,j+1) || a(i+1,j-1) || a(i-1,j-1) == 1
        b(i,j) = a(i,j);
    else
        b(i,j) = 1;
    end
     end
end

c = b;
c = c(3:end-1,2:end-1);

im = c;
ac2=0;
x=0;
y=0;
for i=1:size(im,1)
    ac=0;
    for j=1:size(im,2)
        if(im(i,j)==0)
            ac=ac+1;

        end
    end
    
    x=x+i*ac;
    ac2=ac2+ac;
end
x=x/ac2;
ac2=0;
    for j=1:size(im,2)
        ac=0;
        for i=1:size(im,1)
            if(im(i,j)==0)
                ac=ac+1;
                

            end
        end
y=y+j*ac;
ac2=ac2+ac;
    end
    y=y/ac2;
k=im;
k2=im;
x=round(x)
y=round(y)

r = [];
teta = [];

% for i=1:18
%         for j = 1:17
%             if c(i,j) == 0 && c(i,j+1) == 0
%             r = [r sqrt(((i-9)^2)+((j-9)^2))];
%             teta = [teta atan(j/i)];
%             else
%                 if c(i+1,j) == 0
%                     r = [r sqrt((((i+1)-9)^2)+((j-9)^2))];
%                     teta = [teta atan(j/(i+1))];
% %                  else
% %                      if c(i,j-1) == 0
% %                          r = [r sqrt(((i-9)^2)+(((j-1)-9)^2))];
% %                          teta = [teta atan((j-1)/i)];
% %                      end
%                 end
%             end
%         end
% end

for i=1:10
    for j=9:18
        if c(i,j) == 0
        r = [r sqrt(((i-x)^2)+((j-y)^2))];
        teta = [teta atan(j/i)];
        end
    end
end

for i=11:18
    for j=18:-1:9
        if c(i,j) == 0
        r = [r sqrt(((i-x)^2)+((j-y)^2))];
        teta = [teta atan(j/i)];
        end
    end
end

for i=18:-1:11
    for j=8:-1:1
        if c(i,j) == 0
        r = [r sqrt(((i-x)^2)+((j-y)^2))];
        teta = [teta atan(j/i)];
        end
    end
end

for i=10:-1:1
    for j=1:8
        if c(i,j) == 0
        r = [r sqrt(((i-x)^2)+((j-y)^2))];
        teta = [teta atan(j/i)];
        end
    end
end

c(x,y) = 0;

subplot(3,1,1)
imshow(a)
subplot(3,1,2)
imshow(c)
subplot(3,1,3)
plot(r)