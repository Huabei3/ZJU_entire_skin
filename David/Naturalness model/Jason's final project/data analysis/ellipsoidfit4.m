function [par,r] = ellipsoidfit4(cielab,zscore,colorcenter)
% cielab: m x 3 [L a b]
% zscore: m x 1
% Optional colorcenter: [L0 a0 b0] (fixed center)
% Model ("ellipsoidfit4" form): y = 1/(1 + exp(alpha * s - a8)),
%   s = sqrt(Q),  Q = (L-l0)^2 + k2*(a-a0)^2 + k3*(b-b0)^2 + k4*(a-a0)*(b-b0)
% Notes:
% - alpha >= 0 is enforced to keep y decreasing with distance s.
% - sqrt(max(Q,0)) to avoid complex values; we also mask Q>=0 to be safe.
% - par = [alpha, k2, k3, k4, l0, a0, b0, a8]

xdata = cielab;  % [L a b]
ydata = zscore;

% Helpers
Sfun_free  = @(a,xd) sqrt(max( (xd(:,1)-a(5)).^2 + a(2)*(xd(:,2)-a(6)).^2 + a(3)*(xd(:,3)-a(7)).^2 + a(4)*(xd(:,2)-a(6)).*(xd(:,3)-a(7)) , 0));
Mask_free  = @(a,xd) ( (xd(:,1)-a(5)).^2 + a(2)*(xd(:,2)-a(6)).^2 + a(3)*(xd(:,3)-a(7)).^2 + a(4)*(xd(:,2)-a(6)).*(xd(:,3)-a(7)) ) >= 0;
Sfun_fixed = @(a,xd,c0) sqrt(max( (xd(:,1)-c0(1)).^2 + a(2)*(xd(:,2)-c0(2)).^2 + a(3)*(xd(:,3)-c0(3)).^2 + a(4)*(xd(:,2)-c0(2)).*(xd(:,3)-c0(3)) , 0));
Mask_fixed = @(a,xd,c0) ( (xd(:,1)-c0(1)).^2 + a(2)*(xd(:,2)-c0(2)).^2 + a(3)*(xd(:,3)-c0(3)).^2 + a(4)*(xd(:,2)-c0(2)).*(xd(:,3)-c0(3)) ) >= 0;

if nargin < 3 || isempty(colorcenter)
    % Free center
    f = @(a,xd) 1 ./ (1 + exp( a(1)*Sfun_free(a,xd) - a(8) )) .* Mask_free(a,xd);

    % Data-driven bounds for center
    L = xdata(:,1); A = xdata(:,2); B = xdata(:,3);
    lmin = max(0,  min(L) - 10); lmax = min(100, max(L) + 10);
    amin = min(A) - 10; amax = max(A) + 10;
    bmin = min(B) - 10; bmax = max(B) + 10;

    lb = [0,  0,   0,  -inf, lmin, amin, bmin, -inf];
    ub = [inf,inf,inf, inf,  lmax, amax, bmax,  inf];

    rmax = -inf; afinal = [];
    options = optimset('MaxFunEvals',200000,'Display','off');

    for t = 1:100
        a0 = zeros(1,8);
        a0(1) = abs(randn())+0.1;  % alpha >= 0
        a0(2:3) = abs(rand(1,2));  % k2,k3 >= 0
        a0(4) = 0.1*randn();       % k4 small init
        a0(5) = median(L); a0(6) = median(A); a0(7) = median(B);
        a0(8) = randn();           % a8 shift
        a0 = max(min(a0,ub),lb);   % project inside bounds

        a = lsqcurvefit(f,a0,xdata,ydata,lb,ub,options);
        y = f(a,xdata);
        rtmp = corr(y,ydata);
        if ~isnan(rtmp) && rtmp >= rmax
            rmax = rtmp; afinal = a;
        end
    end

    par = afinal;
    y = f(par,xdata);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);
else
    % Fixed center = colorcenter
    c0 = colorcenter(:).';
    f = @(a,xd) 1 ./ (1 + exp( a(1)*Sfun_fixed(a,xd,c0) - a(8) )) .* Mask_fixed(a,xd,c0);

    rmax = -inf; afinal = [];
    options = optimset('MaxFunEvals',200000,'Display','off');

    % Bounds: alpha>=0, k2,k3>=0, k4 free, a8 free. l0,a0,b0 are fixed later.
    lb = [0,  0,   0,  -inf, -inf, -inf, -inf, -inf];
    ub = [inf,inf,inf, inf,  inf,  inf,  inf,  inf];

    for t = 1:100
        a0 = zeros(1,8);
        a0(1) = abs(randn())+0.1;  % alpha
        a0(2:3) = abs(rand(1,2));  % k2,k3
        a0(4) = 0.1*randn();       % k4
        a0(5:7) = c0;              % placeholders
        a0(8) = randn();

        a = lsqcurvefit(f,a0,xdata,ydata,lb,ub,options);
        y = f(a,xdata);
        rtmp = corr(y,ydata);
        if ~isnan(rtmp) && rtmp >= rmax
            rmax = rtmp; afinal = a;
        end
    end

    par = afinal; par(5:7) = c0; % write fixed center into par
    y = f(par,xdata);
    r = corr(y,ydata);
    fprintf('corralation coefficient is %.2f\n',r);
end
