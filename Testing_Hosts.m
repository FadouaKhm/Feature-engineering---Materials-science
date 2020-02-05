close all
clear all
clc
%% 
load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\Data_DMS.mat');
load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\Features_DMS.mat');
Features=Features_DMS;

[pc,score,latent,tsquare] = princomp(Data_DMS(:,1:30));
PCA_Weights=cumsum(latent)./sum(latent);
figure
grid
scatter3(score(1:16,1),score(1:16,2),score(1:16,3),15,'r');
hold on
scatter3(score(17:36,1),score(17:36,2),score(17:36,3),15,'g');
hold on
scatter3(score(37:38,1),score(37:38,2),score(37:38,3),15,'b');
legend({  'GaP host' 'GaN host' 'ZnO host'},  ...
	'location','NE');
pca3=PCA_Weights(3)-PCA_Weights(2)+PCA_Weights(1);
title(['Score plots - PC1,  PC2 & PC3 - Weight=' num2str(PCA_Weights(3)) '% _ No normalization']);
xlabel('PC1');
ylabel('PC2');
zlabel('PC3');
figure

subplot(2,1,1)
grid
biplot(pc(:,1:2),'Scores',pc(:,1:2),'VarLabels',Features);
title(['Laoding plots - PC1 & PC2 - Weight=' num2str(PCA_Weights(2)*100) '%']);
xlabel('PC1');
ylabel('PC2');

subplot(2,1,2)
grid
d1=[pc(:,1) pc(:,3)];
s1=[pc(:,1) pc(:,3)];
biplot(d1,'Scores',s1,'VarLabels',Features);
title(['Laoding plots - PC1 & PC3 - Weight=' num2str(pca3*100) '%']);
xlabel('PC1');
ylabel('PC3');

%%
X=Data_DMS(:,1:30);
mm=max(X);
% mn=min(X);
mn=zeros(1,30);
[l,k]=size(X);
for i=1:k
    X(:,i)=(X(:,i)-mn(i))/(mm(i)-mn(i));
   % T(:,i)=(T(:,i)-mn(i))/(mm(i)-mn(i));
end
[pc,score,latent,tsquare] = princomp(X);
PCA_Weights=cumsum(latent)./sum(latent);
figure
grid
scatter3(score(1:16,1),score(1:16,2),score(1:16,3),15,'r');
hold on
scatter3(score(17:36,1),score(17:36,2),score(17:36,3),15,'g');
hold on
scatter3(score(37:38,1),score(37:38,2),score(37:38,3),15,'b');
legend({  'GaP host' 'GaN host' 'ZnO host'},  ...
	'location','NE');
pca3=PCA_Weights(3)-PCA_Weights(2)+PCA_Weights(1);
title(['Score plots - PC1,  PC2 & PC3 - Weight=' num2str(PCA_Weights(3)) '% _ Normalized']);
xlabel('PC1');
ylabel('PC2');
zlabel('PC3');
pca3=PCA_Weights(3)-PCA_Weights(2)+PCA_Weights(1);
figure
grid
subplot(2,1,1)
grid
biplot(pc(:,1:2),'Scores',pc(:,1:2),'VarLabels',Features);
title(['Laoding plots - PC1 & PC2 - Weight=' num2str(PCA_Weights(2)*100) '%']);
xlabel('PC1');
ylabel('PC2');
subplot(2,1,2)
grid
d1=[pc(:,1) pc(:,3)];
s1=[pc(:,1) pc(:,3)];
biplot(d1,'Scores',s1,'VarLabels',Features);
title(['Loading plots - PC1 & PC3 - Weight=' num2str(pca3*100) '%']);
xlabel('PC1');
ylabel('PC3');
%% 
y=Data_DMS(:,31);
X=Data_DMS(:,1:30);
C=corr(X,y);
C1=abs(C);
[B1,I1]=sort(C1,'descend');
Correlation_Coeffs_Ranked=[num2cell(B1) (Features(I1))']
