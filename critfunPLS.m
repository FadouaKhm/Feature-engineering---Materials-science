function dev = critfunPLS(X,y)
% % 
[d,f]=size(X);

[Xloadings1,Yloadings1,Xscores1,Yscores1,betaPLS1,PLSPctVar1,PLSmsep1] = plsregress(X,y,f,'CV',10);%%5

[a1,b1]=min(PLSmsep1(2,:));

% [Xloadings11,Yloadings1,Xscores1,Yscores1,betaPLS1,PLSPctVar1,PLSmsep1] = plsregress(X,y,5,'CV',d);%%5
% [a1,b1]=min(PLSmsep1(2,:));

dev=a1;