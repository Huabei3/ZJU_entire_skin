% make_summer_table
% 读取本目录下 res/*/fitRes/*.mat（由 davidellipse_cat 保存的 African.mat 等），
% 直接用已保存的 par_all 与 labNcore 组装成与 Peggy_VIVO 一致的表结构；
% 导出为 res/resTable/Summer_table.mat 和 .xlsx

clc; clear; close all;

% 数据来源标识（保持后续合并一致）
db_source = "Summer_Haisi";

% 结果根目录（相对当前目录）
res_root = fullfile(pwd, "res");
if ~exist(res_root, 'dir')
    error('未找到结果目录：%s', res_root);
end

% 搜索所有 fitRes/*.mat（如 res/cat/fitRes/African.mat 等）
fitres_files = dir(fullfile(res_root, '**', 'fitRes', '*.mat'));
if isempty(fitres_files)
    error('在 %s 下未找到任何 fitRes/*.mat', res_root);
end

% 5 组光源的名义 CCT（与绘图顺序一致）
ccts = [3000, 4000, 5000, 6500, 8000];

% D 公式说明（保持与 Peggy_VIVO 一致）
D_equation_str = "D=0.9193.*(1-500.1675./CCT);";

% 拟合方程（David 椭圆）
fit_equation_str = "sqrt(k1*(a-a0).^2 + k2*(b-b0).^2 + k3*(a-a0).*(b-b0)) = k4";

% 列初始化（字段名与 Peggy_VIVO 保持一致，位置一致）
col_source              = {};
col_lab_values          = {};
col_opinion_scores      = {};
col_par                 = {};
col_fit_equation        = {};
col_lab_center          = {};
col_average_lab         = {};
col_CCT                 = {};
col_illuminance         = {};
col_scene               = {};
col_lighting            = {};
col_D_equation_str      = {};
col_model_ethnicity     = {};
col_gender              = {};
col_model_id            = {};
col_observer_type       = {};
col_opinion_score_range = {};
col_other_info          = {};

% 遍历每个种族的 fitRes 结果
for kf = 1:numel(fitres_files)
    fpath = fullfile(fitres_files(kf).folder, fitres_files(kf).name);
    S = load(fpath);
    if ~isfield(S, 'labNcore')
        warning('缺少 labNcore：%s，跳过。', fpath);
        continue;
    end

    labNcore = S.labNcore; % cell(n, 2): {lab_group, score_group}
    n = size(labNcore, 1);
    if n == 0
        continue;
    end

    % par_all 可能是“累加形状”（逐 i 追加当前 par 矩阵），取最后 n 行作为对应 5 组光源的参数
    par_rows = nan(n, 6);
    if isfield(S, 'par_all') && ~isempty(S.par_all)
        p = S.par_all;
        if size(p,1) >= n
            par_rows = p(end-n+1:end, 1:min(6, size(p,2)));
            if size(par_rows,2) < 6
                par_rows(:, end+1:6) = NaN;
            end
        else
            % 不足 n 行时尽力对齐
            par_rows(1:size(p,1), 1:min(6,size(p,2))) = p(:,1:min(6,size(p,2)));
        end
    else
        % 无 par_all 时，保留 NaN 占位
        warning('缺少 par_all：%s，par 将用 NaN。', fpath);
    end

    % 从文件名推断种族
    [~, base, ~] = fileparts(fpath);
    bl = lower(base);
    if contains(bl,'african')
        eth = "African";
    elseif contains(bl,'caucasian')
        eth = "Caucasian";
    elseif contains(bl,'oriental')
        eth = "Oriental";
    elseif contains(bl,'south') || contains(bl,'asian')
        eth = "South Asian";
    else
        eth = "Unknown";
    end

    % lighting：记录使用的色适应模型（davidellipse_cat 用 'CAT16'）
    lighting_model = "CAT16";

    % 逐行写入（每行=一个光源）
    for i = 1:n
        lab_vals = labNcore{i,1}; % N×3
        scores   = labNcore{i,2}; % N×1

        % par（不重新拟合，直接取保存的）
        par_vec = par_rows(i, :).';
        % 中心点 / 平均值
        Lmean = mean(lab_vals(:,1), 'omitnan');
        a0 = par_vec(5); b0 = par_vec(6);
        lab_center = [Lmean, a0, b0];
        avg_lab = mean(lab_vals, 1, 'omitnan');

        % CCT 估计（按行序号映射；若超范围则 NaN）
        if i <= numel(ccts)
            CCT = ccts(i);
            scene_str = sprintf('light_%dK', CCT);
        else
            CCT = NaN;
            scene_str = sprintf('light_%d', i);
        end

        % 其他缺省/占位
        gender = "female";
        observer_type = "Chinese";
        % model_id = sprintf('%s_%d', eth, i);
        model_id = eth;

        % 汇总 other_info
        info = struct();
        info.file = fpath;
        info.row  = i;

        row = size(col_source,1) + 1;
        col_source{row,1}              = db_source;
        col_lab_values{row,1}          = lab_vals;
        col_opinion_scores{row,1}      = scores(:);
        col_par{row,1}                 = par_vec;
        col_fit_equation{row,1}        = fit_equation_str;
        col_lab_center{row,1}          = lab_center;
        col_average_lab{row,1}         = avg_lab;
        col_CCT{row,1}                 = CCT;
        col_illuminance{row,1}         = 1000;                  % 无法从 res 恢复，置 NaN
        col_scene{row,1}               = scene_str;
        col_lighting{row,1}            = lighting_model;
        col_D_equation_str{row,1}      = D_equation_str;
        col_model_ethnicity{row,1}     = eth;
        col_gender{row,1}              = gender;
        col_model_id{row,1}            = model_id;
        col_observer_type{row,1}       = observer_type;
        col_opinion_score_range{row,1} = "0~1";
        col_other_info{row,1}          = info;
    end
end

% 生成表（字段顺序与 Peggy_VIVO 保持一致）
fit_table = table( ...
    col_source, col_lab_values, col_opinion_scores, col_par, col_fit_equation, ...
    col_lab_center, col_average_lab, col_CCT, col_illuminance, col_scene, col_lighting, ...
    col_D_equation_str, col_model_ethnicity, col_gender, col_model_id, col_observer_type, ...
    col_opinion_score_range, col_other_info, ...
    'VariableNames', { ...
        'source', 'lab_values', 'opinion_scores', 'par', 'fit_equation', ...
        'lab_center', 'average_lab', 'CCT', 'illuminance', 'scene', 'lighting', ...
        'D_equation_str', 'model_ethnicity', 'gender', 'model_id', 'observer_type', ...
        'opinion_score_range', 'other_info' ...
    } ...
);

% 导出到 res/resTable
out_dir = fullfile(res_root, 'resTable');
if ~exist(out_dir, 'dir'), mkdir(out_dir); end
out_mat  = fullfile(out_dir, 'Summer_table.mat');
out_xlsx = fullfile(out_dir, 'Summer_table.xlsx');

save(out_mat, 'fit_table');

% Excel 摘要（与 Peggy_VIVO 一致）
excel_table = summarize_for_excel_final(fit_table);
writetable(excel_table, out_xlsx, 'FileType', 'spreadsheet');

fprintf('Saved: %s\n', out_mat);
fprintf('Saved: %s\n', out_xlsx);

% ------- Helper（与 Peggy_VIVO 一致的 Excel 摘要） -------
function T = summarize_for_excel_final(fit_table)
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
        if size(Lv,2) >= 3
            lab_L(i) = mean(Lv(:,1),'omitnan');
            lab_a(i) = mean(Lv(:,2),'omitnan');
            lab_b(i) = mean(Lv(:,3),'omitnan');
        else
            lab_L(i) = NaN; lab_a(i)=NaN; lab_b(i)=NaN;
        end
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
    if ~isempty(pv), par_len(i) = numel(pv); else, par_len(i) = 0; end
end
T = table( ...
    string(fit_table.source), ...
    lab_n, lab_L, lab_a, lab_b, ...
    score_n, score_min, score_max, ...
    par_len, ...
    string(fit_table.fit_equation), ...
    fit_table.lab_center, ...
    fit_table.average_lab, ...
    fit_table.CCT, ...
    fit_table.illuminance, ...
    string(fit_table.scene), ...
    string(fit_table.lighting), ...
    string(fit_table.D_equation_str), ...
    string(fit_table.model_ethnicity), ...
    string(fit_table.gender), ...
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
        'D_equation_str', ...
        'model_ethnicity', ...
        'gender', ...
        'model_id', ...
        'observer_type', ...
        'opinion_score_range' ...
    } ...
);
end
