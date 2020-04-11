function matriz = t_hough2(imagbin)

teta = -90:90;
teta = teta*pi/180;
ro = [];
temp = sqrt(sise(imagbin,1)^2 + sise(imagbin,2)^2);
rough = zeros(round(2*temp),180);
for i = 1:size(imagbin,1)
    for j=1:size(imagbin,2)
        if(imagbin(i,j))
            ro = [ro;i*sin(teta) + j*cos(teta)];
        end
    end
end
ro = ro-min(min(ro));%Preparação para gerar imagem
for i = 1:size(rough,1)
   
end
matriz = 0;