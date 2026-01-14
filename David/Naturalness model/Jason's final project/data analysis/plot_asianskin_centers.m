load ellipsoidmodel;
load ellipse_atr;

ABtheta_plot_ellipse([ellipse_atr(4,5:6),ellipse_atr(4,4),par(4,6:7)],1,par(4,5:7));
axis([-50,50,-50,50]);
hold on 


% our center
scatter(par(4,6),par(4,7));

% Babilon
scatter(10.30,12.89);
% Bodrogi
scatter(12.66,18.15);
% Smet
scatter(21.66,31.59);
% Summer
scatter(15.94,15.63);
% Zhu YT
scatter(15.96,21.33);

plot([0,par(4,6)],[0,par(4,7)]);
