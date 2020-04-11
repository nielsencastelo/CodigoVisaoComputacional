I=imread('buraco.bmp');


B=strel('square',3);
A=I;

p=find(A==1);
p=p(1);
Label=zeros([size(A,1) size(A,2)]);
N=0;

while(~isempty(p))
    N=N+1;
    p=p(1);
X=false([size(A,1) size(A,2)]);
X(p)=1;

Y=A&imdilate(X,B);

while(~isequal(X,Y))
    X=Y;
    Y=A&imdilate(X,B);
end

Pos=find(Y==1);

A(Pos)=0;

p=find(A==1);

end