% main2_separate2.m
% Loop both asian skin and caucasian skin; reuse code; colorcenter uses par_mean for both.

clear; clc;
load naturalness1;
load skylab;
load skinlab;
load grasslab;
addpath("utils\")

% Choose method here
method = 'ellipsoidfit4';  % 'my_ellipsoidfit_fixed' | 'my_ellipsoidfit_fdQst' | 'ellipsoidfit4' | 'my_ellipsoidfit_4'

output_folder = fullfile("res\separate_skin_methods");
if ~exist(output_folder, "dir"); mkdir(output_folder); end
fitRes_folder = fullfile(output_folder, "fitRes",method);
if ~exist(fitRes_folder, "dir"); mkdir(fitRes_folder); end

% Define groups and indices
groups = {
    struct('name','asian skin','idx',[1 5 7 9 10]), ...
    struct('name','caucasian skin','idx',[2 3 4 6 8])
};

for g = 1:numel(groups)
    gname = groups{g}.name;
    idxes = groups{g}.idx;

    par_all = [];
    ellipse_atr_all = [];
    labNscore = {};
    curr = 1;

    for ii = 1:numel(idxes)
        i = idxes(ii);
        templab = skinlab((i-1)*49+1:(i-1)*49+49, :);
        tempn   = naturalness1(980+(i-1)*49+1:980+(i-1)*49+49, :);

        % center from data
        [par_mean, ~] = calculate_weighted_or_simple_mean(tempn, templab);
        colorcenter = par_mean;  % use mean center for both groups

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

        % metrics
        LCh = [par(1,5), sqrt(par(1,6).^2 + par(1,7).^2), hue_angle_degree(par(1,6), par(1,7))];
        shape = calculate_ellipse_shape(par);
        ellipse_atr = [LCh, shape, r];

        par_all = [par_all; par];
        ellipse_atr_all = [ellipse_atr_all; ellipse_atr];
        labNscore{curr,1} = templab;
        labNscore{curr,2} = tempn;
        labNscore{curr,3} = gname;
        labNscore{curr,4} = sprintf('skin_%d', i);
        curr = curr + 1;

        % plotting
        pre_draw_folder = fullfile(output_folder, 'pre_draw');
        if ~exist(pre_draw_folder, 'dir'); mkdir(pre_draw_folder); end
        surface_folder = fullfile(output_folder, 'surface');
        if ~exist(surface_folder, 'dir'); mkdir(surface_folder); end

        plot_label = sprintf('%s_%s_skin_%d_', method, strrep(gname,' ','_'), i);
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

    % save per group
    outname = sprintf('%s.mat', strrep(gname,' ','_'));
    save(fullfile(fitRes_folder, outname), 'par', "par_all",'ellipse_atr_all', 'labNscore');
end
