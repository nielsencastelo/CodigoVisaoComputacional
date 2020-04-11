% Ilustra o filtro wiener
I = imread('trui.png');
I = double(I); %Read in image
noise = 15.*randn(size(I)); %Generate noise
PSF = fspecial('motion',21,11); %Generate motion PSF
Blurred = imfilter(I,PSF,'circular'); %Blur image
BlurredNoisy = Blurred + noise; %Add noise to blurred image

NSR = sum(noise(:).^2)/sum(I(:).^2); % Calculate SCALAR noise to power ratio
NP = abs(fftn(noise)).^2; %Calculate noise power spectrum
NPOW = sum(NP(:))/prod(size(noise));        %Calculate average power in noise spectrum
NCORR = fftshift(real(ifftn(NP))); %Get autocorrelation function of the noise,
%centred using fftshift
IP = abs(fftn(I)).^2; %Calculate image power spectrum
IPOW = sum(IP(:))/prod(size(I)); %Calculate average power in image spectrum
ICORR = fftshift(real(ifftn(IP))); %Get autocorrelation function of the image,
%centred using fftshift
NSR = NPOW./IPOW; %SCALAR noise to signal power ratio
subplot(131);imshow(BlurredNoisy,[min(min(BlurredNoisy)) max(max(BlurredNoisy))]);
%Display blurred and noisy image';
subplot(132);imshow(deconvwnr(BlurredNoisy,PSF,NSR),[]);
%Wiener ?ltered    PSF and scalar noise/
%signal power ratio
subplot(133);imshow(deconvwnr(BlurredNoisy,PSF,NCORR,ICORR),[]);
%Wiener ?ltered    PSF and noise and signal
%autocorrelations