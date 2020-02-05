function dd= evalMSE(OLS,PLS,LASSOO,SvM,Exp)
Dols=[];
Dpls=[];
Dlass=[];
Dsvm=[];
ns=length(Exp);
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

for i=1:ns
    Dsvm(i)=mean((SvM(:,ns+1)-SvM(:,i)).^2);
    %D(i)=(mean(mean(P(:,6))-P(:,i)).^2);
end


% figure
 dd=[Dlass' Dols' Dpls' Dsvm'];
% 
% bar(dd,'DisplayName','dd')
% legend({  'Lasso regression' 'OLS regression' 'PLS regression', 'SVM-R'},  ...
% 	'location','NE');
% set(gca, 'XTick', 1:ns, 'XTickLabel', Exp);
% grid
% ylabel('MSE ');


figure
subplot(4,1,1)
[MSE,Ib]=sort(Dols);
Out=Exp(Ib);
bar(MSE)
set(gca, 'XTick', 1:ns, 'XTickLabel', Out,'FontWeight','bold','FontSize',12);
grid
ylabel('MSE');
title('OLS regression')
for i1=1:ns
 text(i1,MSE(i1),num2str(MSE(i1),'%0.4f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom','FontWeight','bold')
end

subplot(4,1,2)
[MSE,Ib]=sort(Dpls);
Out=Exp(Ib);
bar(MSE)
set(gca, 'XTick', 1:ns, 'XTickLabel', Out,'FontWeight','bold','FontSize',12);
grid
ylabel('MSE');
title('PLS regression')
for i1=1:ns
 text(i1,MSE(i1),num2str(MSE(i1),'%0.4f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom','FontWeight','bold')
end

subplot(4,1,3)
[MSE,Ib]=sort(Dlass);
Out=Exp(Ib);
bar(MSE)
set(gca, 'XTick', 1:ns, 'XTickLabel', Out, 'FontWeight','bold','FontSize',12);
grid
ylabel('MSE');
title('LASSO regression')
for i1=1:ns
 text(i1,MSE(i1),num2str(MSE(i1),'%0.4f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom','FontWeight','bold')
end

subplot(4,1,4)
[MSE,Ib]=sort(Dsvm);
Out=Exp(Ib);
bar(MSE)
set(gca, 'XTick', 1:ns, 'XTickLabel', Out, 'FontWeight','bold','FontSize',12);
grid
ylabel('MSE');
title('SVM-R regression')
for i1=1:ns
 text(i1,MSE(i1),num2str(MSE(i1),'%0.4f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom','FontWeight','bold')
end
