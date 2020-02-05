close all
clear all
clc
%% Load data
load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\Paper2\DataDMS');
X1=AllData(:,1:30);
y1=AllData(:,31);
I=[1:30];
%indices = crossvalind('Kfold',104,10);
%%
OLS=[];
PLS=[];
LASSOO=[];
figure
k=1;
S=zeros(1,length(Features));
Cr=zeros(1,length(Features));
L=zeros(1,length(Features));
See=zeros(1,length(Features));
Cree=zeros(1,length(Features));
Lee=zeros(1,length(Features));
for j = 1:10
    test = (indices == j); train = ~test;
    T=X1(test,:);
    X=X1(train,:);
    yt=y1(test);
    y=y1(train);
    
%     %% normalize
 [X,T]= NormalizeNew(X,T);
    %%
    C=corr(X,y);
    [bLASSO FitInfo] = lasso(X,y);
    [a,b]=min(FitInfo.MSE);
    betaLASSO = bLASSO(:,b);
    [W_Corr,I_Corr]=sort(abs(C),'descend');
    [W_Lass,I_Lass]=sort(abs(betaLASSO(find(betaLASSO))),'descend');
    [Set,Err_SFS]=SFS(X,y,I);
    [FSLasso,Err_Lasso]=FilterFS(X,y,I_Lass);
    [FSCorr,Err_Corr]=FilterFS(X,y,I_Corr);
  
    subplot(5,3,k)
    plot(Err_SFS,'-o');
PlotSFS(Set,Features,Err_SFS,Err_SFS);
grid
subplot(5,3,k+1)
bar(W_Corr);
PlotSFS(I_Corr,Features,Err_Corr,W_Corr);
grid
subplot(5,3,k+2)
bar(W_Lass);
PlotSFS(I_Lass,Features,Err_Lasso,W_Lass);
 grid
   k=k+3;
    if j==5
        figure
        k=1;
    end
    
  title('OLS')  
 %% test
 % define sets
X2=X(:,FSCorr);%top corr
T2=T(:,FSCorr);%top corr

X3=X(:,Set);%Seq 
T3=T(:,Set);%Seq 

X4=X(:,I_Lass);% Lasso reg
T4=T(:,I_Lass);% Lasso reg

% [X2,T2]= NormalizeNew(X2,T2);
% [X3,T3]= NormalizeNew(X3,T3);
% [X4,T4]= NormalizeNew(X4,T4);

  S(Set)=S(Set)+1;
  Cr(FSCorr)=Cr(FSCorr)+1;
  L(I_Lass)=L(I_Lass)+1;
  
  See=See+Err_SFS;
Cree=zeros(1,length(Features));
Lee=zeros(1,length(Features));
[ppls pp pols]=loo_Ts(X,y,T,8);%all
[ppls2 pp2 pols2]=loo_Ts(X2,y,T2,length(FSCorr));% Corr
[ppls3 pp3 pols3]=loo_Ts(X3,y,T3,length(Set));% Seq 
[ppls4 pp4  pols4]=loo_Ts(X4,y,T4,length(I_Lass));%Lasso reg
% % 
% % %%
OLS=[OLS;pols pols2 pols3 pols4  yt];
PLS=[PLS;ppls ppls2 ppls3 ppls4 yt];
LASSOO=[LASSOO;pp pp2 pp3 pp4 yt];
    
end
%% 
O=[S' Cr' L'];
figure
subplot(3,1,1)
bar(S);
PlotSFS(I,Features,[],[])
grid
title('Consistency of the selection of each feature for the 10 runs based on SFS')
ylabel('Selection frequency')
subplot(3,1,2)
bar(Cr);
PlotSFS(I,Features,[],[])
grid
title('Consistency of the selection of each feature for the 10 runs based on Correlation criterion')
ylabel('Selection frequency')
subplot(3,1,3)
bar(L);
PlotSFS(I,Features,[],[])
grid
title('Consistency of the selection of each feature for the 10 runs based on Lasso Regularization')
ylabel('Selection frequency')
%% plot
load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\Paper2\OutOLS');% contains preds for OLS and frqs of features O
load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\Paper2\OutPLS');% contains PLS and P
load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\Paper2\OutLasso');% contains Lasso and Ll
Exp={ 'All features'  'Correlation criteria'  'Sequential FS' 'Lasso regularization' };
PlotFreQs(O,Features);
title('OLS')
PlotFreQs(P,Features);
title('PLS');
PlotFreQs(Ll,Features);
title('Lasso');
evalMSE(OLS,PLS,LASSOO,Exp);