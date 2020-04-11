A=imread('cameraman.tif'); 
[rows, dims]=size(A);	   
Abuild = zeros(size(A)); 	   

% amostragem aleatória de 1% dos pontos e convulue com uma PSF gaussiana

sub = rand(rows.*dims,1)<0.01;
Abuild(sub) = A(sub); 
h = fspecial('gaussian',[10 10],2);
B10 = filter2(h,Abuild); 
subplot(1,2,1), imagesc(Abuild); axis image; axis off;colormap(gray); title('Pontos do objeto')
subplot(1,2,2), imagesc(B10); axis image; axis off;colormap(gray); title('Resposta do sistema LSI')

