load ellipsoidmodel;
load ellipse_atr;

h = ABtheta_plot_ellipse([ellipse_atr(1,5:6),ellipse_atr(1,4),par(1,6:7)],1,par(1,5:7));
axis([-50,50,-100,100]);
hold on 


% our center
scatter(par(1,6),par(1,7),'o');
% Bodrogi
scatter(12.78,-60.68,'*');
% Summer
scatter(-0.67,-45.12,'+');
% Zhu YT
scatter(17.08,-67.28,'s');

plot([0,par(1,6)],[0,par(1,7)],'color',display_r(lab2xyz(par(1,5:7),display_f([1 1 1]))));