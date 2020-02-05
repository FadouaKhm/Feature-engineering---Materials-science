function [out,e]=SFS(X,y,I)

[a,b]=size(X);
k=1;

ind=I;
Xn=[];
mnDev=[];
out=[];
oo=[];
e=1000;
X1=[];
for j=1:20
    mn=1000;
for i=1:length(ind)
    X1=[Xn X(:,ind(i))];
    dev=critfunLasso(X1,y); %lasso
    %dev=critfun1(X1,y); %PLS
	if dev <= mn
        mn=dev;
        idx=ind(i);
        oo=[oo idx];
        l=i;
    end
end
if mn <=e
e=mn;
out =[out ; j idx e];
Xn=[Xn X(:,idx)];
ind(l)=[];
end
end
%out =[out ; j idx mn];
e=out(:,3);
out=out(:,2);
end