% make_skin_table (script, not function)
% - Load saved fitRes from res/separate_skin/fitRes/{asian_skin.mat,caucasian_skin.mat}
% - Build a table without re-fitting
% - Export: res/separate_skin/resTable/Skin_table.mat/.xlsx

clc; clear; close all;

% I/O
src_folder = fullfile("res","separate_skin","fitRes");
asian_file = fullfile(src_folder,"asian_skin.mat");
cauc_file  = fullfile(src_folder,"caucasian_skin.mat");
skin_file=fullfile("res\fitRes")
output_folder = fullfile("res","separate_skin","resTable");
if ~exist(output_folder,"dir"), mkdir(output_folder); end
out_mat  = fullfile(output_folder, "Skin_table.mat");
out_xlsx = fullfile(output_folder, "Skin_table.xlsx");

% Constants
fit_equation_str = "y = 1./(1+exp(p(1)*sqrt((L-p(5)).^2 + p(2)*(a-p(6)).^2 + p(3)*(b-p(7)).^2 + p(4)*(a-p(6)).*(b-p(7))) - p(8)));";
D_equation_str   = "no CAT";

% Columns (as a struct for easy pass/return)
cols.source               = {};
cols.lab_values           = {};
cols.opinion_scores       = {};
cols.par                  = {};
cols.fit_equation         = {};
cols.lab_center           = {};
cols.average_lab          = {};
cols.cct                  = {};
cols.illuminance          = {};
cols.scene                = {};
cols.lighting             = {};
cols.D_equation_str       = {};
cols.model_ethnicity      = {};
cols.gender               = {};
cols.model_id             = {};
cols.observer_type        = {};
cols.opinion_score_range  = {};
cols.other_info           = {};

% Load and append rows
if exist(asian_file,"file")
    Sa = load(asian_file);
    cols = append_from_file(Sa, "Asian", cols, fit_equation_str, D_equation_str);
else
    warning("Missing file: %s", asian_file);
end

if exist(cauc_file,"file")
    Sc = load(cauc_file);
    cols = append_from_file(Sc, "Caucasian", cols, fit_equation_str, D_equation_str);
else
    warning("Missing file: %s", cauc_file);
end

% Build table
fit_table = table( ...
    cols.source, cols.lab_values, cols.opinion_scores, cols.par, cols.fit_equation, ...
    cols.lab_center, cols.average_lab, cols.cct, cols.illuminance, cols.scene, cols.lighting, ...
    cols.D_equation_str, cols.model_ethnicity, cols.gender, cols.model_id, cols.observer_type, ...
    cols.opinion_score_range, cols.other_info, ...
    'VariableNames', { ...
        'source','lab_values','opinion_scores','par','fit_equation', ...
        'lab_center','average_lab','CCT','illuminance','scene','lighting', ...
        'D_equation_str','model_ethnicity','gender','model_id','observer_type', ...
        'opinion_score_range','other_info' ...
    } ...
);

% Export
save(out_mat, 'fit_table');
excel_table = summarize_for_excel_final(fit_table);
writetable(excel_table, out_xlsx, 'FileType', 'spreadsheet');
fprintf('Saved: %s\n', out_mat);
fprintf('Saved: %s\n', out_xlsx);

% -------- local functions (must be at end of the script) --------
function cols = append_from_file(S, default_ethnicity, cols, fit_equation_str, D_equation_str)
    % Expect in S:
    %   labNscore{r,1}=templab(Nx3), {r,2}=tempn(Nx1), {r,3}="asian skin"/"caucasian skin", {r,4}="skin_%d"
    %   par_all (optional): r x 8
    %   par     (optional): 1 x 8 or r x 8
    n_rows = size(S.labNscore,1);
    if n_rows==0, return; end

    % Per-row par
    if isfield(S,'par_all') && ~isempty(S.par_all)
        par_rows = S.par_all;
    elseif isfield(S,'par') && ~isempty(S.par)
        if size(S.par,1)==1
            par_rows = repmat(S.par, n_rows, 1);
            warning('Using single par replicated to %d rows (no par_all in file).', n_rows);
        else
            par_rows = S.par;
        end
    else
        par_rows = nan(n_rows,8);
        warning('No par/par_all found; filling NaNs.');
    end

    % Ethnicity map
    function e = map_eth(s)
        s = string(s);
        if contains(lower(s),"asian"), e="Asian";
        elseif contains(lower(s),"caucasian"), e="Caucasian";
        else, e = string(default_ethnicity);
        end
    end

    for r = 1:n_rows
        labs = S.labNscore{r,1};   % Nx3
        sc   = S.labNscore{r,2};   % Nx1
        tag3 = S.labNscore{r,3};   % 'asian skin' / 'caucasian skin'
        tag4 = S.labNscore{r,4};   % 'skin_%d'
        p    = par_rows(r,:);

        % lab_center = [mean(L*), a0, b0]
        if ~isempty(labs)
            avg_lab=labs(1,:);
        else
            Lmean = NaN;
            avg_lab = [NaN NaN NaN];
        end
        a0 = NaN; b0 = NaN;
        if numel(p) >= 7
            a0 = p(6); b0 = p(7);
        end

        % gender by last digit in 'skin_%d'
        if isstring(tag4), t4 = char(tag4); else, t4 = tag4; end
        d = str2double(t4(end));
        if ismember(d,[5 10])
            gender="male";
        elseif ismember(d,[2 6])
            gender="infant";
        else
            gender="female";
        end

        row = numel(cols.source) + 1;

        cols.source{row,1}              = "David";
        cols.lab_values{row,1}          = labs;
        cols.opinion_scores{row,1}      = sc;
        cols.par{row,1}                 = p;
        cols.fit_equation{row,1}        = fit_equation_str;
        cols.lab_center{row,1}          = [Lmean, a0, b0];
        cols.average_lab{row,1}         = avg_lab;
        cols.cct{row,1}                 = 5000;
        cols.illuminance{row,1}         = 500;
        cols.scene{row,1}               = string(tag3) + " " + string(tag4);
        cols.lighting{row,1}            = "D50";
        cols.D_equation_str{row,1}      = D_equation_str;
        cols.model_ethnicity{row,1}     = map_eth(tag3);
        cols.gender{row,1}              = gender;
        cols.model_id{row,1}            = string(tag4);
        cols.observer_type{row,1}       = "unknown";
        cols.opinion_score_range{row,1} = "0~1";

        if isfield(S,'ellipse_atr_all') && size(S.ellipse_atr_all,1)>=r
            cols.other_info{row,1} = S.ellipse_atr_all(r,:);
        else
            cols.other_info{row,1} = [];
        end
    end
end

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
    for i=1,n
        Lv = fit_table.lab_values{i};
        if ~isempty(Lv)
            lab_n(i) = size(Lv,1);
            lab_L(i) = mean(Lv(:,1),'omitnan');
            lab_a(i) = mean(Lv(:,2),'omitnan');
            lab_b(i) = mean(Lv(:,3),'omitnan');
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
            'model_id', ...
            'observer_type', ...
            'opinion_score_range' ...
        } ...
    );
end
