function [out,mn]=FS_Global(X,y,I)

[a,b]=size(X);
k=1;

ind=I;
Xn=[];
mnDev=[];
out=[];
oo=[];
e=1000;
X1=[];
for j=1:10
    mn=1000;
for i=1:length(ind)
    X1=[Xn X(:,ind(i))];
    dev=critfun(X1,y);
    if dev <= mn
        mn=dev;
        idx=ind(i);
        oo=[oo idx];
        l=i;
    end
end
if mn <=e
e=mn;
out =[out ; j idx mn];
Xn=[Xn X(:,idx)];
mnDev=[mnDev mn];
ind(l)=[];
end
end
out =[out ; j idx mn];
end