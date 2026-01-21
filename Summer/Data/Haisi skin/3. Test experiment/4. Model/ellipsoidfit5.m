function par = ellipsoidfit5(cielab,zscore,colorcenter)
% cielab should be m*3 matrix
% zscore should be m*1 vector

% if color center is preset, it will be fixed and not be optimized.
% this is for 1/1+e model
% output: par = [k1,k2,k3,k4,l0,a0,b0,k5,k6]
if nargin < 3
    xdata = cielab;
    ydata = zscore;

    f = @(a,xdata)(1./(1+exp(a(1)*sqrt((xdata(:,2)-a(5)).^2+a(2)*(xdata(:,3)-a(6)).^2+a(3)*(xdata(:,2)-a(5)).*(xdata(:,3)-a(6)))-a(4)))).*(((xdata(:,2)-a(5)).^2+a(2)*(xdata(:,3)-a(6)).^2+a(3)*(xdata(:,2)-a(5)).*(xdata(:,3)-a(6)))>=0);
    rmax = 0;

    for t = 1:100
        a0 = [-rand,rand,rand,rand,rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata,[-inf,0,-inf,-inf,-inf,-inf],[inf,inf,inf,inf,inf,inf],options);
        y = (1./(1+exp(a(1)*sqrt((xdata(:,2)-a(5)).^2+a(2)*(xdata(:,3)-a(6)).^2+a(3)*(xdata(:,2)-a(5)).*(xdata(:,3)-a(6)))-a(4)))).*(((xdata(:,2)-a(5)).^2+a(2)*(xdata(:,3)-a(6)).^2+a(3)*(xdata(:,2)-a(5)).*(xdata(:,3)-a(6)))>=0);

        r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end

    par = afinal;
    a = afinal;
    y = (1./(1+exp(a(1)*sqrt((xdata(:,2)-a(5)).^2+a(2)*(xdata(:,3)-a(6)).^2+a(3)*(xdata(:,2)-a(5)).*(xdata(:,3)-a(6)))-a(4)))).*(((xdata(:,2)-a(5)).^2+a(2)*(xdata(:,3)-a(6)).^2+a(3)*(xdata(:,2)-a(5)).*(xdata(:,3)-a(6)))>=0);
%      scatter(y,ydata);
    r = corr(y,ydata);
%     fprintf('corralation coefficient is %.2f\n',r);
else
    xdata = cielab;
    ydata = zscore;

    f = @(a,xdata)(1./(1+exp(a(1)*sqrt((xdata(:,2)-colorcenter(2)).^2+a(2)*(xdata(:,3)-colorcenter(3)).^2+a(3)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))-a(4)))).*(((xdata(:,2)-colorcenter(2)).^2+a(2)*(xdata(:,3)-colorcenter(3)).^2+a(3)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))>=0);
    rmax = 0;

    for t = 1:100
        a0 = [-rand,rand,rand,rand,rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata,[-inf,0,-inf,-inf,-inf,-inf],[inf,inf,inf,inf,inf,inf],options);
        y = (1./(1+exp(a(1)*sqrt((xdata(:,2)-colorcenter(2)).^2+a(2)*(xdata(:,3)-colorcenter(3)).^2+a(3)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))-a(4)))).*(((xdata(:,2)-colorcenter(2)).^2+a(2)*(xdata(:,3)-colorcenter(3)).^2+a(3)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))>=0);
        r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end

    par = afinal;
    par(5:7) = colorcenter;
    a = afinal;
    y = (1./(1+exp(a(1)*sqrt((xdata(:,2)-colorcenter(2)).^2+a(2)*(xdata(:,3)-colorcenter(3)).^2+a(3)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))-a(4)))).*(((xdata(:,2)-colorcenter(2)).^2+a(2)*(xdata(:,3)-colorcenter(3)).^2+a(3)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3)))>=0);
%      scatter(y,ydata);
    r = corr(y,ydata);
%     fprintf('corralation coefficient is %.2f\n',r);
end
end


