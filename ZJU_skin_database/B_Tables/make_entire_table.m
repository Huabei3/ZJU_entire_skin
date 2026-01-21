% make_entire_table.m
% 从 D:\work\ZJU_entire_skin\Res\B_Tables 读取所有 .mat，
% 自动识别其中的 table，先合并同义字段（cct/CCT、D_equation_str/D_equation、model_gender/gender），
% 再按列名对齐并统一类型后纵向拼接，保存 Entire_Table.mat

clc; clear;close all;
delete('Entire_Table.mat');

base_dir = pwd;
out_mat  = fullfile(base_dir, 'Entire_Table.mat');

if ~exist(base_dir, 'dir')
    error('目录不存在：%s', base_dir);
end

files = dir(fullfile(base_dir, '*.mat'));
if isempty(files)
    error('未找到任何 .mat：%s', base_dir);
end

T = table();  % 总表

% 预期数值列（强制转 double）
numericVars = {'CCT','illuminance'};
% 预期文本列（强制转 string）
textVars = {'source','fit_equation','scene','lighting','D_equation_str', ...
            'model_ethnicity','gender','model_id','observer_type','opinion_score_range'};

for k = 1:numel(files)
    fp = fullfile(files(k).folder, files(k).name);
    S = load(fp);
    % 选出一个 table 变量（优先 fit_table）
    t = [];
    if isfield(S,'fit_table') && istable(S.fit_table)
        t = S.fit_table;
    else
        fns = fieldnames(S);
        for i = 1:numel(fns)
            if istable(S.(fns{i})), t = S.(fns{i}); break; end
        end
    end
    if isempty(t)
        warning('文件未找到 table 变量：%s，跳过。', fp);
        continue;
    end

    % 合并同义字段到规范名
    t = unify_synonyms(t);

    % 先把 t 的列做类型规范化（数值列→double，文本列→string）
    t = normalize_types(t, numericVars, textVars);

    if isempty(T)
        T = t;
        fprintf('载入：%s（行=%d，列=%d）\n', files(k).name, height(t), width(t));
        continue;
    end

    % 对齐列名：互补缺失列，默认值按类型补
    T = add_missing_columns_like(T, t);
    t = add_missing_columns_like(t, T);

    % 再次对齐类型（可能新增的互补列类型不同）
    [T, t] = harmonize_common_var_types(T, t, numericVars, textVars);

    % 列顺序对齐
    t = t(:, T.Properties.VariableNames);

    % 竖拼
    T = [T; t];
    fprintf('拼接：%s（行=%d）\n', files(k).name, height(t));
end

save(out_mat, 'T');
fprintf('已保存总表到：%s（总行=%d，列=%d）\n', out_mat, height(T), width(T));

% ---------------- 同义列归一化 ----------------
function tt = unify_synonyms(tt)
% cct/CCT -> CCT (double)
if ismember('cct', tt.Properties.VariableNames)
    if ~ismember('CCT', tt.Properties.VariableNames)
        tt.CCT = tt.cct;
    else
        % 若 CCT 为空而 cct 有值，用 cct 填充
        C = tt.CCT; c = tt.cct;
        try
            mask = ismissing(C) | (isnumeric(C) & isnan(C));
        catch
            mask = false(height(tt),1);
        end
        try
            C(mask) = c(mask);
        catch
            % 类型不兼容时稍后 normalize_types 会处理
        end
        tt.CCT = C;
    end
    tt.cct = []; % 删除别名列
end

% D_equation_str / D_equation -> D_equation_str (string)
hasStr = ismember('D_equation_str', tt.Properties.VariableNames);
hasNum = ismember('D_equation', tt.Properties.VariableNames);
if ~hasStr && hasNum
    % 只有数值列：转字符串列
    tt.D_equation_str = to_string_col(tt.D_equation);
    tt.D_equation = [];
elseif hasStr && hasNum
    % 两者都在：优先保留 D_equation_str，若为空则用数值填充
    s = to_string_col(tt.D_equation_str);
    n = to_string_col(tt.D_equation);
    s(ismissing(s) | s=="") = n(ismissing(s) | s=="");
    tt.D_equation_str = s;
    tt.D_equation = [];
end

% model_gender / gender -> gender (string)
hasMG = ismember('model_gender', tt.Properties.VariableNames);
hasG  = ismember('gender', tt.Properties.VariableNames);
if ~hasG && hasMG
    tt.gender = to_string_col(tt.model_gender);
    tt.model_gender = [];
