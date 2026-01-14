function par_plot_ellipse_LC(par)
for i = 1:size(par,1)
    p = par(i,:);
    f = @(C,L) flch(p,[L,C,p(3)])-0.5;
    fimplicit(f,[0,128,0,100]);
%     fimplicit(f);
    hold on
end