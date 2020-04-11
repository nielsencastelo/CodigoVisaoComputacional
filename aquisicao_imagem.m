% Aquisição de imagem
x = videoinput('winvideo',1);

for i = 1 : 10
    img = getsnapshot(x);
    fname = ['Image' num2str(i)];
    imwrite(img,fname,'jpg');
    pause(2);
end