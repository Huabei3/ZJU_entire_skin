clc;clear;close all;
addpath("utils\")
%%
data=load('score_percent2.mat');
data1=data.skin_lab;
data2=readmatrix("points49.xlsx");
save_folder1=fullfile("res","score_percent2");
if ~exist(save_folder1,"dir")
    mkdir(save_folder1);
end
save_folder2=fullfile("res","points49");
if ~exist(save_folder2,"dir")
    mkdir(save_folder2);
end
for i_nation=1:4 
    figure(i_nation);hold on;
    data1_temp=data1(:,1+3*(i_nation-1):3+3*(i_nation-1));
    data2_temp=data2(:,1+3*(i_nation-1):3+3*(i_nation-1));
    for i_row=1:49 
        diff=abs(data2_temp-repmat(data1_temp(i_row,:),49,1));
        diff_mean=mean(diff,2);
        [min_val,min_idx]=min(diff_mean);
        idx(i_row,i_nation)=min_idx;
        % text();


    end

    plot_49_points_score_3D(data1_temp, data.score_c(:,i_nation),save_folder1,strcat(num2str(i_nation)));
    plot_49_points_score_3D(data2_temp, data.score_c(:,i_nation),save_folder2,strcat(num2str(i_nation)));
    disp("d")
end


%%
% % 源文件夹路径
% sourceDir = 'D:\work\ZJU_entire_skin\Res\A_images\Summer\rendered_imgs\not_used';
% % 目标文件夹路径
% targetDir = 'D:\work\ZJU_entire_skin\Res\A_images\Summer\rendered_imgs';
% 
% % 创建目标文件夹（如果不存在）
% if ~exist(targetDir, 'dir')
%     mkdir(targetDir);
% end
% 
% % 获取源文件夹中所有PNG文件
% fileList = dir(fullfile(sourceDir, '*.png'));
% 
% % 定义需要处理的文件前缀和对应的新前缀
% prefixMap = containers.Map({'2_', '6_', '8_'}, {'AS', 'SA', 'AF'});
% 
% % 计数器
% filesCopied = 0;
% 
% % 遍历所有文件
% for i = 1:length(fileList)
%     fileName = fileList(i).name;
% 
%     % 检查文件名是否包含指定的前缀
%     for oldPrefix = keys(prefixMap)
%         oldPrefix = oldPrefix{1};  % 从cell中提取字符串
%         newPrefix = prefixMap(oldPrefix);
% 
%         if contains(fileName, oldPrefix)
%             % 构建完整的源文件路径
%             sourceFile = fullfile(sourceDir, fileName);
% 
%             % 创建新文件名：替换前缀
%             newFileName = strrep(fileName, oldPrefix, newPrefix);
% 
%             % 构建完整的目标文件路径
%             targetFile = fullfile(targetDir, newFileName);
% 
%             % 复制文件
% 
%             copyfile(sourceFile, targetFile);
%             fprintf('已复制: %s -> %s\n', fileName, newFileName);
%             filesCopied = filesCopied + 1;
% 
% 
%             % 找到一个匹配的前缀后跳出内层循环
%             break;
%         end
%     end
% end
% 
% fprintf('\n操作完成！共复制了 %d 个文件。\n', filesCopied);
%% make_cherry_ellipse_fits_updated1
% make_cherry_ellipse_fits_updated1.m
% 从 cherry_ellipse_fits_updated.mat 读取 fit_table
% 新增两列：
% 1) 在 model_ethnicity 后插入 model_gender（model_id 以 "_F" 结尾为 "female"，"_M" 结尾为 "male"）
% 2) 在最后追加 other_info（每行为 {}）
% 并保存为 cherry_ellipse_fits_updated1.mat

