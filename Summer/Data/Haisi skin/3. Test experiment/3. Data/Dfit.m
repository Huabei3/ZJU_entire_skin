function [a,r] = Dfit(CCT,D)
%  output: a = [a1,a2,a3]
    xdata = CCT;
    ydata = D;
    
    f =  @(a,xdata)(a(1).*exp(xdata(:,1)./a(2)));
   
    rmax = 0;

    for t = 1:300
        a0 = [rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata,[0,0],[0.1,3000]);
        y =a(1).*exp(xdata(:,1)./a(2));
   
        r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end

    par = afinal;
    a = afinal;
    y =a(1).*exp(xdata(:,1)./a(2));
   scatter(ydata,y);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);

end