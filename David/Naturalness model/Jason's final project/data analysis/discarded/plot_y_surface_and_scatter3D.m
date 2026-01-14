function plot_y_surface_and_scatter3D(par, templab, tempn, model_type, plane, srange, step)
% Plot y_predicted surface and overlay LAB scatter3 in the same 3D axes.
% Surface transparency is 50%.
%
% Inputs:
%   par        : [k1 k2 k3 k4 l0 a0 b0 k5]
%   templab    : Nx3 LAB data (L*, a*, b*)
%   tempn      : Nx1 values used for scatter coloring
%   model_type : 'fixed' (y=1/(1+k5*exp(s))) or 'fdQst' (y=1/(1+exp(s-k5))) [default 'fdQst']
%   plane      : 'ab' (default), 'La', or 'Lb' -> 2D slice used for surface
%   srange     : scalar half-span for grid around the center (default 30)
%   step       : grid step (default 0.5)
%
% Quadratic metric: Q = k1*(L-l0)^2 + k2*(a-a0)^2 + k3*(b-b0)^2 + k4*(a-a0)*(b-b0)
% Surface is y(s) with s = sqrt(Q) on the chosen 2D slice.
% Scatter is plotted on the SAME (x,y) plane with z = y_pred for each sample (slice-based),
% and colored by tempn.

    if nargin < 4 || isempty(model_type); model_type = 'fdQst'; end
    if nargin < 5 || isempty(plane); plane = 'ab'; end
    if nargin < 6 || isempty(srange); srange = 30; end
    if nargin < 7 || isempty(step); step = 0.5; end

    k1 = par(1); k2 = par(2); k3 = par(3); k4 = par(4);
    l0 = par(5); a0 = par(6); b0 = par(7); k5 = par(8);

    % Build grid and compute surface s = sqrt(Q) and y_pred
    switch lower(plane)
        case 'ab'
            ax = a0 + (-srange:step:srange);
            bx = b0 + (-srange:step:srange);
            [A, B] = meshgrid(ax, bx);
            Q = k2*(A - a0).^2 + k3*(B - b0).^2 + k4*(A - a0).*(B - b0);
            X = A; Y = B; xlab = '{\ita*}'; ylab = '{\itb*}';
            % sample-based s on the same slice (L fixed at l0)
            a_s = templab(:,2); b_s = templab(:,3);
            s_sample = sqrt(abs(k2*(a_s - a0).^2 + k3*(b_s - b0).^2 + k4*(a_s - a0).*(b_s - b0)));
            xs = a_s; ys = b_s;
        case 'la'
            ax = a0 + (-srange:step:srange);
            lx = l0 + (-srange:step:srange);
            [A, L] = meshgrid(ax, lx);
            Q = k1*(L - l0).^2 + k2*(A - a0).^2;
            X = A; Y = L; xlab = '{\ita*}'; ylab = '{\itL*}';
            % sample-based s on the same slice (b fixed at b0)
            a_s = templab(:,2); L_s = templab(:,1);
            s_sample = sqrt(abs(k1*(L_s - l0).^2 + k2*(a_s - a0).^2));
            xs = a_s; ys = L_s;
        case 'lb'
            bx = b0 + (-srange:step:srange);
            lx = l0 + (-srange:step:srange);
            [B, L] = meshgrid(bx, lx);
            Q = k1*(L - l0).^2 + k3*(B - b0).^2;
            X = B; Y = L; xlab = '{\itb*}'; ylab = '{\itL*}';
            % sample-based s on the same slice (a fixed at a0)
            b_s = templab(:,3); L_s = templab(:,1);
            s_sample = sqrt(abs(k1*(L_s - l0).^2 + k3*(b_s - b0).^2));
            xs = b_s; ys = L_s;
        otherwise
            error('Unsupported plane: %s (use ''ab'', ''La'', or ''Lb'')', plane);
    end

    S = sqrt(abs(Q));

    switch lower(model_type)
        case 'fixed'
            Ypred = 1 ./ (1 + k5 * exp(S));
            y_s = 1 ./ (1 + k5 * exp(s_sample));
        case 'fdqst'
            Ypred = 1 ./ (1 + exp(S - k5));
            y_s = 1 ./ (1 + exp(s_sample - k5));
        case 'my_4'
            Ypred = 1 ./ (1 + k1*exp(S - k5));
            y_s = 1 ./ (1 + exp(s_sample - k5));
        case '4'
            Ypred = 1 ./ (1 + k1*exp(S - k5));
            y_s = 1 ./ (1 + exp(s_sample - k5));
        otherwise
            error('Unsupported model_type: %s (use ''fixed'' or ''fdQst'')', model_type);
    end

    % Single axes: draw surface then overlay scatter; surface alpha = 0.5
    figure(); hold on;
    hs = surf(X, Y, Ypred, 'EdgeColor', 'none', 'FaceAlpha', 0.5, 'FaceColor', [0.8 0.8 0.8]);
    % Ensure surface is shaded smoothly
    shading interp;

    % Overlay scatter3: coordinates on the same (x,y,z=y_pred) space; color = tempn
    hsc = scatter3(xs, ys, y_s, 36, tempn, 'filled');

    colormap turbo;
    caxis([min(tempn(:)) max(tempn(:))]);
    colorbar;

    view(45, 35); grid on; box on; axis vis3d; axis tight;
    xlabel(xlab); ylabel(ylab); zlabel('y_{predicted}');
    title(sprintf('y_{pred} surface + LAB scatter (colored by score) [%s, %s-plane]', model_type, upper(plane)));
    hold off;
end


