function [oo,mn]=FS_filter(X,y,I)

[a,b]=size(X);
k=1;

ind=I;

err=[];
oo=[];
X1=[];
  mn=1000;
for i=1:length(ind)
    X1=[X1 X(:,ind(i))];
    err=[err critfunOLS(X1,y)];
%     if dev <= mn
%         mn=dev;
%         idx=ind(i);
%         oo=[oo idx];
%         l=i;
%     end
%Soo=[oo;ind(i) dev];
end


end