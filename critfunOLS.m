function dev = critfunOLS(X,y)
% % 

[pOLS ee]=OLS_CV(X,y);
dev=ee;