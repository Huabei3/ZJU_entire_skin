function plot_contour_with_scatter3D_fixedValue(par, lab_group, MSV_group, ...
    save_folder, label, use_fixed, s_level)
% Plot constant-radius (s = sqrt(Q)) contours on a-b and L-a planes.
% Adds a label-branch: if label contains "ellipsoidfit4" (case-insensitive),
% draw y-based contours using ellipsoidfit4's logistic y = 1/(1+exp(a1*sqrt(Q)-a8)).
%
% Inputs:
%   par        : [k1 k2 k3 k4 l0 a0 b0 a8]
%   lab_group  : Nx3 LAB samples (L*, a*, b*)
%   MSV_group  : Nx1 scores/colors for scatter coloring
%   save_folder: base output folder
%   label      : filename label (string); if contains 'ellipsoidfit4', use y-based contours
%   use_fixed  : bookkeeping tag ('fixed' or 'fdQst')
%   s_level    : scalar level for s = sqrt(Q); default = 2 (ignored for y-branch)

    if nargin < 7 || isempty(s_level)
        s_level = 2; % default metric radius; adjust as needed
    end

    % Coeff unpack for readability
    k1 = par(1); k2 = par(2); k3 = par(3); k4 = par(4);
    l0 = par(5); a0 = par(6); b0 = par(7); a8 = par(8);

    use_e4 = false;
    if ~isempty(label)
        lb = lower(string(label));
        use_e4 = contains(lb, "ellipsoidfit4") || contains(lb, "e4") || contains(lb, "a1outside");
    end

    % a-b plane -----------------------------------------------------
    da = a0 + (-30:0.2:30);
    db = b0 + (-30:0.2:30);
    [A, B] = meshgrid(da, db);

    Q_ab = k2*(A - a0).^2 + k3*(B - b0).^2 + k4*(A - a0).*(B - b0);
    S_ab = sqrt(max(Q_ab, 0));
    figure('Visible','off'); hold on;
    if strcmp(use_fixed,"fixed")        
        Y_ab = 1./(1 + exp(par(1)*S_ab - a8)) .* (Q_ab >= 0);
    elseif strcmp(use_fixed,"fdQst")
        Y_ab = 1./(1 + a8*exp(par(1)*S_ab)) .* (Q_ab >= 0);
    elseif strcmp(use_fixed,"my_4")  
        Y_ab = 1./(1 + exp(par(1)*S_ab- a8)) .* (Q_ab >= 0);
    elseif strcmp(use_fixed,"4")  
        Y_ab = 1./(1 + exp(par(1)*S_ab- a8)) .* (Q_ab >= 0);
    end
    lvl = 0.5*max(Y_ab(:));
    contour(A, B, Y_ab, [lvl lvl], 'LineWidth', 2);

    scatter(lab_group(:,2), lab_group(:,3), 40, MSV_group, 'filled');
    scatter(a0, b0, 30, 'filled');

    lim_max = max(max(lab_group(:, 2)), max(lab_group(:, 3))) + 10;
    lim_min = min(min(lab_group(:, 2)), min(lab_group(:, 3))) - 10;
    line([0, 0], [lim_min, lim_max], 'Color', 'k', 'LineStyle', '--');
    line([lim_min, lim_max], [0, 0], 'Color', 'k', 'LineStyle', '--');
    refline(1, 0);

    axis equal; xlim([lim_min, lim_max]); ylim([lim_min, lim_max]);
    xlabel('{\ita*}'); ylabel('{\itb*}');
    if use_e4
        ttl = sprintf('y-contour (a-b, ellipsoidfit4)');
    elseif ischar(use_fixed) || isstring(use_fixed)
        ttl = sprintf('s = %.2f (a-b, %s)', s_level, string(use_fixed));
    else
        ttl = sprintf('s = %.2f (a-b)', s_level);
    end
    title(ttl);
    hold off;

    out_dir = fullfile(save_folder, 'a_b');
    if ~exist(out_dir, 'dir'); mkdir(out_dir); end
    exportgraphics(gcf, fullfile(out_dir, strcat(label, 'a_b.jpg')), 'Resolution', 150);
    close(gcf);

    % L-a plane -----------------------------------------------------
    dL = l0 + (-30:0.2:30);
    da = a0 + (-30:0.2:30);
    [A2, L] = meshgrid(da, dL); % A2 is a*, L is L*

    Q_La = k1*(L - l0).^2 + k2*(A2 - a0).^2;

    figure('Visible','off'); hold on;
    if use_e4
        S_La = sqrt(max(Q_La, 0));
        Y_La = 1./(1 + exp(par(1)*S_La - a8)) .* (Q_La >= 0);
        lvl = 0.5*max(Y_La(:));
        contour(A2, L, Y_La, [lvl lvl], 'LineWidth', 2);
    else
        S_La = sqrt(max(Q_La, 0));
        contour(A2, L, S_La, [s_level s_level], 'LineWidth', 2);
    end

    scatter(lab_group(:,2), lab_group(:,1), 40, MSV_group, 'filled');
    scatter(a0, l0, 30, 'filled');

    x_max = max(lab_group(:, 2)) + 10; x_min = min(lab_group(:, 2)) - 10;
    y_max = max(lab_group(:, 1)) + 10; y_min = min(lab_group(:, 1)) - 10;

    axis equal; xlim([x_min, x_max]); ylim([y_min, y_max]);
    xlabel('{\ita*}'); ylabel('{\itL*}');
    if use_e4
        ttl = sprintf('y-contour (L-a, ellipsoidfit4)');
    elseif ischar(use_fixed) || isstring(use_fixed)
        ttl = sprintf('s = %.2f (L-a, %s)', s_level, string(use_fixed));
    else
        ttl = sprintf('s = %.2f (L-a)', s_level);
    end
    title(ttl);
    hold off;

    out_dir = fullfile(save_folder, 'L_a');
    if ~exist(out_dir, 'dir'); mkdir(out_dir); end
    exportgraphics(gcf, fullfile(out_dir, strcat(label, 'L_a.jpg')), 'Resolution', 150);
    close(gcf);
end
