function [X1,T1]=normalize(X,T)
mm=max(X);
mn=min(X);
[l,k]=size(X);
X1=X;
T1=T;
for i=1:k
    X1(:,i)=(X1(:,i)-mn(i))/(mm(i)-mn(i));
    T1(:,i)=(T1(:,i)-mn(i))/(mm(i)-mn(i));
end
end