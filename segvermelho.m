function x = segvermelho(mat,lim)

a = double(mat);
b = sqrt( a(:,:,2).^2 + a(:,:,3).^2 );
c = a(:,:,1) - b;
c = c.*(c>0);
c = c-min(min(c));
c = c*255/max(max(c));
x= c>=lim;