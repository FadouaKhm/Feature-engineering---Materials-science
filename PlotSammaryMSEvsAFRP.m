rd1=sum(O<5)/30;
rd1=100*[0 rd1([2 1 3])];


rd2=sum(P<5)/30;
rd2=100*[0 rd2([2 1 3])]

rd3=sum(Ll<5)/30;
rd3=100*[0 rd3([2 1 3])];


figure
subplot(3,1,1)
[MSE,Ib]=sort(Dols);
Ib=[3 4 2 1];
Out=Exp(Ib);
yyaxis left;
plot(MSE,'b-o');
PlotSFS1([],[],MSE,MSE,'b');

ylabel('MSE');
yyaxis right;
Ib=[3 4 2 1];
plot(rd1(Ib),'r-o');
PlotSFS1([],[],rd1(Ib),rd1(Ib),'r');
ylabel('AFRP(%)');
grid
title('OLS regression')
set(gca, 'XTick', 1:ns, 'XTickLabel', Out);
% for i1=1:ns
%  text(i1,MSE(i1),num2str(MSE(i1),'%0.4f'),...
%                'HorizontalAlignment','center',...
%                'VerticalAlignment','bottom','FontWeight','bold')
% end

subplot(3,1,2)
[MSE,Ib]=sort(Dpls);
Out=Exp(Ib);
yyaxis left;
plot(MSE,'b-o');
PlotSFS1([],[],MSE,MSE,'b');
set(gca, 'XTick', 1:ns, 'XTickLabel', Out);
ylabel('MSE');
yyaxis right;
%Ib=[];
plot(rd2(Ib),'r-o');
PlotSFS1([],[],rd2(Ib),rd2(Ib),'r');
ylabel('AFRP(%)');
grid
title('PLS regression')
set(gca, 'XTick', 1:ns, 'XTickLabel', Out);

subplot(3,1,3)
[MSE,Ib]=sort(Dlass);
Ib=[3 2 4 1];
Out=Exp(Ib);
yyaxis left;
plot(MSE,'b-o');
PlotSFS1([],[],MSE,MSE,'b');
set(gca, 'XTick', 1:ns, 'XTickLabel', Out);
ylabel('MSE');
yyaxis right;
Ib=[3 2 4 1];
plot(rd3(Ib),'r-o');
PlotSFS1([],[],rd3(Ib),rd3(Ib),'r');
ylabel('AFRP(%)');
grid
title('Lasso regression')
set(gca, 'XTick', 1:ns, 'XTickLabel', Out);