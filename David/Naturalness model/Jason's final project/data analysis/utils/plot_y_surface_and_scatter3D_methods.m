function plot_y_surface_and_scatter3D_methods(par, templab, tempn, method, plane, srange, step)
% Plot y_predicted surface + scatter3 in one 3D axes, computing Y directly from par.
% No explicit Q_ab / S_ab variables; use inline expressions per method.
%
% method:
%   'fixed'         -> y = 1/(1 + k5 * exp(s))
%   'fdQst'         -> y = 1/(1 + exp(s - k5))
%   'ellipsoidfit4' -> y = 1/(1 + exp(alpha * s - a8))
%
% plane: 'ab' (default), 'La', 'Lb'
% par conventions:
%   fixed/fdQst:     [k1 k2 k3 k4 l0 a0 b0 k5]
%   ellipsoidfit4:   [alpha k2 k3 k4 l0 a0 b0 a8]
% srange, step: grid extent and resolution (defaults 30, 0.5)

    if nargin < 4 || isempty(method), method = 'fdQst'; end
    if nargin < 5 || isempty(plane),  plane  = 'ab'; end
    if nargin < 6 || isempty(srange), srange = 30; end
    if nargin < 7 || isempty(step),   step   = 0.5; end

    % Unpack common parts
    l0 = par(5); a0 = par(6); b0 = par(7);
    k2 = par(2); k3 = par(3); k4 = par(4);
    k5_or_a8 = par(8);    % k5 for fixed/fdQst, a8 for e4

    % Build grid per plane
    switch lower(plane)
        case 'ab'
            gx1 = a0 + (-srange:step:srange);   % a*
            gx2 = b0 + (-srange:step:srange);   % b*
            [X, Y] = meshgrid(gx1, gx2);
            % s(a,b): L fixed at l0 -> no L term
            switch lower(method)
                case {'fixed','fix'}
                    Ygrid = 1 ./ (1 + k5_or_a8 .* exp( sqrt(abs( k2.*(X-a0).^2 + k3.*(Y-b0).^2 + k4.*(X-a0).*(Y-b0) )) ));
                case {'fdqst','fd','shift'}
                    Ygrid = 1 ./ (1 + exp( sqrt(abs( k2.*(X-a0).^2 + k3.*(Y-b0).^2 + k4.*(X-a0).*(Y-b0) )) - k5_or_a8 ));
                case {'ellipsoidfit4','e4'}
                    alpha = par(1);
                    Ygrid = 1 ./ (1 + exp( alpha.*sqrt(abs( k2.*(X-a0).^2 + k3.*(Y-b0).^2 + k4.*(X-a0).*(Y-b0) )) - k5_or_a8 ));
                otherwise
                    error('Unsupported method: %s', method);
            end
            % sample projection on same slice (L=l0)
            xs = templab(:,2); ys = templab(:,3);
            s_samp = sqrt(abs( k2.*(xs-a0).^2 + k3.*(ys-b0).^2 + k4.*(xs-a0).*(ys-b0) ));
            xlab = '{\ita*}'; ylab = '{\itb*}';
        case 'la'
            gx1 = a0 + (-srange:step:srange);   % a*
            gx2 = l0 + (-srange:step:srange);   % L*
            [X, Y] = meshgrid(gx1, gx2);        % X=a*, Y=L*
            switch lower(method)
                case {'fixed','fix'}
                    k1 = par(1);
                    Ygrid = 1 ./ (1 + k5_or_a8 .* exp( sqrt(abs( k1.*(Y-l0).^2 + k2.*(X-a0).^2 )) ));
                case {'fdqst','fd','shift'}
                    k1 = par(1);
                    Ygrid = 1 ./ (1 + exp( sqrt(abs( k1.*(Y-l0).^2 + k2.*(X-a0).^2 )) - k5_or_a8 ));
                case {'ellipsoidfit4','e4'}
                    alpha = par(1);
                    Ygrid = 1 ./ (1 + exp( alpha.*sqrt(abs( (Y-l0).^2 + k2.*(X-a0).^2 )) - k5_or_a8 ));
                otherwise
                    error('Unsupported method: %s', method);
            end
            % sample projection on same slice (b=b0)
            xs = templab(:,2); ysL = templab(:,1);
            switch lower(method)
                case {'ellipsoidfit4','e4'}
                    s_samp = sqrt(abs( (ysL-l0).^2 + k2.*(xs-a0).^2 ));
                otherwise
                    k1 = par(1);
                    s_samp = sqrt(abs( k1.*(ysL-l0).^2 + k2.*(xs-a0).^2 ));
            end
            xs = xs; ys = ysL;
            xlab = '{\ita*}'; ylab = '{\itL*}';
        case 'lb'
            gx1 = b0 + (-srange:step:srange);   % b*
            gx2 = l0 + (-srange:step:srange);   % L*
            [X, Y] = meshgrid(gx1, gx2);        % X=b*, Y=L*
            switch lower(method)
                case {'fixed','fix'}
                    k1 = par(1);
                    Ygrid = 1 ./ (1 + k5_or_a8 .* exp( sqrt(abs( k1.*(Y-l0).^2 + k3.*(X-b0).^2 )) ));
                case {'fdqst','fd','shift'}
                    k1 = par(1);
                    Ygrid = 1 ./ (1 + exp( sqrt(abs( k1.*(Y-l0).^2 + k3.*(X-b0).^2 )) - k5_or_a8 ));
                case {'ellipsoidfit4','e4'}
                    alpha = par(1);
                    Ygrid = 1 ./ (1 + exp( alpha.*sqrt(abs( (Y-l0).^2 + k3.*(X-b0).^2 )) - k5_or_a8 ));
                otherwise
                    error('Unsupported method: %s', method);
            end
            % sample projection on same slice (a=a0)
            xsB = templab(:,3); ysL = templab(:,1);
            switch lower(method)
                case {'ellipsoidfit4','e4'}
                    s_samp = sqrt(abs( (ysL-l0).^2 + k3.*(xsB-b0).^2 ));
                otherwise
                    k1 = par(1);
                    s_samp = sqrt(abs( k1.*(ysL-l0).^2 + k3.*(xsB-b0).^2 ));
            end
            xs = xsB; ys = ysL;
            xlab = '{\itb*}'; ylab = '{\itL*}';
        otherwise
            error('Unsupported plane: %s (use ''ab'', ''La'', or ''Lb'')', plane);
    end

    % y for samples per method
    switch lower(method)
        case {'fixed','fix'}
            y_s = 1 ./ (1 + k5_or_a8 .* exp(s_samp));
        case {'fdqst','fd','shift'}
            y_s = 1 ./ (1 + exp(s_samp - k5_or_a8));
        case {'ellipsoidfit4','e4'}
            alpha = par(1);
            y_s = 1 ./ (1 + exp(alpha.*s_samp - k5_or_a8));
    end

    % One axes: surface + scatter overlay; surface alpha = 0.5
    figure(); hold on;
    surf(X, Y, Ygrid, 'EdgeColor', 'none', 'FaceAlpha', 0.5, 'FaceColor', [0.8 0.8 0.8]);
    shading interp;

    scatter3(xs, ys, y_s, 36, tempn, 'filled');
    colormap turbo; colorbar;

    view(45, 35); grid on; box on; axis vis3d; axis tight;
    xlabel(xlab); ylabel(ylab); zlabel('y_{predicted}');
    title(sprintf('y_{pred} surface + scatter (%s, %s-plane)', method, upper(plane)));
    hold off;
end
