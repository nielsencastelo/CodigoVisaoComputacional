% Transformação não linear usando o efeito barril na imagem
%I = checkerboard(20,4);                             %Read in image
I = imread('trui.png');                    		%Repeat afterwards for this image
[nrows,ncols] = size(I);                    		%Extract no. of cols and rows
[xi,yi] = meshgrid(1:ncols,1:nrows);        		%Define grid

imid = round(size(I,2)/2);                  		% Find index of middle element
xt = xi(:) - imid;                          		%Subtract off and thus
yt = yi(:) - imid;                          		%shift origin to centre
[theta,r] = cart2pol(xt,yt);                		%Convert from cartesian to polar
a = .0005;                                  		%Set the amplitude of the cubic term.
s = r + a.*r.^3;                             		%calculate BARREL distortion 
[ut,vt] = pol2cart(theta,s);               		 	%Return the (distorted)cartesian coordinates
u = reshape(ut,size(xi)) + imid;            		%reshape the coordinates to original 2-D grid  
v = reshape(vt,size(yi)) + imid;                    %reshape the coordinates into original 2-D grid 
tmap_B = cat(3,u,v);                        		%Assign u and v grids as the 2 planes of a 3-D array
resamp = makeresampler('linear','fill');    
I_barrel = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,.3);


[theta,r] = cart2pol(xt,yt);                		%Convert from cartesian to polar
a=-0.000015;                                  		%Set amplitude of cubic term
s = r + a.*r.^3;                            		%calculate PINCUSHION distortion 
[ut,vt] = pol2cart(theta,s);                		%Return the (distorted)cartesian coordinates
u = reshape(ut,size(xi)) + imid;                    %reshape the coordinates into original 2-D grid  
v = reshape(vt,size(yi)) + imid;                    %reshape the coordinates into original 2-D grid 
tmap_B = cat(3,u,v);                        		%Assign u and v grids as the 2 planes of a 3-D array
resamp = makeresampler('linear','fill');            %Define resampling structure for use with tformarray
I_pin = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,.3);
                                            		%Transform image to conform to grid in tmap_B                                            
subplot(131); imshow(I); 	subplot(1,3,2), imshow(I_barrel); 
subplot(1,3,3), imshow(I_pin); 

% Extração de caracteristicas
A=imread('coins_and_keys.png'); subplot(1,2,1), imshow(A);       %Read in image and display
bw=~im2bw(rgb2gray(A),0.35);  bw=imfill(bw,'holes');    		%Threshold and fill in holes
bw=imopen(bw,ones(5)); subplot(1,2,2), imshow(bw,[0 1]);		%Morphological opening 
[L,num]=bwlabel(bw);                                    		%Create labelled image
s=regionprops(L,'area','perimeter');                    		%Calculate region properties
for i=1:num                                             		%object’s area and perimeter     
x(i)=s(i).Area;
y(i)=s(i).Perimeter;
form(i)=4.*pi.*x(i)./(y(i).^2);                         		%Calculate form factor
end
figure; plot(x./max(x),form,'ro');                      		%Plot area against form factor

% Transformação simples
f = checkerboard(50);
figure;imshow(f);
s = 0.8;
theta = pi/6;
t = [s*cos(theta) s*sin(theta) 0; -s*sin(theta) s*cos(theta) 0; ...
    0 0 1];
t2 = [ 1 0 0; 0 1 0;50 50 1];
tform = maketform('affine',t);
tform2 = maketform('affine',t2);
g = imtransform(f,tform);
% g = imtransform(f,tform,'FillValue',0.5);
g5 = imtransform(f,tform2,'XData',[1 400], 'YData',[1 400],...
    'FillValue',0.5);
figure;imshow(g);
figure;imshow(g5);

% Filtragem colorida
fc = imread('flor.bmp');
h = rgb2hsi(fc);
H = h(:,:,1);
S = h(:,:,2);
I = h(:,:,3);
w = fspecial('average',25);
If = imfilter(I,w,'replicate');
h = cat(3,H,S,If);
f = hsi2rgb(h);
f = min(f,1);
imshow(f);

mask = [1 1 1;1 -8 1;1 1 1];
fen = imsubtract(fc,imfilter(fc,mask,'replicate'));

% Ilustra o processo de abertura e fechamento
f = imread('shapes.tif');
se = strel('square',20);
fo = imopen(f,se);
figure;imshow(fo);

fc = imclose(f,se);
figure;imshow(fc);

fcc = imclose(fo,se);
imshow(fcc);

% Abertura e fechamando (Exemplo 2)
f = imread('fingerprint.tif');
se = strel('square',3);
fo = imopen(f,se);
figure;imshow(f);
figure;imshow(fo);

% Morfologia com imagem binária 
f = imread('fingerprint.tif');
f = im2bw(f);
g1 = bwmorph(f,'thin',1); %thining - desbaste
g2 = bwmorph(f,'thin',2);

figure;imshow(f);
figure;imshow(g1);
figure;imshow(g2);

% encontra o centro de massa de cada objeto
f = imread('objetos.tif');
f = im2bw(f);
[L,n] = bwlabel(f);
[r,c] = find(L==3);

rbar = mean(r);
cbar = mean(c);
imshow(f);
hold on;
for k = 1 :n
    [r,c] = find(L == k);
    rbar = mean(r);
    cbar = mean(c);
    plot(cbar,rbar,'Marker', 'o','MarkerEdgeColor', 'k', ...
        'MarkerFaceColor','k', 'MarkerSize', 10);
    
    plot(cbar,rbar,'Marker', '*','MarkerEdgeColor','w');
end

figure;imshow(f);