function yy=pengrui2(p,s) 
a=s(:,1);
b=s(:,2);
yy=p(6)*exp((-0.5)*(p(1).*(a-p(3)).^2+p(2).*(b-p(4)).^2+2*p(5).*(a-p(3)).*(b-p(4))));

end