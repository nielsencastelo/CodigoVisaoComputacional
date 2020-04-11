function matriz = t_hough(imagbin)

teta = -90:90;
teta = teta*pi/180;
ro = [];
for i = 1:size(imagbin,1)
    for j=1:size(imagbin,2)
        if(imagbin(i,j))
            ro = [ro;i*sin(teta) + j*cos(teta)];
        end
    end
end
for i = 1:size(ro,1)
    plot(teta,ro(i,:));
    hold on;
end
matriz = 0;
% res = teta*0;
% ro = sortrows(ro);
% for i=1:size(ro,2)
%     for j=1:size(ro,1)-1
%         if(ro(j,i) == ro(j+1,i))
%             res(i) = ro(j,i);
%         end
%     end
% end
% matriz = res;
% plot(teta,matriz,'r');