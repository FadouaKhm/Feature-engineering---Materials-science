function [oo,err]=FilterFS(X,y,I)

[a,b]=size(X);
k=1;

ind=I;

err=[];
oo=[];
X1=[];
  mn=1000;
for i=1:length(ind)
    X1=[X1 X(:,ind(i))];
    %err=[err critfunLasso(X1,y)];
	err=[err critfunOLS(X1,y)];
%     if dev <= mn
%         mn=dev;
%         idx=ind(i);
%         oo=[oo idx];
%         l=i;
%     end
%Soo=[oo;ind(i) dev];
end
[mn,idx]=min(err);
oo=I(1:idx);

end