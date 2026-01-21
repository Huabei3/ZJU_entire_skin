% plot_cherry_ellipse.m
% Robust plot + dataset export (integrated final formatting)
% - Reads score_percent.mat (score_o/s/c, skin_lab)
% - Fits a*-b* ellipses via ellipsoidfit2 for multiple observer modes
% - Draws y=0.5 contour for each group (weighted mode)
% - Builds Table with required fields and directly saves .mat and .xlsx
%
% Output formatting integrated per request:
%   cct=6500; illuminance=550; scene="inLab"; lighting="D65";
%   distance_equation -> D_equation (numeric NaN); observer_type mapped to
%   Oriental/South Asian/Caucasian; opinion_score_range="0-1" for all rows.

clc; close all;
addpath("utils\");

% Locate score_percent.mat (prefer current '分析过程', fallback '分析结果/分析过程')
score_file = locate_score_percent();
if isempty(score_file)
    error('score_percent.mat not found. Put it in current folder or 分析结果/分析过程.');
end

% Load and validate data
S = load(score_file);  % Expected: score_o, score_s, score_c, skin_lab
required = {'score_o','score_s','score_c','skin_lab'};
for k = 1:numel(required)
    if ~isfield(S, required{k})
        error('Missing variable %s in %s', required{k}, score_file);
    end
end
score_o  = S.score_o;   % 49×12
score_s  = S.score_s;   % 49×12
score_c  = S.score_c;   % 49×12
skin_lab = S.skin_lab;  % 49×36 (12 groups × 3 columns [L a b])

% Group count and labels (12 groups). Adjust order if needed.
num_groups = size(skin_lab, 2) / 3;
if any([size(score_o,2), size(score_s,2), size(score_c,2)] ~= num_groups)
    error('Group count mismatch: skin_lab vs score_* in %s', score_file);
end

% Inferred labels from 原始数据 Excel image names (update if your order differs)
group_labels = {'BK_F','BK_M','BR_F','BR_M','CY_F','CY_M','GU_F','GU_M','YO_F','YO_M','YY_F','YY_M'};
if num_groups ~= numel(group_labels)
    group_labels = arrayfun(@(i) sprintf('Group-%02d', i), 1:num_groups, 'UniformOutput', false);
    warning('Using generic group labels; please update group_labels to real order.');
end

% Observer zscore modes
observer_modes = { ...
    struct('name','weighted(o:30,s:30,c:31)','type','weighted','w',[30 30 31]), ...
    struct('name','o-only','type','o','w',[1 0 0]), ...
    struct('name','s-only','type','s','w',[0 1 0]), ...
    struct('name','c-only','type','c','w',[0 0 1]) ...
};

% Plot AB-plane (weighted contours only, to reduce clutter)
figure('Name','AB-plane Ellipse Fits','Color','w'); hold on; axis equal;
xlabel('a*'); ylabel('b*'); title('AB-plane: y=0.5 contour (ellipsoidfit2)');
grid on; box on;
colors = lines(num_groups);

% Prepare table columns
col_source               = {};
col_lab_values           = {};
col_opinion_scores       = {};
col_par                  = {};
col_fit_equation         = {};
col_lab_center           = {};
col_average_lab          = {};
col_cct                  = {};
col_illuminance          = {};
col_scene                = {};
col_lighting             = {};
col_distance_equation    = {};
col_model_ethnicity      = {};
col_model_id             = {};
col_observer_type        = {};
col_opinion_score_range  = {};

% Model strings
fit_equation_str      = 'y = 1./(1 + k6*exp(sqrt(k1*(a-a0).^2 + k2*(b-b0).^2 + k3*(a-a0).*(b-b0))))';
distance_equation_str = 'Q(a,b) = k1*(a-a0)^2 + k2*(b-b0)^2 + k3*(a-a0)*(b-b0)';

level_y = 0.5;

for i = 1:num_groups
    % LAB for group i (49×3)
    cielab = skin_lab(:, (i-1)*3 + (1:3));
    ab     = cielab(:, 2:3);
    avgLab = mean(cielab, 1);

    label = group_labels{i};
    ethnicity = ethnicity_from_label(label);

    plotted_weighted = false;

    for m = 1:numel(observer_modes)
        mode = observer_modes{m};

        % Build zscore by mode
        switch mode.type
            case 'weighted'
                w = mode.w;  % [30 30 31]
                zscore = (w(1)*score_o(:,i) + w(2)*score_s(:,i) + w(3)*score_c(:,i)) / sum(w);
            case 'o'
                zscore = score_o(:,i);
            case 's'
                zscore = score_s(:,i);
            case 'c'
                zscore = score_c(:,i);
            otherwise
                error('Unknown observer mode: %s', mode.type);
        end

        % Fit (2D): ellipsoidfit2 on a*,b*
        try
            [par, ~, ~] = ellipsoidfit2(ab, zscore);
        catch ME
            warning('Fit failed: group=%s, mode=%s: %s', label, mode.name, ME.message);
            continue;
        end

        % Draw y=0.5 contour once (weighted only)
        if ~plotted_weighted && strcmp(mode.type,'weighted')
            try
                [a_,b_,c_,d_,e_,f_] = ab_levelset_conic(par, level_y);
                draw_conic_ellipse(a_,b_,c_,d_,e_,f_, colors(i,:), 1.8);
                plot(par(4), par(5), 'o', 'Color', colors(i,:), 'MarkerFaceColor', colors(i,:), 'MarkerSize', 4);
                text(par(4), par(5), ['  ' label], 'Color', colors(i,:), 'FontSize', 9, 'HorizontalAlignment','left');
                plotted_weighted = true;
            catch ME
                warning('Contour draw failed: group=%s, mode=%s: %s', label, mode.name, ME.message);
            end
        end

        % Append row
        row = size(col_source,1) + 1;
        col_source{row,1}               = score_file;
        col_lab_values{row,1}           = cielab;                 % Nx3
        col_opinion_scores{row,1}       = zscore;                 % Nx1
        col_par{row,1}                  = par(:);                 % K×1
        col_fit_equation{row,1}         = fit_equation_str;
        col_lab_center{row,1}           = [avgLab(1), par(4), par(5)]; % [mean(L*), a0, b0]
        col_average_lab{row,1}          = avgLab;
        col_cct{row,1}                  = NaN;
        col_illuminance{row,1}          = NaN;
        col_scene{row,1}                = "unknown";
        col_lighting{row,1}             = "unknown";
        col_distance_equation{row,1}    = distance_equation_str;
        col_model_ethnicity{row,1}      = ethnicity;
        col_model_id{row,1}             = label;
        col_observer_type{row,1}        = string(mode.name);
        col_opinion_score_range{row,1}  = sprintf('%.3g~%.3g', min(zscore), max(zscore));
    end
end

% Build table
fit_table = table( ...
    col_source, col_lab_values, col_opinion_scores, col_par, col_fit_equation, ...
    col_lab_center, col_average_lab, col_cct, col_illuminance, col_scene, col_lighting, ...
    col_distance_equation, col_model_ethnicity, col_model_id, col_observer_type, col_opinion_score_range, ...
    'VariableNames', { ...
        'source', 'lab_values', 'opinion_scores', 'par', 'fit_equation', ...
        'lab_center', 'average_lab', 'cct', 'illuminance', 'scene', 'lighting', ...
        'distance_equation', 'model_ethnicity', 'model_id', 'observer_type', 'opinion_score_range' ...
    } ...
);

% Apply the final formatting (integrated "postprocess")
h = height(fit_table);
fit_table.cct          = repmat(6500, h, 1);
fit_table.illuminance  = repmat(550,  h, 1);
fit_table.scene        = repmat("inLab", h, 1);
fit_table.lighting     = repmat("D65",   h, 1);

% Rename distance_equation -> D_equation and set to NaN
vn = fit_table.Properties.VariableNames;
has_equ = any(strcmp(vn,'distance_equation'));
if has_equ
    fit_table.Properties.VariableNames{strcmp(vn,'distance_equation')} = 'D_equation';
else
    fit_table.D_equation = NaN(h,1);
end
fit_table.D_equation = NaN(h,1);

% Map observer_type
obs = string(fit_table.observer_type);
obs(obs=="o-only") = "Oriental";
obs(obs=="s-only") = "South Asian";
obs(obs=="c-only") = "Caucasian";
fit_table.observer_type = obs;

% opinion_score_range -> "0-1"
fit_table.opinion_score_range = repmat("0-1", h, 1);

% Prepare output folder and save
output_folder = fullfile("resTable");  % as per your path tweak
if ~exist(output_folder, 'dir'), mkdir(output_folder); end
out_mat  = fullfile(output_folder, 'cherry_ellipse_fits.mat');
out_xlsx = fullfile(output_folder, 'cherry_ellipse_fits.xlsx');

save(out_mat, 'fit_table');

% Export Excel (flatten arrays)
excel_table = summarize_for_excel_final(fit_table);
writetable(excel_table, out_xlsx, 'FileType', 'spreadsheet');

% ----------------- Helpers -----------------
function fp = locate_score_percent()
cands = {
    fullfile(pwd, 'score_percent.mat'), ...
    fullfile(fileparts(pwd), '分析结果', '分析过程', 'score_percent.mat'), ...
    fullfile(pwd, '..', '分析结果', '分析过程', 'score_percent.mat') ...
};
fp = '';
for i = 1:numel(cands)
    if exist(cands{i}, 'file')
        fp = cands{i};
        return;
    end
end
end

function [a_,b_,c_,d_,e_,f_] = ab_levelset_conic(par, level_y)
% par = [k1,k2,k3,a0,b0,k6] from ellipsoidfit2; y = 1/(1 + a6*exp(sqrt(Q)))
% Q = k1*(x-a0)^2 + k2*(y-b0)^2 + k3*(x-a0)*(y-b0); Q0 = [log((1/y - 1)/a6)]^2
k1 = par(1); k2 = par(2); k3 = par(3);
x0 = par(4); y0 = par(5); a6 = par(6);
arg = (1/level_y - 1) / a6;
if ~(isfinite(arg) && arg > 0)
    warning('Non-positive/invalid log arg for contour; using eps. a6=%.4g level=%.3g', a6, level_y);
    arg = eps;
end
Q0 = (log(arg))^2;
a_ = k1; b_ = k3; c_ = k2;
d_ = -2*k1*x0 - k3*y0;
e_ = -2*k2*y0 - k3*x0;
const = k1*x0^2 + k2*y0^2 + k3*x0*y0;
f_ = const - Q0;
if (b_^2 - 4*a_*c_) >= 0
    warning('Contour not strictly elliptical (b^2-4ac >= 0).');
end
end

function h = draw_conic_ellipse(a_,b_,c_,d_,e_,f_, color, lw)
% ellipsefig1 expects ax^2 + bxy + cy^2 + dx + ey = f_rhs
f_rhs = -f_;
[~,~,h] = ellipsefig1(a_, b_, c_, d_, e_, f_rhs);
if isgraphics(h)
    try
        set(h, 'Color', color, 'LineWidth', lw);
    catch
        for k = 1:numel(h)
            if isgraphics(h(k)), set(h(k), 'Color', color, 'LineWidth', lw); end
        end
    end
end
end


function T = summarize_for_excel_final(fit_table)
% Flatten arrays to Excel-friendly summaries; includes D_equation numeric
n = height(fit_table);
lab_n   = zeros(n,1);
lab_L   = zeros(n,1);
lab_a   = zeros(n,1);
lab_b   = zeros(n,1);
score_n = zeros(n,1);
score_min = zeros(n,1);
score_max = zeros(n,1);
par_len = zeros(n,1);
for i=1:n
    Lv = fit_table.lab_values{i};
    if ~isempty(Lv)
        lab_n(i) = size(Lv,1);
        lab_L(i) = mean(Lv(:,1));
        lab_a(i) = mean(Lv(:,2));
        lab_b(i) = mean(Lv(:,3));
    else
        lab_n(i)=0; lab_L(i)=NaN; lab_a(i)=NaN; lab_b(i)=NaN;
    end
    sc = fit_table.opinion_scores{i};
    if ~isempty(sc)
        score_n(i)   = numel(sc);
        score_min(i) = min(sc);
        score_max(i) = max(sc);
    else
        score_n(i)=0; score_min(i)=NaN; score_max(i)=NaN;
    end
    pv = fit_table.par{i};
    if ~isempty(pv)
        par_len(i) = numel(pv);
    else
        par_len(i) = 0;
    end
end
T = table( ...
    string(fit_table.source), ...
    lab_n, lab_L, lab_a, lab_b, ...
    score_n, score_min, score_max, ...
    par_len, ...
    string(fit_table.fit_equation), ...
    fit_table.lab_center, ...
    fit_table.average_lab, ...
    fit_table.cct, ...
    fit_table.illuminance, ...
    string(fit_table.scene), ...
    string(fit_table.lighting), ...
    fit_table.D_equation, ...
    string(fit_table.model_ethnicity), ...
    string(fit_table.model_id), ...
    string(fit_table.observer_type), ...
    string(fit_table.opinion_score_range), ...
    'VariableNames', { ...
        'source', ...
        'lab_count','lab_mean_L','lab_mean_a','lab_mean_b', ...
        'score_count','score_min','score_max', ...
        'par_length', ...
        'fit_equation', ...
        'lab_center', ...
        'average_lab', ...
        'CCT', ...
        'illuminance', ...
        'scene', ...
        'lighting', ...
        'D_equation', ...
        'model_ethnicity', ...
        'model_id', ...
        'observer_type', ...
        'opinion_score_range' ...
    } ...
);
end
