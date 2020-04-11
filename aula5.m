% Detecção de linhas
f1 = imread('wirebond_mask.tif'); 
w = [ 2 -1 -1; -1  2 -1; -1 -1  2]; 
g1 = imfilter(double(f1),w); 
T = max(g1(:)); 
g1 = g1>=T-40;
subplot(1,2,1);imshow(f1,[]) 
subplot(1,2,2);imshow(g1)

% Uso do threshold
I = imread('coins.png');                                %Read in original
subplot(2,2,1), imshow(I);                      		%Display original
subplot(2,2,2),im2bw(I,0.35);                   		%result of manual threshold
[counts,X]=imhist(I);                           		%calculate image hIstogram
P = polyfit(X,counts,6); Y=polyval(P,X);        		%Fit to histogram and evaluate
[V,ind]=sort(abs(diff(Y))); thresh=ind(3)./255; 		%Find minimum of polynomial
subplot(2,2,3), im2bw(I,thresh);                		%result of Polynomial theshold
level = graythresh(I);                                  
subplot(2,2,4), im2bw(I,level);                 		%result of Otsu's method 
 
figure; plot(X,counts); hold on, plot(X,Y,'r-');		%histogram and polynomial fit

% Split Merge
I=imread('trui.png');                       			%Read in image
S = qtdecomp(I,.17);                        			%Do quadtree decomposition
blocks = repmat(uint8(0),size(S));                      %Create empty blocks
for dim = [512 256 128 64 32 16 8 4 2 1];               %Loop through successively smaller blocks	
numblocks = length(find(S==dim));           
    if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    blocks = qtsetblk(blocks,S,dim,values);
    end
end
blocks(end,1:end) =1;
blocks(1:end,end) = 1;
subplot(1,2,1), imshow(I);
k=find(blocks==1);                          			%Find border pixels of regions
A=I; A(k)=255;                              			%Superimpose on original image 
subplot(1,2,2), imshow(A);                              %Display 

% Detecção de bordas
A=imread('trui.png');                      			%Read in image
subplot(3,3,1), imshow(A,[]);               		%Display original
h1=fspecial('gaussian',[15 15],6);
h2=fspecial('gaussian',[30 30],12);
subplot(3,3,4), imshow(imfilter(A,h1),[]);   		%Display filtered version sigma=6
subplot(3,3,7), imshow(imfilter(A,h2),[]);   		%Display filtered version sigma=12

[bw,thresh]=edge(A,'log');                  		%Edge detection on original - LOG filter
subplot(3,3,2), imshow(~bw,[]);
[bw,thresh]=edge(A,'canny');                		%Canny edge detection on original 
subplot(3,3,3), imshow(~bw,[]);              		%Display
[bw,thresh]=edge(imfilter(A,h1),'log');      		%LOG Edge detection on sigma=6 
subplot(3,3,5), imshow(~bw,[]);              
[bw,thresh]=edge(imfilter(A,h1),'canny');         	%Canny edge detection on sigma=6
subplot(3,3,6), imshow(~bw,[]);
[bw,thresh]=edge(imfilter(A,h2),'log');      		%LOG Edge detection on sigma=12
subplot(3,3,8), imshow(~bw,[]);              
[bw,thresh]=edge(imfilter(A,h2),'canny');  		%Canny edge detection on sigma=12
subplot(3,3,9), imshow(~bw,[]);

% Outro exemplo simples usando canny
f1 = imread('madeira.tif'); 
g2=edge(f1,'canny',[0.06 0.5], 1.5); 
subplot(1,2,1);imshow(f1);
subplot(1,2,2);imshow(g2) 

% Watershed
f = imread('objetos1.bmp'); 
g = im2bw(f, graythresh(f)); 
gc = ~g 
D = bwdist(gc); 
L = watershed(-D); 
w = L == 0; 
g2 = g | w; 
subplot(2,2,1);imshow(f) 
subplot(2,2,2);imshow(g) 
subplot(2,2,3);imshow(gc) 
subplot(2,2,4);imshow(w) 
imshow(g2)

