function [par,r,y] = my_ellipsoidfit_fdQst(cielab, zscore, colorcenter)
% cielab: m x 3 [L a b]
% zscore: m x 1 target
% colorcenter: [L0 a0 b0] center; constrained within +-5 during fit
% Model (fdQst form): y = 1/(1 + exp(s - k5)), s = sqrt(Q),
%   Q = k1*(L-l0)^2 + k2*(a-a0)^2 + k3*(b-b0)^2 + k4*(a-a0)*(b-b0)
% Guard: use s = sqrt(max(Q,0)) and mask Q>=0 to avoid complex values

xdata = cielab;
ydata = zscore;

% s(x; a) helper (no complex)
Sfun = @(a,xd) sqrt(max( a(1)*(xd(:,1)-a(5)).^2 + ...
                         a(2)*(xd(:,2)-a(6)).^2 + ...
                         a(3)*(xd(:,3)-a(7)).^2 + ...
                         a(4)*(xd(:,2)-a(6)).*(xd(:,3)-a(7)) , 0));

% mask for valid region (Q>=0)
Mask = @(a,xd) ( a(1)*(xd(:,1)-a(5)).^2 + ...
                 a(2)*(xd(:,2)-a(6)).^2 + ...
                 a(3)*(xd(:,3)-a(7)).^2 + ...
                 a(4)*(xd(:,2)-a(6)).*(xd(:,3)-a(7)) ) >= 0;

% fdQst logistic
f = @(a,xd) ( 1./(1 + exp(Sfun(a,xd) - a(8))) ) .* Mask(a,xd);

rmax = -inf; afinal = [];

lb = [0, 0, 0, -inf, colorcenter(1)-5, colorcenter(2)-5, colorcenter(3)-5, -inf];
ub = [inf, inf, inf,  inf, colorcenter(1)+5, colorcenter(2)+5, colorcenter(3)+5,  inf];

options = optimset('MaxFunEvals', 200000, 'Display', 'off');

for t = 1:400
    % Initial guess inside bounds
    a0 = zeros(1,8);
    a0(1:3) = abs(randn(1,3));                % k1..k3 >= 0
    a0(4)   = 0.1*randn();                     % small cross term
    a0(5:7) = colorcenter + (rand(1,3)-0.5)*10; % within +/-5 of center
    a0(8)   = randn();                          % shift can be any real

    % Project to bounds just in case of numeric drift
    a0 = max(min(a0, ub), lb);

    % Ensure initial function eval is real (by construction) and finite
    % (also avoids lsqcurvefit complex-value error with bounds)
    a = lsqcurvefit(f, a0, xdata, ydata, lb, ub, options);

    yfit = f(a, xdata);
    rr = corr(yfit, ydata);
    if ~isnan(rr) && rr >= rmax
        rmax = rr;
        afinal = a;
    end
end

par = afinal;
y = f(par, xdata);
r = corr(y, ydata);
fprintf('corralation coefficient is %.2f\n', r);

end
