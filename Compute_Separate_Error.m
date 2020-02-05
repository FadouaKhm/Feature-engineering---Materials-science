%% bar
% OLSx=OLS;
% LASSOOx=LASSOO;
% PLSx=PLS;

PLS=PLSx(1:16,:);
OLS=OLSx(1:16,:);
LASSOO=LASSOOx(1:16,:);
Dols=[];
Dpls=[];
Dlass=[];
ns=5;
for i=1:ns
    Dols(i)=mean((OLS(:,ns+1)-OLS(:,i)).^2);
    %D(i)=(mean(mean(P(:,6))-P(:,i)).^2);
end

for i=1:ns
    Dpls(i)=mean((PLS(:,ns+1)-PLS(:,i)).^2);
    %D(i)=(mean(mean(P(:,6))-P(:,i)).^2);
end

for i=1:ns
    Dlass(i)=mean((LASSOO(:,ns+1)-LASSOO(:,i)).^2);
    %D(i)=(mean(mean(P(:,6))-P(:,i)).^2);
end
Exp={ 'All features' 'PCA weights' 'Correlation criteria' 'Sequential FS' 'Lasso regularization'};


figure
dd=[Dlass' Dols' Dpls'];

bar(dd,'DisplayName','dd')
legend({  'Lasso regression' 'OLS regression' 'PLS regression'},  ...
	'location','NE');
set(gca, 'XTick', 1:ns, 'XTickLabel', Exp);
grid
ylabel('MSE ');

Dols1=Dols;
Dpls1=Dpls;
Dlass1=Dlass;