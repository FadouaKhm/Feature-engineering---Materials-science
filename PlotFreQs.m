function PlotFreQs(O,Features)
I=1:length(Features);
S=O(:,1);
Cr=O(:,2);
L=O(:,3);
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
end