elseif hasG && hasMG
    g  = to_string_col(tt.gender);
    mg = to_string_col(tt.model_gender);
    g(ismissing(g) | g=="") = mg(ismissing(g) | g=="");
    tt.gender = g;
    tt.model_gender = [];
end
end

% ---------------- 类型规范化 ----------------
function tt = normalize_types(tt, numericVars, textVars)
% 数值列统一 double
for i = 1:numel(numericVars)
    v = numericVars{i};
    if ismember(v, tt.Properties.VariableNames)
        col = tt.(v);
        tt.(v) = to_double_col(col);
    end
end
% 文本列统一 string
for i = 1:numel(textVars)
    v = textVars{i};
    if ismember(v, tt.Properties.VariableNames)
        col = tt.(v);
        tt.(v) = to_string_col(col);
    end
end
end

function d = to_double_col(x)
if isnumeric(x)
    d = double(x);
elseif islogical(x)
    d = double(x);
elseif iscell(x)
    n = numel(x); d = nan(n,1);
    for ii = 1:n
        xi = x{ii};
        if isempty(xi)
            d(ii) = NaN;
        elseif isnumeric(xi) && isscalar(xi)
            d(ii) = double(xi);
        elseif isstring(xi) || ischar(xi)
            y = str2double(string(xi));
            d(ii) = y;
        else
            d(ii) = NaN;
        end
    end
elseif isstring(x) || ischar(x)
    d = str2double(string(x));
else
    d = nan(height_if_tablevar(x),1);
end
end

function s = to_string_col(x)
if isstring(x)
    s = x;
elseif ischar(x)
    s = string(x);
elseif iscell(x)
    try
        s = string(x);
    catch
        n = numel(x);
        s = strings(n,1);
        for ii = 1:n
            try, s(ii) = string(x{ii}); catch, s(ii) = ""; end
        end
    end
else
    try
        s = string(x);
    catch
        s = strings(height_if_tablevar(x),1);
    end
end
end

function n = height_if_tablevar(x)
try
    n = size(x,1);
catch
    n = numel(x);
end
end

% ---------------- 列对齐与占位 ----------------
function A = add_missing_columns_like(A, B)
missing = setdiff(B.Properties.VariableNames, A.Properties.VariableNames);
for i = 1:numel(missing)
    vn = missing{i};
    A.(vn) = default_missing_like(B.(vn), height(A));
end
end

function col = default_missing_like(sampleVar, n)
switch class(sampleVar)
    case {'double','single'}
        col = nan(n,1);
    case {'logical'}
        col = false(n,1);
    case {'char'}
        col = repmat({''}, n, 1);
    case {'string'}
        col = strings(n,1);
    case {'cell'}
        col = cell(n,1);
    case {'datetime'}
        col = NaT(n,1);
    case {'duration'}
        col = seconds(nan(n,1));
    case {'categorical'}
        col = categorical(repmat("", n, 1));
    otherwise
        if isnumeric(sampleVar)
            col = nan(n,1);
        else
            col = cell(n,1);
        end
end
end

function [A,B] = harmonize_common_var_types(A,B,numericVars,textVars)
common = intersect(A.Properties.VariableNames, B.Properties.VariableNames);
for i = 1:numel(common)
    vn = common{i};
    a = A.(vn); b = B.(vn);
    if ismember(vn, numericVars)
        A.(vn) = to_double_col(a);
        B.(vn) = to_double_col(b);
        continue;
    end
    if ismember(vn, textVars)
        A.(vn) = to_string_col(a);
        B.(vn) = to_string_col(b);
        continue;
    end
    if iscell(a) && all(cellfun(@(x) isempty(x) || (isnumeric(x)&&isscalar(x)), a))
        A.(vn) = to_double_col(a);
        a = A.(vn);
    end
    if iscell(b) && all(cellfun(@(x) isempty(x) || (isnumeric(x)&&isscalar(x)), b))
        B.(vn) = to_double_col(b);
        b = B.(vn);
    end
    if ~strcmp(class(A.(vn)), class(B.(vn)))
        if isnumeric(A.(vn)), A.(vn) = num2cell(A.(vn)); end
        if isnumeric(B.(vn)), B.(vn) = num2cell(B.(vn)); end
    end
end
end
