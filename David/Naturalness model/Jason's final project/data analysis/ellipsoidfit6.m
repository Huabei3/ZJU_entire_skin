function [par,r] = ellipsoidfit6(cielab,zscore,colorcenter)
% cielab should be m*3 matrix
% zscore should be m*1 vector

% if color center is preset, it will be fixed and not be optimized.
% output: par = [l0,a0,b0,k1,k2,k3,k23,k12,k13,alpha]
if nargin < 3
    xdata = cielab;
    ydata = zscore;
    
    f = @(a,xdata)(1./(1+exp(a(4)*sqrt((xdata(:,1)-a(1)).^2+a(5)*(xdata(:,2)-a(2)).^2+a(6)*(xdata(:,3)-a(3)).^2+a(7)*(xdata(:,2)-a(2)).*(xdata(:,3)-a(3))+a(8)*(xdata(:,1)-a(1)).*(xdata(:,2)-a(2))+a(9)*(xdata(:,1)-a(1)).*(xdata(:,3)-a(3)))-a(10)))).*(((xdata(:,1)-a(1)).^2+a(5)*(xdata(:,2)-a(2)).^2+a(6)*(xdata(:,3)-a(3)).^2+a(7)*(xdata(:,2)-a(2)).*(xdata(:,3)-a(3))+a(8)*(xdata(:,1)-a(1)).*(xdata(:,2)-a(2))+a(9)*(xdata(:,1)-a(1)).*(xdata(:,3)-a(3)))-a(10)>=0);
    rmax = 0;
    
    for t = 1:100
        a0 = [-rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata,[-inf,-inf,-inf,-inf,0,0,-inf,-inf,-inf,-inf],[inf,inf,inf,inf,inf,inf,inf,inf,inf,inf],options);
        y = (1./(1+exp(a(4)*sqrt((xdata(:,1)-a(1)).^2+a(5)*(xdata(:,2)-a(2)).^2+a(6)*(xdata(:,3)-a(3)).^2+a(7)*(xdata(:,2)-a(2)).*(xdata(:,3)-a(3))+a(8)*(xdata(:,1)-a(1)).*(xdata(:,2)-a(2))+a(9)*(xdata(:,1)-a(1)).*(xdata(:,3)-a(3)))-a(10)))).*(((xdata(:,1)-a(1)).^2+a(5)*(xdata(:,2)-a(2)).^2+a(6)*(xdata(:,3)-a(3)).^2+a(7)*(xdata(:,2)-a(2)).*(xdata(:,3)-a(3))+a(8)*(xdata(:,1)-a(1)).*(xdata(:,2)-a(2))+a(9)*(xdata(:,1)-a(1)).*(xdata(:,3)-a(3)))-a(10)>=0);
        
        
        
        r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end
    
    par = afinal;
    a = afinal;
    y = (1./(1+exp(a(4)*sqrt((xdata(:,1)-a(1)).^2+a(5)*(xdata(:,2)-a(2)).^2+a(6)*(xdata(:,3)-a(3)).^2+a(7)*(xdata(:,2)-a(2)).*(xdata(:,3)-a(3))+a(8)*(xdata(:,1)-a(1)).*(xdata(:,2)-a(2))+a(9)*(xdata(:,1)-a(1)).*(xdata(:,3)-a(3)))-a(10)))).*(((xdata(:,1)-a(1)).^2+a(5)*(xdata(:,2)-a(2)).^2+a(6)*(xdata(:,3)-a(3)).^2+a(7)*(xdata(:,2)-a(2)).*(xdata(:,3)-a(3))+a(8)*(xdata(:,1)-a(1)).*(xdata(:,2)-a(2))+a(9)*(xdata(:,1)-a(1)).*(xdata(:,3)-a(3)))-a(10)>=0);
    scatter(y,ydata);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);
    
    
else
    xdata = cielab;
    ydata = zscore;
    
    f = @(a,xdata)(1./(1+exp(a(4)*sqrt((xdata(:,1)-colorcenter(1)).^2+a(5)*(xdata(:,2)-colorcenter(2)).^2+a(6)*(xdata(:,3)-colorcenter(3)).^2+a(7)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))+a(8)*(xdata(:,1)-colorcenter(1)).*(xdata(:,2)-colorcenter(2))+a(9)*(xdata(:,1)-colorcenter(1)).*(xdata(:,3)-colorcenter(3)))-a(10)))).*(((xdata(:,1)-colorcenter(1)).^2+a(5)*(xdata(:,2)-colorcenter(2)).^2+a(6)*(xdata(:,3)-colorcenter(3)).^2+a(7)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))+a(8)*(xdata(:,1)-colorcenter(1)).*(xdata(:,2)-colorcenter(2))+a(9)*(xdata(:,1)-colorcenter(1)).*(xdata(:,3)-colorcenter(3)))-a(10)>=0);
    rmax = 0;
    
    for t = 1:100
        a0 = [-rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
        options = optimset('MaxFunEvals',200000);
        a = lsqcurvefit(f,a0,xdata,ydata,[-inf,-inf,-inf,-inf,0,0,-inf,-inf,-inf,-inf],[inf,inf,inf,inf,inf,inf,inf,inf,inf,inf],options);
        y = (1./(1+exp(a(4)*sqrt((xdata(:,1)-colorcenter(1)).^2+a(5)*(xdata(:,2)-colorcenter(2)).^2+a(6)*(xdata(:,3)-colorcenter(3)).^2+a(7)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))+a(8)*(xdata(:,1)-colorcenter(1)).*(xdata(:,2)-colorcenter(2))+a(9)*(xdata(:,1)-colorcenter(1)).*(xdata(:,3)-colorcenter(3)))-a(10)))).*(((xdata(:,1)-colorcenter(1)).^2+a(5)*(xdata(:,2)-colorcenter(2)).^2+a(6)*(xdata(:,3)-colorcenter(3)).^2+a(7)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))+a(8)*(xdata(:,1)-colorcenter(1)).*(xdata(:,2)-colorcenter(2))+a(9)*(xdata(:,1)-colorcenter(1)).*(xdata(:,3)-colorcenter(3)))-a(10)>=0);

        r = corr(y,ydata);
        if r >= rmax
            rmax = r;
            afinal = a;
        end
    end
    
    par = afinal;
    par(1:3) = colorcenter;
    a = afinal;
    y = (1./(1+exp(a(4)*sqrt((xdata(:,1)-colorcenter(1)).^2+a(5)*(xdata(:,2)-colorcenter(2)).^2+a(6)*(xdata(:,3)-colorcenter(3)).^2+a(7)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))+a(8)*(xdata(:,1)-colorcenter(1)).*(xdata(:,2)-colorcenter(2))+a(9)*(xdata(:,1)-colorcenter(1)).*(xdata(:,3)-colorcenter(3)))-a(10)))).*(((xdata(:,1)-colorcenter(1)).^2+a(5)*(xdata(:,2)-colorcenter(2)).^2+a(6)*(xdata(:,3)-colorcenter(3)).^2+a(7)*(xdata(:,2)-colorcenter(2)).*(xdata(:,3)-colorcenter(3))+a(8)*(xdata(:,1)-colorcenter(1)).*(xdata(:,2)-colorcenter(2))+a(9)*(xdata(:,1)-colorcenter(1)).*(xdata(:,3)-colorcenter(3)))-a(10)>=0);
    scatter(y,ydata);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);
end


end



