function [par,r,y] = ellipsoidfit3_1(cielab,zscore,colorcenter)
% cielab should be m*3 matrix
% zscore should be m*1 vector

% if color center is preset, it will be fixed and not be optimized.
% output: par = [k1,k2,k3,k4,l0,a0,b0,k5,k6]
if nargin < 3
    xdata = cielab;
    ydata = zscore;
    [mean_cen] = calculate_weighted_or_simple_mean( zscore, cielab);
    f = @(a,xdata)(1./(1+a(8)*exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))))).*((a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
   % f = @(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*((a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
   
    rmax = 0;

    for t = 1:500
        a0 = [rand,rand,rand,rand,rand,rand,rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata, ...
            [-inf,-inf,-inf,-inf,mean_cen(1)-5,mean_cen(2)-5,mean_cen(3)-5,-inf], ...
            [inf,inf,inf,inf,mean_cen(1)+5,mean_cen(2)+5,mean_cen(3)+5,inf],options);
        y = (1./(1+a(8)*exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))))).*((a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
       % y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*((a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
   
        r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end

    par = afinal;
    a = afinal;
   y  =(1./(1+a(8)*exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))))).*((a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
 %  y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*((a(1)*(xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
   
   % scatter(ydata,y);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);
else
    xdata = cielab;
    ydata = zscore;

    f = @(a,xdata)(a(8)*exp(a(1)*sqrt((xdata(:,1)-colorcenter(1)).^2+a(2)*(xdata(:,2)-colorcenter(2)).^2+a(3)*(xdata(:,3)-colorcenter(3)).^2+a(4)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))))+a(9)).*(((xdata(:,1)-colorcenter(1)).^2+a(2)*(xdata(:,2)-colorcenter(2)).^2+a(3)*(xdata(:,3)-colorcenter(3)).^2+a(4)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))>=0);
    rmax = 0;

    for t = 1:100
        a0 = [-rand,rand,rand,rand,rand,rand,rand,rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata,[-inf,0,0,-inf,-inf,-inf,-inf,-inf,-inf],[inf,inf,inf,inf,inf,inf,inf,inf,inf],options);
        y = (a(8)*exp(a(1)*sqrt((xdata(:,1)-colorcenter(1)).^2+a(2)*(xdata(:,2)-colorcenter(2)).^2+a(3)*(xdata(:,3)-colorcenter(3)).^2+a(4)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))))+a(9)).*(((xdata(:,1)-colorcenter(1)).^2+a(2)*(xdata(:,2)-colorcenter(2)).^2+a(3)*(xdata(:,3)-colorcenter(3)).^2+a(4)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))>=0);
        r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end

    par = afinal;
    par(5:7) = colorcenter;
    a = afinal;
    y = (a(8)*exp(a(1)*sqrt((xdata(:,1)-colorcenter(1)).^2+a(2)*(xdata(:,2)-colorcenter(2)).^2+a(3)*(xdata(:,3)-colorcenter(3)).^2+a(4)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))))+a(9)).*(((xdata(:,1)-colorcenter(1)).^2+a(2)*(xdata(:,2)-colorcenter(2)).^2+a(3)*(xdata(:,3)-colorcenter(3)).^2+a(4)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))>=0);
    % scatter(y,ydata);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);
end
end