% clc; clear;
% 
% in_mat = fullfile('D:\','work','ZJU_entire_skin','Cherry','software','skin colour','数据分析','分析过程','resTable','cherry_ellipse_fits_updated.mat');
% out_mat = fullfile('D:\','work','ZJU_entire_skin','Cherry','software','skin colour','数据分析','分析过程','resTable','cherry_ellipse_fits_updated1.mat');
% 
% if ~exist(in_mat, 'file')
%     error('未找到输入文件：%s', in_mat);
% end
% 
% S = load(in_mat);
% if ~isfield(S, 'fit_table') || ~istable(S.fit_table)
%     error('文件中缺少 table 变量 fit_table：%s', in_mat);
% end
% fit_table = S.fit_table;
% 
% % 1) 新增 model_gender（基于 model_id 后缀）
% if ~ismember('model_id', fit_table.Properties.VariableNames)
%     error('fit_table 中缺少列 model_id，无法推断性别。');
% end
% ids = string(fit_table.model_id);
% gender = repmat("unknown", height(fit_table), 1);
% gender(endsWith(ids, "_F")) = "female";
% gender(endsWith(ids, "_M")) = "male";
% 
% % 插入到 model_ethnicity 后面；如果没有该列，则直接追加
% fit_table.model_gender = gender;
% if ismember('model_ethnicity', fit_table.Properties.VariableNames)
%     fit_table = movevars(fit_table, 'model_gender', 'After', 'model_ethnicity');
% end
% 
% % 2) 在最后追加 other_info（每行为空 cell {}）
% fit_table.other_info = repmat({{}}, height(fit_table), 1);
% % 确保在最后（如果前面 movevars 变动导致不在最后，可再次移动）
% fit_table = movevars(fit_table, 'other_info', 'After', fit_table.Properties.VariableNames{end-1});
% 
% save(out_mat, 'fit_table');
% fprintf('已生成：%s\n', out_mat);

%% 更改Table中的一些字段

% Read cherry_ellipse_fits.mat, modify fields, and save updated MAT/XLSX
% - CCT -> 6500
% - illuminance -> 550 (lx)
% - scene -> "inLab"
% - lighting -> "D65"
% - distance_equation (or distance_euqation) -> renamed to D_equation and set to NaN
% - observer_type: o-only -> Oriental; s-only -> South Asian; c-only -> Caucasian
% - opinion_score_range -> "0-1" for all rows

