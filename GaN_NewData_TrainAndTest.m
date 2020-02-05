close all
clear all
clc
%% Load data
load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\NewData_Proposal');
Codopants=Compounds_Proposal;
Features=Features_Proposal;
Dataa=Data_Proposal;
Data=Dataa;
%Features(15)=[];
X=Data(:,1:17);
X(:,[9,16])=X(:,[9,16])-(-12.2344);
X(:,[10,17])=X(:,[10,17])-1.81;
T=X(11:16,:);
X=X(1:10,:);
%X(:,15)=[];
y=Data(:,18);
true=y(11:16);
y=y(1:10);
% T=Data(5:6,1:17);
% yT=Data(5:6,18);
%%
ii=[1:10];
iits=[11:16];
indSeq=[2     3     1    10    12     9    11    16];%%for new data - Lasso
[pc,score,latent,tsquare] = princomp(X);
PCA_Weights=cumsum(latent)./sum(latent)
PC=[];
for i=1:16
PC=[PC;norm(pc(i,1:3))];
end
[B,I]=sort(PC,'descend');
indPCA=[2    14     8     3     6     7    12     5    10     1];
indPCA=[15     8    10    16     1     2];
X1=Data(ii,I(1:5));%%loading plot top
C=corr(X,y);
C1=abs(C);
[B1,I1]=sort(C1,'descend');
%Correlation_Coeffs_Ranked=[num2cell(B1) (Features(I1))']
X2=Data(ii,I1(1:5));
X2=Data(ii,I1(1:9));%%Corr LAsso - New Data
X3=Data(ii,indSeq);
X4=Data(ii,[2 3 1 6 9]);%Seq PLS
X4=Data(ii,[2     3     1     6    12     9    15     8     4     5    14     7]);%%Seq for PLS - New data
X5=Data(ii,I1(1:9));%Corr PLS
T1=Data(iits,I(1:5));
T2=Data(iits,I1(1:9));%%Corr LAsso - New Data
T3=Data(iits,indSeq);
T4=Data(iits,[2     3     1     6    12     9    15     8     4     5    14     7]);%%Seq for PLS - New data
T5=Data(iits,I1(1:9));%Corr PLS

%% Normalize
[X,T]=normalize(X,T);
[X1,T1]=normalize(X1,T1);
[X2,T2]=normalize(X2,T2);
[X3,T3]=normalize(X3,T3);
[X4,T4]=normalize(X4,T4);
[X5,T5]=normalize(X5,T5);



%%
[ppls pp]=looo2(X,y,T);
[ppls1 pp1]=looo2(X1,y,T1);%PCA lasso
[ppls2 pp2]=looo2(X2,y,T2);% Corr
[ppls3 pp3]=looo2(X3,y,T3);% Seq
[ppls3 pp4]=looo2(X4,y,T4);%Seq PLS
[ppls2 pp4]=looo2(X5,y,T5);%corr PLS

%% stem
%P=[pp;ppls;y'];
P=[pp pp1 pp2 pp3 ppls ppls1 ppls2 ppls3 true];
%P=[pp;pp2;pp3;ppls;ppls2;ppls3;y'];
figure
hStemplsN=stem(P);
set(gca, 'XTick',1:6, 'XTickLabel',Codopants(11:16))
set(hStemplsN(1),'Color','blue','MarkerFaceColor','b', 'Marker', '*','LineWidth',0.85,'MarkerSize',15)
set(hStemplsN(2),'Color','blue','MarkerFaceColor','b', 'Marker', 'o','LineWidth',0.85,'MarkerSize',6)
set(hStemplsN(3),'Color','blue','MarkerFaceColor','b', 'Marker', '+','LineWidth',0.85,'MarkerSize',30)
set(hStemplsN(4),'Color','blue', 'MarkerFaceColor','b', 'Marker', '^','LineWidth',0.85,'MarkerSize',6)
set(hStemplsN(5),'Color','c', 'MarkerFaceColor','c','Marker', '*','LineWidth',0.85,'MarkerSize',10)
set(hStemplsN(6),'Color','green','MarkerFaceColor','g', 'Marker', 'o','LineWidth',0.85,'MarkerSize',5)
set(hStemplsN(7),'Color','c','MarkerFaceColor','c', 'Marker', '+','LineWidth',0.85,'MarkerSize',16)
set(hStemplsN(8),'Color','green','MarkerFaceColor','g', 'Marker', '^','LineWidth',0.85,'MarkerSize',6)
set(hStemplsN(9),'Color','red','MarkerFaceColor','red', 'Marker', 's','LineWidth',0.85,'MarkerSize',4)
legend({  'Lasso - All' 'Lasso PCA' 'Lasso - Corr' 'Lasso Seq' 'PLS All' 'PLS PCA' 'PLS Corr' 'PLS Seq' 'Experimental value'},  ...
	'location','NE');
title(' Stem Plot - CaN Host')
ylabel('Magnetic Moment')
grid

%% 
%% Evaluation
D=[];
%P=P';
for i=1:8
    D(i)=mean((P(:,9)-P(:,i)).^2);
    %D(i)=(mean(mean(P(:,6))-P(:,i)).^2);
end
[MSE,Ib]=sort(D);
Exp={ 'Lasso - All' 'Lasso PCA' 'Lasso - Corr' 'Lasso Seq' 'PLS All' 'PLS PCA' 'PLS Corr' 'PLS Seq'};
Out=Exp(Ib)
MSE
%% bar plot
figure
bar(MSE)
set(gca, 'XTick', 1:8, 'XTickLabel', Out);
grid
ylabel('MSE');
title('Used Features MSE for test data')
for i1=1:8
 text(i1,MSE(i1),num2str(MSE(i1),'%0.2f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom','FontWeight','bold')
end
