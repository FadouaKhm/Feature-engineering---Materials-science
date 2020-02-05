function PlotSFS(Set,Features,Err_SFS,B)
set(gca, 'XTick', 1:length(Set), 'XTickLabel', Features(Set) );
xtickangle(45)
oldticksX = get(gca,'xtick');
% oldticklabels = cellstr(get(gca,'XTickLabel'));
set(gca,'FontWeight','bold','FontSize',12);
% tmp = text(oldticksX, zeros(size(oldticksX)), oldticklabels, 'rotation',90,'horizontalalignment','right','FontWeight','bold','FontSize',12);

for i1=1:length(Err_SFS)
 text(i1,B(i1),num2str(Err_SFS(i1),'%0.2f'),...
               'HorizontalAlignment','left',...
               'VerticalAlignment','top', 'rotation',90,'color','r','FontWeight','bold','FontSize',16)
end
end