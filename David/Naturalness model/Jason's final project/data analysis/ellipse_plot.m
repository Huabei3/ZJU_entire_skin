load ellipsoidmodel;
load ellipse_atr;

h = ABtheta_plot_ellipse([ellipse_atr(:,5:6),ellipse_atr(:,4),par(:,6:7)],1,par(:,5:7));
axis([-100,100,-100,100]);
hold on 
for i = 1:5
    plot([0,par(i,6)],[0,par(i,7)],'color',display_r(lab2xyz(par(i,5:7),display_f([1 1 1]))));
    
end
scatter(par(:,6),par(:,7));