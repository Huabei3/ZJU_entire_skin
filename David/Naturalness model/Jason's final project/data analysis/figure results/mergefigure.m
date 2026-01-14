fig1 = open('allskyboundary.fig');
fig2 = open('allsgboundary.fig');

ax1 = get(fig1, 'Children');
ax2 = get(fig2, 'Children');

fig3 = figure();
ax3 = get(fig3, 'Children');

for i = 1 : numel(ax1) 
   ax1Children = get(ax1(i),'Children');
   copyobj(ax1Children, ax3(i));
end
for i = 1 : numel(ax2) 
   ax2Children = get(ax2(i),'Children');
   copyobj(ax2Children, ax3(i));
end