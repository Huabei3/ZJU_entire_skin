% main2_separate2.m
% Variant of main2_separate1 with a method switch for fitting and new plotting functions.
% Methods supported:
%   - 'my_ellipsoidfit_fixed'
%   - 'my_ellipsoidfit_fdQst'
%   - 'ellipsoidfit4'
%   - 'my_ellipsoidfit_4'

clear; clc;
load naturalness1;
load skylab;
load skinlab;
load grasslab;
addpath("utils\")

% Choose method here
method = 'ellipsoidfit4';  
% options: 'my_ellipsoidfit_fixed' | 'my_ellipsoidfit_fdQst' | 'ellipsoidfit4' | 'my_ellipsoidfit_4'

output_folder = fullfile("res\separate_skin_methods");
if ~exist(output_folder, "dir"); mkdir(output_folder); end
fitRes_folder = fullfile(output_folder, "fitRes");
if ~exist(fitRes_folder, "dir"); mkdir(fitRes_folder); end
par_all = [];
ellipse_atr_all = [];
labNscore = {};
curr = 1;

for i = [1 5 7 9 10]
    templab = skinlab((i-1)*49+1:(i-1)*49+49, :);
    tempn   = naturalness1(980+(i-1)*49+1:980+(i-1)*49+49, :);

    % center from data (weighted or simple mean)
    [par_mean, ~] = calculate_weighted_or_simple_mean(tempn, templab);
    colorcenter = par_mean;  % [L0 a0 b0]

    % choose fitter by method
    switch lower(method)
        case {'my_ellipsoidfit_fixed','fixed'}
            [par, r] = my_ellipsoidfit_fixed(templab, tempn, colorcenter);
        case {'my_ellipsoidfit_fdqst','fdqst','fd'}
            [par, r] = my_ellipsoidfit_fdQst(templab, tempn, colorcenter);
        case {'ellipsoidfit4','e4'}
            [par, r] = ellipsoidfit4(templab, tempn, colorcenter);
        case {'my_ellipsoidfit_4','my4'}
            [par, r] = my_ellipsoidfit_4(templab, tempn, colorcenter);
        otherwise
            error('Unsupported method: %s', method);
    end

    % metrics (keep as in existing pipeline)
    LCh = [par(1,5), sqrt(par(1,6).^2 + par(1,7).^2), hue_angle_degree(par(1,6), par(1,7))];
    shape = calculate_ellipse_shape(par);  % ??????? ellipsoidfit4 ????
    ellipse_atr = [LCh, shape, r];

    par_all = [par_all; par];
    ellipse_atr_all = [ellipse_atr_all; ellipse_atr];
    labNscore{curr,1} = templab;
    labNscore{curr,2} = tempn;
    labNscore{curr,3} = "asian skin";
    labNscore{curr,4} = sprintf("skin_%d", i);
    curr = curr + 1;

    % plotting
    pre_draw_folder = fullfile(output_folder, 'pre_draw',method);
    if ~exist(pre_draw_folder, 'dir'); mkdir(pre_draw_folder); end
    surface_folder = fullfile(output_folder, 'surface',method);
    if ~exist(surface_folder, 'dir'); mkdir(surface_folder); end

    plot_label = sprintf('%s_skin_%d_', method, i);
    switch lower(string(method))
        case {'my_ellipsoidfit_fixed','fixed'}
            plot_method = 'fixed';
        case {'my_ellipsoidfit_fdqst','fdqst','fd'}
            plot_method = 'fdQst';
        case {'ellipsoidfit4','e4'}
            plot_method = 'ellipsoidfit4';
        case {'my_ellipsoidfit_4','my4'}
            plot_method = 'fixed';
        otherwise
            plot_method = 'fdQst';
    end

    % Contour (Y ???)
    plot_contour_with_scatter3D_methods(par, templab, tempn, pre_draw_folder, plot_label, plot_method);

    % Surface (ab plane by default)
    plot_y_surface_and_scatter3D_methods(par, templab, tempn, plot_method, 'ab');
    exportgraphics(gcf, fullfile(surface_folder, strcat(plot_label, 'ab.jpg')), 'Resolution', 150);
    close(gcf);

    % ??????? La/Lb ??
    % plot_y_surface_and_scatter3D_methods(par, templab, tempn, plot_method, 'La');
    % exportgraphics(gcf, fullfile(surface_folder, strcat(plot_label, 'La.jpg')), 'Resolution', 150);
    % close(gcf);
    % plot_y_surface_and_scatter3D_methods(par, templab, tempn, plot_method, 'Lb');
    % exportgraphics(gcf, fullfile(surface_folder, strcat(plot_label, 'Lb.jpg')), 'Resolution', 150);
    % close(gcf);
end

save(fullfile(fitRes_folder, "asian_skin.mat"), "par", "ellipse_atr_all", "labNscore");

% ---------------- caucasian skin ----------------
par_all = [];
ellipse_atr_all = [];
labNscore2 = {};
curr = 1;

cauc_center = [65.21, 21.43, 23.75];  % preset center used in???
for i = [2 3 4 6 8]
    templab = skinlab((i-1)*49+1:(i-1)*49+49, :);
    tempn   = naturalness1(980+(i-1)*49+1:980+(i-1)*49+49, :);

    % choose center: use preset (????????)
    colorcenter = cauc_center;

    switch lower(method)
        case {'my_ellipsoidfit_fixed','fixed'}
            [par, r] = my_ellipsoidfit_fixed(templab, tempn, colorcenter);
        case {'my_ellipsoidfit_fdqst','fdqst','fd'}
            [par, r] = my_ellipsoidfit_fdQst(templab, tempn, colorcenter);
        case {'ellipsoidfit4','e4'}
            [par, r] = ellipsoidfit4(templab, tempn, colorcenter);
        case {'my_ellipsoidfit_4','my4'}
            [par, r] = my_ellipsoidfit_4(templab, tempn, colorcenter);
        otherwise
            error('Unsupported method: %s', method);
    end

    LCh = [par(1,5), sqrt(par(1,6).^2 + par(1,7).^2), hue_angle_degree(par(1,6), par(1,7))];
    shape = calculate_ellipse_shape(par);
    ellipse_atr = [LCh, shape, r];

    par_all = [par_all; par];
    ellipse_atr_all = [ellipse_atr_all; ellipse_atr];
    labNscore2{curr,1} = templab;
    labNscore2{curr,2} = tempn;
    labNscore2{curr,3} = "caucasian skin";
    labNscore2{curr,4} = sprintf("skin_%d", i);
    curr = curr + 1;

    % plotting
    pre_draw_folder = fullfile(output_folder, 'pre_draw',method);
    if ~exist(pre_draw_folder, 'dir'); mkdir(pre_draw_folder); end
    surface_folder = fullfile(output_folder, 'surface',method);
    if ~exist(surface_folder, 'dir'); mkdir(surface_folder); end

    plot_label = sprintf('%s_skin_%d_', method, i);
    switch lower(string(method))
        case {'my_ellipsoidfit_fixed','fixed'}
            plot_method = 'fixed';
        case {'my_ellipsoidfit_fdqst','fdqst','fd'}
            plot_method = 'fdQst';
        case {'ellipsoidfit4','e4'}
            plot_method = 'ellipsoidfit4';
        case {'my_ellipsoidfit_4','my4'}
            plot_method = 'fixed';
        otherwise
            plot_method = 'fdQst';
    end

    plot_contour_with_scatter3D_methods(par, templab, tempn, pre_draw_folder, plot_label, plot_method);
    plot_y_surface_and_scatter3D_methods(par, templab, tempn, plot_method, 'ab');
    exportgraphics(gcf, fullfile(surface_folder, strcat(plot_label, 'ab.jpg')), 'Resolution', 150);
    close(gcf);
end
save(fullfile(fitRes_folder, "caucasian_skin.mat"), "par", "ellipse_atr_all", "labNscore2");



