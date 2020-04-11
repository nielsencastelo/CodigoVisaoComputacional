f = imread('mammogram.bmp');
g1 = imadjust(f,[0 1],[1 0]);

figure;imshow(f);
figure;imshow(g1);

% Operações com imagem
A = imread('cola1.png'); 
B = imread('cola2.png'); 
subplot(1,3,1), imshow(A); 
subplot(1,3,2), imshow(B); 
Output = imsubtract(A, B); 
subplot(1,3,3), imshow(Output); 
Output = imabsdiff(A, B); 
subplot(1,3,3), imshow(Output);

% Multiplicação com Imagem
Output = immultiply(A,1.5); 
subplot(1,3,3), imshow(Output); 
Output = imdivide(A,4); 
subplot(1,3,3), imshow(Output);

% Operação binária
A = imread('cameraman.tif');
subplot(1,2,1), imshow(A); 
B = imcomplement(A); 
subplot(1,2,2), imshow(B); 

% Operação binária
A=imread('toycars1.png'); %Read in 1st image
B=imread('toycars2.png'); %Read in 2nd image
Abw=im2bw(A); %convert to binary
Bbw=im2bw(B); %convert to binary
subplot(1,3,1), imshow(Abw); %Display 1st image
subplot(1,3,2), imshow(Bbw); %Display 2nd image
Output = xor(Abw, Bbw); %xor images images
subplot(1,3,3), imshow(Output);         %Display result

% Operação com Threshold
I = imread('trees.tif'); 
T = im2bw(I, 0.1); 
subplot(1,3,1), imshow(I); 
subplot(1,3,2), imshow(T); 


% Transformações com logaritmo
I = imread('cameraman.tif'); 
subplot(2,2,1), imshow(I); 
Id = im2double(I);
Output1 = 2*log(1+Id);
Output2 = 3 * log(1+Id);
Output3 = 4 * log(1+Id);
subplot(2,2,2), imshow(Output1);         
subplot(2,2,3), imshow(Output2);
subplot(2,2,4), imshow(Output3);

% Vizinhança 3x3
A = imread('cameraman.tif');     
subplot(1,2,1), imshow(A); 
func = @(x) max(x(:)); 
B = nlfilter(A,[3 3],func); 
subplot(1,2,2), imshow(B); 


% ruido com filtro
I = imread('eight.tif'); %Read in image
subplot(1,3,1), imshow(I); %Display image
Isp = imnoise(I,'salt & pepper',0.03); %Add 3% (0.03) salt and pepper noise
subplot(1,3,2), imshow(Isp); %Display result image Isp
Ig = imnoise(I,'gaussian',0.02); %Add Gaussian noise (with 0.02 variance)
subplot(1,3,3), imshow(Ig); %Display result image Ig


% Usando FFT
A=imread('BBC_grey_testcard.png'); 		%Read in test card image
FA = fft2(A); % DFT
FA = fftshift(FA);			%Take FFT and centre it
PSF =fspecial('gaussian',size(A),6);			%Define PSF
OTF = fft2(PSF); OTF=fftshift(OTF);		%Calculate corresponding OTF
Afilt=ifft2(OTF.*FA); Afilt=fftshift(Afilt);		%Calculate filtered image
subplot(1,4,1);imshow(A,[]);  colormap(gray);	%Display Results
subplot(1,4,2); imagesc(log(1+(PSF))); axis image; axis off; 
subplot(1,4,3); imagesc(log(1+abs(OTF))); axis image; axis off;
subplot(1,4,4); imagesc(abs(Afilt)); axis image; axis off;


PSF=fspecial('gaussian',size(A),6);			%Define PSF
OTF=fft2(PSF); OTF=fftshift(OTF);		%Calculate corresponding OTF
rlow=(size(A,1)./2)-3; rhigh=(size(A,1)./2)+3;	%Define range to be altered
clow=(size(A,2)./2)-3; chigh=(size(A,2)./2)+3;
Fphase=angle(OTF); 				%Extract Fourer phase 
Fphase(rlow:rhigh,clow:chigh)=Fphase(rlow:rhigh,clow:chigh)+0.*pi.*rand;
						%Add random component to selected phase 
OTF=abs(OTF).*exp(i.*Fphase);			%Recombine phase and modulus
Afilt=ifft2(OTF.*FA); Afilt=fftshift(Afilt);		%Calculate filtered image
psfnew=abs(fftshift((otf2psf(OTF)))); 		%Calculate corresponding PSF
subplot(1,4,2); imagesc(log(1+psfnew)); axis image; axis off; colormap(gray);
subplot(1,4,3); imagesc(log(1+abs(OTF))); axis image; axis off;
subplot(1,4,4); imagesc(abs(Afilt)); axis image; axis off;
 
PSF=fspecial('motion',30,30);			%Define motion PSF
OTF=psf2otf(PSF,size(A)); OTF=fftshift(OTF);	%Calculate corresponding OTF
Afilt=ifft2(OTF.*FA); 				%Calculate filtered image
subplot(1,4,1);imshow(A,[]); 			%Display results
subplot(1,4,2); imshow(log(1+PSF),[]); 
subplot(1,4,3); imshow(log(1+abs(OTF)),[]) 
subplot(1,4,4); imshow(abs(Afilt),[]);


A = imread('cameraman.tif');                         		%Read in image
FT=fft2(A); FT_centred=fftshift(FT);                    %take FT, get centred version too
subplot(2,3,1), imshow(A);                          	%Display image
subplot(2,3,2), imshow(log(1+abs(FT)),[]);          	%Display FT modulus (log scale)
subplot(2,3,3), imshow(log(1+abs(FT_centred)),[]);      %Display centred FT modulus(log scale)
 
Im1=abs(ifft2(FT)); subplot(2,3,5), imshow(Im1,[]); 	%Inverse FFT and display
Im2=abs(ifft2(FT_centred)); subplot(2,3,6), imshow(Im1,[]); %Inverse FFT and display
