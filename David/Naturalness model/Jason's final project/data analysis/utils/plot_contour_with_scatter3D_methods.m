function plot_contour_with_scatter3D_methods(par, lab_group, MSV_group, save_folder, label, method)
% Draw Y-based half-maximum contours on a-b and L-a planes directly from par.
% No intermediate Q_ab/S_ab variables; compute Y from parameters per method.
%
% method:
%   'fixed'         -> y = 1./(1 + k5 * exp(s))
%   'fdQst'         -> y = 1./(1 + exp(s - k5))
%   'ellipsoidfit4' -> y = 1./(1 + exp(alpha * s - a8))
%
% Parameter conventions:
%   fixed/fdQst:     par = [k1 k2 k3 k4 l0 a0 b0 k5]
%   ellipsoidfit4:   par = [alpha k2 k3 k4 l0 a0 b0 a8]
% where s = sqrt(Q) and
%   a-b plane: Q = k2*(a-a0)^2 + k3*(b-b0)^2 + k4*(a-a0)*(b-b0)
%   L-a plane: Q = k1*(L-l0)^2 + k2*(a-a0)^2   (no cross-terms with L)

    if nargin < 6 || isempty(method); method = 'fdQst'; end
    a = par;

    % ---------------- a-b plane ----------------
    aa = a(6) + (-30:0.2:30);
    bb = a(7) + (-30:0.2:30);
    [A, B] = meshgrid(aa, bb);

    switch lower(method)
        case {'fixed','fix'}
            % y = 1/(1 + k5*exp(s)), s = sqrt(k2*(A-a0)^2 + k3*(B-b0)^2 + k4*(A-a0)*(B-b0))
            Y_ab = 1 ./ (1 + a(8) .* exp( sqrt( max(0, a(2).*(A-a(6)).^2 + a(3).*(B-a(7)).^2 + a(4).*(A-a(6)).*(B-a(7)) ) ) ));
        case {'fdqst','fd','shift'}
            % y = 1/(1 + exp(s - k5))
            Y_ab = 1 ./ (1 + exp( sqrt( max(0, a(2).*(A-a(6)).^2 + a(3).*(B-a(7)).^2 + a(4).*(A-a(6)).*(B-a(7)) ) ) - a(8) ));
        case {'ellipsoidfit4','e4'}
            % y = 1/(1 + exp(alpha*s - a8)), with L-term not in a-b slice
            Y_ab = 1 ./ (1 + exp( a(1).*sqrt( max(0, a(2).*(A-a(6)).^2 + a(3).*(B-a(7)).^2 + a(4).*(A-a(6)).*(B-a(7)) ) ) - a(8) ));
        otherwise
            error('Unsupported method: %s', method);
    end

    figure('Visible','off'); hold on;
    lvl_ab = 0.5 * max(Y_ab(:));
    contour(A, B, Y_ab, [lvl_ab lvl_ab], 'LineWidth', 2);
    scatter(lab_group(:,2), lab_group(:,3), 40, MSV_group, 'filled');
    scatter(a(6), a(7), 30, 'filled');

    lim_max = max(max(lab_group(:, 2)), max(lab_group(:, 3))) + 10;
    lim_min = min(min(lab_group(:, 2)), min(lab_group(:, 3))) - 10;
    line([0, 0], [lim_min, lim_max], 'Color', 'k', 'LineStyle', '--');
    line([lim_min, lim_max], [0, 0], 'Color', 'k', 'LineStyle', '--');
    refline(1, 0);

    axis equal; xlim([lim_min, lim_max]); ylim([lim_min, lim_max]);
    xlabel('{\ita*}'); ylabel('{\itb*}');
    title(sprintf('Y half-maximum (a-b, %s)', method));
    out_dir = fullfile(save_folder, 'a_b'); if ~exist(out_dir, 'dir'); mkdir(out_dir); end
    exportgraphics(gcf, fullfile(out_dir, strcat(label, 'a_b.jpg')), 'Resolution', 150);
    close(gcf);

    % ---------------- L-a plane ----------------
    LL = a(5) + (-30:0.2:30);
    [A2, L] = meshgrid(aa, LL); % A2: a*, L: L*

    switch lower(method)
        case {'fixed','fix'}
            % y = 1/(1 + k5*exp(s)), s = sqrt(k1*(L-l0)^2 + k2*(A2-a0)^2)
            Y_La = 1 ./ (1 + a(8) .* exp( sqrt( max(0, a(1).*(L-a(5)).^2 + a(2).*(A2-a(6)).^2 ) ) ));
        case {'fdqst','fd','shift'}
            % y = 1/(1 + exp(s - k5))
            Y_La = 1 ./ (1 + exp( sqrt( max(0, a(1).*(L-a(5)).^2 + a(2).*(A2-a(6)).^2 ) ) - a(8) ));
        case {'ellipsoidfit4','e4'}
            % y = 1/(1 + exp(alpha*s - a8)), with k1=1 on L term
            Y_La = 1 ./ (1 + exp( a(1).*sqrt( max(0, (L-a(5)).^2 + a(2).*(A2-a(6)).^2 ) ) - a(8) ));
        otherwise
            error('Unsupported method: %s', method);
    end

    figure('Visible','off'); hold on;
    lvl_la = 0.5 * max(Y_La(:));
    contour(A2, L, Y_La, [lvl_la lvl_la], 'LineWidth', 2);
    scatter(lab_group(:,2), lab_group(:,1), 40, MSV_group, 'filled');
    scatter(a(6), a(5), 30, 'filled');

    x_max = max(lab_group(:, 2)) + 10; x_min = min(lab_group(:, 2)) - 10;
    y_max = max(lab_group(:, 1)) + 10; y_min = min(lab_group(:, 1)) - 10;

    axis equal; xlim([x_min, x_max]); ylim([y_min, y_max]);
    xlabel('{\ita*}'); ylabel('{\itL*}');
    title(sprintf('Y half-maximum (L-a, %s)', method));
    out_dir = fullfile(save_folder, 'L_a'); if ~exist(out_dir, 'dir'); mkdir(out_dir); end
    exportgraphics(gcf, fullfile(out_dir, strcat(label, 'L_a.jpg')), 'Resolution', 150);
    close(gcf);
end
