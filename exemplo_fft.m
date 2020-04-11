% Exemplo da FFT

f = imread('BBC_grey_testcard.png');

fa = fft2(f); % DFT

PSF = fspecial('gaussian',size(f),6);
OTF = fft2(PSF);

Ffilt = ifft2(OTF.*fa);

subplot(1,2,1);imshow(f,[]);  colormap(gray);	%Display Results
subplot(1,2,2);imagesc(abs(Ffilt)); axis image; axis off;

