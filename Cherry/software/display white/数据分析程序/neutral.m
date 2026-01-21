function [par,r,y] = neutral(xdata,ydata)
% cielab should be m*3 matrix
% zscore should be m*1 vector

% if color center is preset, it will be fixed and not be optimized.
% output: par = [k1,k2,k3,k4,l0,a0,b0,k5,k6]

    
    
    
    f =  @(a,xdata)(a(1).*log(xdata(:,1))+a(2));
   
    rmax =0;

    for t = 1:100
        a0 = [rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata,[-inf,-inf],[inf,inf],options);
        y =(a(1).*log(xdata(:,1))+a(2));
       r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end

    par = afinal;
    a = afinal;
   y=(a(1).*log(xdata(:,1))+a(2));
   
   scatter(ydata,y);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);

end