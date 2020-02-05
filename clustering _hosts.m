load('C:\Users\NewAccount\Desktop\MaterialsProject\DataMatlab\Proposal\Data_DMS.mat');
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