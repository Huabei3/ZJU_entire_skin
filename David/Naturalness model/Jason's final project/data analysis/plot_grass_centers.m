load ellipsoidmodel;
load ellipse_atr;

h = ABtheta_plot_ellipse([ellipse_atr(2,5:6),ellipse_atr(2,4),par(2,6:7)],1,par(2,5:7));
axis([-75,75,-100,100]);
hold on 
% h = ABtheta_plot_ellipse([ellipse_atr(3,5:6),ellipse_atr(3,4),par(3,6:7)],1,par(3,5:7));


% our center
scatter(par(2,6),par(2,7));
% scatter(par(3,6),par(3,7));
% % Bodrogi
% scatter(-46.82,59.81);
% % Summer
% scatter(-59.62,66.35);
% % Zhu YT
% scatter(-43.36,61.11);

plot([0,par(2,6)],[0,par(2,7)]);
% plot([0,par(3,6)],[0,par(3,7)]);