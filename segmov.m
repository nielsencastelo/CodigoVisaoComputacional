function segmov(n_frames)

vid = videoinput('winvideo',1);
start(vid);
preview(vid);
figure;
padrao = double( rgb2gray(getsnapshot(vid)) );
acc = double( padrao*0 );
for i =1:n_frames
    frame = double( rgb2gray(getsnapshot(vid)) );
    acc = acc + padrao - frame;
    imshow(uint8(acc));
    pause(.1);
end
delete(vid);