% Segmentação whatershed
center1 = -10;                                  %Create artificial image.....
center2 = -center1;
dist = sqrt(2*(2*center1)^2);
radius = dist/2 * 1.4;
lims = [floor(center1-1.2*radius) ceil(center2+1.2*radius)];
[x,y] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-center1).^2 + (y-center1).^2) <= radius;
bw2 = sqrt((x-center2).^2 + (y-center2).^2) <= radius;
bw = bw1 | bw2;

D = bwdist(~bw);                                %Calculate basic segmentation function
                                                %(Euclidean distance transform of 	~bw)
subplot(2,2,1), imshow(bw,[]);                  %Display image
subplot(2,2,2), imshow(D,[]);                   %Display basic segmentation function
                                                %Modify segmentation function
D = -D;                                 		%invert and set background pixels lower than all catchment basin minima
D(~bw) = -inf;                                  %
subplot(2,2,3), imshow(D,[]);                   %Display modified segmentation image
L = watershed(D);   subplot(2,2,4), imagesc(L); %calculate watershed of segmentation function
axis image; axis off; colormap(hot); colorbar	%Display labelled image - colour coded

A=imread('overlapping_euros1.png');     		%Read in image
bw=im2bw(A,graythresh(A));              		%Threshold automatically
se=strel('disk',10); bwo=imopen(bw,se); 		%Remove background by opening
D = bwdist(~bwo);                       		%Calculate basic segmentation function
D = -D; D(~bwo) = -255;                 		%invert, set background lower than catchment basin minima
L = watershed(D);                       		%calculate watershed

figure, subplot(1,4,1), imshow(A);              %Display original
subplot(1,4,2), imshow(bw)              		%Thresholded image
subplot(1,4,3), imshow(D,[]);           		%Display basic segmentation function
ind=find(L==0); Ac=A; Ac(ind)=0;        		%Identify watersheds and set=0 on original
subplot(1,4,4), imshow(Ac,[]); hold on     		%Segmentation superimposed on original
%Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');     		%calculate label image
%himage = imshow(Lrgb); set(himage, 'AlphaData', 0.3);   %Superimpose transparently on original

% Segmentação
I=imread('circuit.tif'); % Read in image
IEr = edge(I,'roberts'); % roberts edges
IEp = edge(I,'prewitt'); % prewitt edges
IEs = edge(I,'sobel');   % sobel edges

subplot(2,2,1), imshow(I); % Display image
subplot(2,2,2), imshow(IEr); % Display image
subplot(2,2,3), imshow(IEp); % Display image
subplot(2,2,4), imshow(IEs); % Display image

% Filtro laplaciano
I=rgb2gray(imread('peppers.png')); % Read in image (in greyscale)
k = fspecial('laplacian'); % create laplacian filter
IEl = imfilter(double(I),k,'symmetric'); % laplacian edges 

subplot(1,2,1), imagesc(I); % Display image
subplot(1,2,2), imagesc(IEl); % Display image
colormap('gray');

% Transformações geométrica
load procrustes_star.mat;                                   %load coordinates of two shapes
whos                                                        %input_points and base_points
subplot(1,2,1),
plot(base_points(:,1),base_points(:,2),'kd'); hold on;      %Plot the shape coordinates
plot(input_points(:,1),input_points(:,2),'ro'); axis square; grid on
[D,Z,transform]=procrustes(input_points,base_points);       %Procrustes align input to base
subplot(1,2,2),
plot(input_points(:,1),input_points(:,2),'kd'); hold on;
plot(Z(:,1),Z(:,2),'ro'); axis square; grid on; hold off;	%Plot aligned coordinates


% Transformações de perspectiva
clear;                                   %Clear variables 
A = imread('plate_side.jpg');            %Read image to be registered
figure, imshow(A);                       %Display
[x,y]=ginput(4); input_points=[x y];     %Interactively define coords 
                                         %of input quadrilateral
figure, imshow('plate_reference.jpg')    %Read base reference)image.
[x,y]=ginput(4); base_points=[x y];      %Interactively define coords             
                                         %of base quadrilateral
t_carplate = cp2tform(input_points,base_points,'projective');    
                                         %Create projective  
                                         %transformation structure.
registered = imtransform(A,t_carplate);  %Apply projective transform 
B=imcrop(registered);                    %Interactively crop result
figure, imshow(B)                        %Display corrected image