% clc;
% output_folder=fullfile("resTable");
% in_mat  = fullfile(output_folder, 'cherry_ellipse_fits.mat');
% out_mat = fullfile(output_folder, 'cherry_ellipse_fits_updated.mat');
% out_xlsx= fullfile(output_folder, 'cherry_ellipse_fits_updated.xlsx');
% 
% if ~exist(in_mat,'file')
%     error('Input MAT not found: %s', in_mat);
% end
% 
% S = load(in_mat);
% if ~isfield(S,'fit_table')
%     error('Variable fit_table not found in %s', in_mat);
% end
% fit_table = S.fit_table;
% 
% h = height(fit_table);
% 
% % CCT, illuminance
% fit_table.cct = repmat(6500, h, 1);
% fit_table.illuminance = repmat(550, h, 1);  % numeric 550 (lx)
% 
% % scene, lighting
% fit_table.scene    = repmat("inLab", h, 1);
% fit_table.lighting = repmat("D65",   h, 1);
% 
% % distance_equation → D_equation = NaN (numeric), handle both spellings
% vn = fit_table.Properties.VariableNames;
% has_equ  = any(strcmp(vn,'distance_equation'));
% has_euq  = any(strcmp(vn,'distance_euqation'));
% 
% if has_equ
%     fit_table.Properties.VariableNames{strcmp(vn,'distance_equation')} = 'D_equation';
% elseif has_euq
%     fit_table.Properties.VariableNames{strcmp(vn,'distance_euqation')} = 'D_equation';
% else
%     % no old column; create new
%     fit_table.D_equation = NaN(h,1);
% end
% % Force numeric NaN in D_equation
% fit_table.D_equation = NaN(h,1);
% 
% % observer_type mapping
% if ismember('observer_type', fit_table.Properties.VariableNames)
%     obs = string(fit_table.observer_type);
%     obs(obs=="o-only") = "Oriental";
%     obs(obs=="s-only") = "South Asian";
%     obs(obs=="c-only") = "Caucasian";
%     fit_table.observer_type = obs;
% end
% 
% % opinion_score_range -> "0-1"
% if ismember('opinion_score_range', fit_table.Properties.VariableNames)
%     fit_table.opinion_score_range = repmat("0-1", h, 1);
% end
% 
% % Save MAT
% save(out_mat, 'fit_table');
% 
% % Save XLSX (flatten big arrays for Excel)
% excel_table = summarize_for_excel_updated(fit_table);
% writetable(excel_table, out_xlsx, 'FileType','spreadsheet');
% 
% fprintf('Updated table saved:\n  MAT:  %s\n  XLSX: %s\n', out_mat, out_xlsx);
% 
% 
% 
% 
% function T = summarize_for_excel_updated(fit_table)
% % Flatten columns so Excel can handle them; keep new D_equation numeric
% n = height(fit_table);
% lab_n   = zeros(n,1);
% lab_L   = zeros(n,1);
% lab_a   = zeros(n,1);
% lab_b   = zeros(n,1);
% score_n = zeros(n,1);
% score_min = zeros(n,1);
% score_max = zeros(n,1);
% par_len = zeros(n,1);
% 
% for i=1:n
%     % lab_values (cell -> Nx3 double)
%     Lv = fit_table.lab_values{i};
%     if ~isempty(Lv)
%         lab_n(i) = size(Lv,1);
%         lab_L(i) = mean(Lv(:,1));
%         lab_a(i) = mean(Lv(:,2));
%         lab_b(i) = mean(Lv(:,3));
%     else
%         lab_n(i)=0; lab_L(i)=NaN; lab_a(i)=NaN; lab_b(i)=NaN;
%     end
%     % opinion_scores (cell -> Nx1 double)
%     sc = fit_table.opinion_scores{i};
%     if ~isempty(sc)
%         score_n(i)   = numel(sc);
%         score_min(i) = min(sc);
%         score_max(i) = max(sc);
%     else
%         score_n(i)=0; score_min(i)=NaN; score_max(i)=NaN;
%     end
%     % par length
%     pv = fit_table.par{i};
%     if ~isempty(pv)
%         par_len(i) = numel(pv);
%     else
%         par_len(i) = 0;
%     end
% end
% 
% % Build Excel-friendly table
% T = table( ...
%     string(fit_table.source), ...
%     lab_n, lab_L, lab_a, lab_b, ...
%     score_n, score_min, score_max, ...
%     par_len, ...
%     string(fit_table.fit_equation), ...
%     fit_table.lab_center, ...
%     fit_table.average_lab, ...
%     fit_table.cct, ...
%     fit_table.illuminance, ...
%     string(fit_table.scene), ...
%     string(fit_table.lighting), ...
%     fit_table.D_equation, ...  % numeric NaN as required
%     string(fit_table.model_ethnicity), ...
%     string(fit_table.model_id), ...
%     string(fit_table.observer_type), ...
%     string(fit_table.opinion_score_range), ...
%     'VariableNames', { ...
%         'source', ...
%         'lab_count','lab_mean_L','lab_mean_a','lab_mean_b', ...
%         'score_count','score_min','score_max', ...
%         'par_length', ...
%         'fit_equation', ...
%         'lab_center', ...
%         'average_lab', ...
%         'CCT', ...
%         'illuminance', ...
%         'scene', ...
%         'lighting', ...
%         'D_equation', ...
%         'model_ethnicity', ...
%         'model_id', ...
%         'observer_type', ...
%         'opinion_score_range' ...
%     } ...
% );
% end
