function par_plot_ellipse_3D(par)
for i = 1:size(par,1)
    p = par(i,:);
    f = @(a,b,l) (1/(1+exp(p(4)*sqrt((l-p(1))^2+p(5)*(a-p(2))^2+p(6)*(b-p(3))^2+p(7)*(a-p(2))*(b-p(3))+p(8)*(l-p(1))*(a-p(2))+p(9)*(l-p(1))*(b-p(3)))-p(10)))-0.5);
    fimplicit3(f,[-128,128,-128,128,0,100]);
    axis([-40,40,-60,60,0,100]);
    hold on
end
