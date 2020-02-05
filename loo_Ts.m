function [ppls pp pOLS]=loo_Ts(X,y,T,cp)
[k,l]=size(X);
[nt,lt]=size(T);

 mm=max(X);

mn=min(X);
%mn=zeros(1,20);
% for j=1:l
%  X(:,j)=(X(:,j)-mn(j))/(mm(j)-mn(j));
% T(:,j)=(T(:,j)-mn(j))/(mm(j)-mn(j));
% end

%%% lasso
[bLASSO FitInfo] = lasso(X,y);
[a,b]=min(FitInfo.MSE);
betaLASSO = bLASSO(:,b);
pp=T*betaLASSO+FitInfo.Intercept(b);
%%%% PLS

[Xloadings1,Yloadings1,Xscores1,Yscores1,betaPLS1,PLSPctVar1,PLSmsep1] = plsregress(X,y,cp);%%5
[a1,b1]=min(PLSmsep1(2,:));
[Xloadings11,Yloadings1,Xscores1,Yscores1,betaPLS1,PLSPctVar1,PLSmsep1] = plsregress(X,y,b1-1);%%5
ppls = [ones(nt,1) T]*betaPLS1;

%%% OLS
[bOLS, stats] = robustfit(X,y,'ols');
pOLS= [ones(nt,1) T]*bOLS;
% bOLS = regress(y,X);
% pOLS=T*bOLS;
