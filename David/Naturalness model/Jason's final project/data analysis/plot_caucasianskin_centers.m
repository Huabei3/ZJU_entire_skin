load ellipsoidmodel;
load ellipse_atr;

ABtheta_plot_ellipse([ellipse_atr(5,5:6),ellipse_atr(5,4),par(5,6:7)],1,par(5,5:7));
axis([-50,50,-50,50]);
hold on 


% our center
scatter(par(5,6),par(5,7));

% Babilon
scatter(10.12,10.56);
% Bodrogi
scatter(9.53,9.10);
% Smet
scatter(22.26,34.82);
% Summer
scatter(16.28,16.24);
% Zhu YT
scatter(10.70,7.93 );

plot([0,par(5,6)],[0,par(5,7)]);
