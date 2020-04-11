function [im1 im2 im3 im4] = deteccaodelinhas(matriz)


    tam = size(matriz);
    matriz = double(matriz);
    filtro1 = ones(3)-1;
    filtro1(2,:) = 2;
    filtro2 = filtro1';
    filtro3 = ones(3)-1;
    filtro3(1:4:9) = 2;
    filtro4 = flipdim(filtro3,1);
    temp = matriz*0;
    im1 = matriz*0;
    im2 = matriz*0;
    im3 = matriz*0;
    im4 = matriz*0;
    for i=2:tam(1)-1
        for j=2:tam(2)-1
            local = matriz(i-1:i+1,j-1:j+1);
            temp = local.*filtro1;
            im1(i,j) = mean(temp(1:numel(temp)));
            temp = local.*filtro2;
            im2(i,j) = mean(temp(1:numel(temp)));
            temp = local.*filtro3;
            im3(i,j) = mean(temp(1:numel(temp)));
            temp = local.*filtro4;
            im4(i,j) = mean(temp(1:numel(temp)));
        end
    end
    im1 = im1>max(max(im1))/2;
    im2 = im2>max(max(im2))/2;
    im3 = im3>max(max(im3))/2;
    im4 = im4>max(max(im4))/2;
end
        
