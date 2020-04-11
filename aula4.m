% Filtro de imagens usando FFT
A=imread('trui.png'); B=fft2(A); B=fftshift(B);		%Read in image and take FT
[x y]=size(A); [X Y]=meshgrid(1:x,1:y); 			%Construct Gaussian PSF
h=exp(-(X-x/2).^2./48).*exp(-(Y-y/2).^2./48);		%extending over entire array
H=psf2otf(h,size(h)); H=fftshift(H);                %Get OTF corresponding to PSF
g=ifft2(B.*H); g=abs(g);                            %generate blurred image via %Fourier domain

G=fft2(g); G=fftshift(G);                           %Take FT of image
indices=find(H>1e-6);                               %Do inverse filtering AVOIDING
F=zeros(size(G)); F(indices)=G(indices)./H(indices);	%small values in OTF !!
f=ifft2(F); f=abs(f);                               %Inverse FT to get filtered image
subplot(1,4,1), imshow(g,[min(min(g)) max(max(g))]);	%Display “original” blurred image 
subplot(1,4,2), imagesc(h); axis square; axis off;		%Display PSF
subplot(1,4,3), imagesc(abs(H)); axis square; axis off; 	%Display MTF
subplot(1,4,4), imagesc(f); axis square; axis tight; axis off; 	%Display filtered image


% Erosão
bw = imread('text.png');            		%Read in binary image
se=ones(6,1);                       		%Define structuring element
bw_out=imerode(bw,se);              		%Erode image
subplot(1,2,1), imshow(bw);         		%Display original
subplot(1,2,2), imshow(bw_out);     		%Display eroded image

% Dilatação
bw = imread('text.png');            		%Read in binary image
se=[0 1 0; 1 1 1; 0 1 0];                   %Define structuring element
bw_out=imdilate(bw,se);              		%Erode image
subplot(1,2,1), imshow(bw);         		%Display original
subplot(1,2,2), imshow(bw_out);     		%Display dilated image

% Operador strel
bw = imread('text.png');            		%Read in binary image
se1 = strel('square',4)                     %4-by-4 square
se2 = strel('line',5,45)     				%line, length 5, angle 45 degrees
bw_1=imdilate(bw,se1);              		%Dilate image
bw_2=imerode(bw,se2);              			%Erode image
subplot(1,2,1), imshow(bw_1);         		%Display dilated image
subplot(1,2,2), imshow(bw_2);               %Display eroded image


% Efeito dilatação erosão
length=18; tlevel=0.2;                                     		%Define SE and percent threshold level
A=imread('circuit.tif'); subplot(2,3,1), imshow(A)              %Read image and display
B=im2bw(A,tlevel); subplot(2,3,2), imshow(~B);                  %Threshold image and display
SE=ones(3,length); bw1=imerode(~B,SE);                          %Erode vertical lines
subplot(2,3,3), imshow(bw1);                                    %display result
bw2=imerode(bw1,SE'); subplot(2,3,4), imshow(bw2);              %Erode horizontal lines
bw3=imdilate(bw2,SE');bw4=imdilate(bw3,SE);                     %Dilate back
subplot(2,3,5), imshow(bw4);                                    %Display
boundary=bwperim(bw4);[i,j]=find(boundary);                     %Superimpose boundaries
subplot(2,3,6), imshow(A); hold on; plot(j,i,'r.');

