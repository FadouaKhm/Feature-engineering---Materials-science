function dev = critfunLasso(X,y)
% % 
[s q]=size(X);

[B,FitInfo] = lasso(X,y); 

%%%dev=FitInfo.MSE(FitInfo.IndexMinMSE);
[a,b]=min(FitInfo.MSE);
dev=a;