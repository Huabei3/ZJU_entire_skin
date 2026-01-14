function par_plot_ellipse(par)
for i = 1:size(par,1)
    p = par(i,:);
    f = @(a,b) (1/(1+exp(p(1)*sqrt(p(2)*(a-p(6))^2+p(3)*(b-p(7))^2+p(4)*(a-p(6))*(b-p(7)))-p(8)))-0.5);
    fimplicit(f,[-128,128,-128,128]);
    hold on
end
