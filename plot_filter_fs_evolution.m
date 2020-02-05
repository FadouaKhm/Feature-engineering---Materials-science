% figure
% subplot(4,1,1)
% bar(B)
% set(gca, 'XTick', 1:15, 'XTickLabel', [Features(I) ],'FontSize',16);
% grid
% ylabel('Weights');
% title('Features weights - Lasso regularization - coefficient weights')
%load('C:\Users\NewAccount\Documents\out\out_corr.mat');
B2=B1;
I2=I1;
v=30;
figure
subplot(4,1,1)
bar(B2)
fs=15;
fs1=15;
set(gca, 'XTick', 1:v, 'XTickLabel', Features(I2),'FontSize',fs1, 'FontWeight','bold' );
oldticksX = get(gca,'xtick');
oldticklabels = cellstr(get(gca,'XTickLabel'));
set(gca,'XTickLabel',[])
tmp = text(oldticksX, zeros(size(oldticksX)), oldticklabels, 'rotation',90,'horizontalalignment','right','FontSize',fs1, 'FontWeight','bold')

bb=B2;
for i1=1:v
 text(i1,bb(i1),num2str(bb(i1),'%0.4f'),...
               'HorizontalAlignment','left',...
               'VerticalAlignment','top','color','r','rotation',90,'FontSize',fs,'FontWeight','bold')
end


grid
ylabel('Weights');
title('Features weights - Lasso regularization - coefficient weights')

%%
% out_Lasso=[I2' dev(:,1)];
% out_OLS=[I2' dev(:,3)];
% out_PLS=[I2' dev(:,2)];
out_Lasso=oo_L;
out_OLS=oo_O;
out_PLS=oo_P;

subplot(4,1,2)
aa=out_Lasso(:,end);
plot(out_Lasso(:,end),'-o');
set(gca, 'XTick', 1:v, 'XTickLabel', Features(out_Lasso(:,1)),'FontSize',fs1,'FontWeight','bold' );
oldticksX = get(gca,'xtick');
oldticklabels = cellstr(get(gca,'XTickLabel'));
set(gca,'XTickLabel',[])
tmp = text(oldticksX, zeros(size(oldticksX)), oldticklabels, 'rotation',90,'horizontalalignment','right','FontSize',fs1,'FontWeight','bold')

grid
ylabel('MSCVE');
title('LASSO regression')
for i1=1:v
 text(i1,aa(i1),num2str(aa(i1),'%0.4f'),...
               'HorizontalAlignment','left',...
               'VerticalAlignment','top', 'rotation',90,'color','r','FontSize',fs,'FontWeight','bold')
end
subplot(4,1,3)
aa=out_OLS(:,end);
plot(out_OLS(:,end),'-o');
set(gca, 'XTick', 1:v, 'XTickLabel', Features(out_OLS(:,1)),'FontSize',fs1,'FontWeight','bold');
oldticksX = get(gca,'xtick');
oldticklabels = cellstr(get(gca,'XTickLabel'));
set(gca,'XTickLabel',[])
tmp = text(oldticksX, zeros(size(oldticksX)), oldticklabels, 'rotation',90,'horizontalalignment','right','FontSize',fs1, 'FontWeight','bold')

grid
ylabel('MSCVE');
title('OLS regression')
for i1=1:v
 text(i1,aa(i1),num2str(aa(i1),'%0.4f'),...
               'HorizontalAlignment','left',...
               'VerticalAlignment','top', 'rotation',90,'color','r','FontSize',fs, 'FontWeight','bold')
end
subplot(4,1,4)
aa=out_PLS(:,end);
plot(out_PLS(:,end),'-o');
set(gca, 'XTick', 1:v, 'XTickLabel', Features(out_PLS(:,1)),'FontSize',fs, 'FontWeight','bold');
oldticksX = get(gca,'xtick');
oldticklabels = cellstr(get(gca,'XTickLabel'));
set(gca,'XTickLabel',[])
tmp = text(oldticksX, zeros(size(oldticksX)), oldticklabels, 'rotation',90,'horizontalalignment','right','FontSize',fs1, 'FontWeight','bold')


grid
ylabel('MSCVE');
title('PLS regression')
for i1=1:v
 text(i1,aa(i1),num2str(aa(i1),'%0.4f'),...
               'HorizontalAlignment','left',...
               'VerticalAlignment','top', 'rotation',90,'color','r','FontSize',fs, 'FontWeight','bold')
end