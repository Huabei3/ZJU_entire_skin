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
addpath("utils\")
% Locate score_percent.mat (prefer current '分析过程', fallback '分析结果/分析过程')
score_file = 'score_percent.mat';

% Load and validate data
S = load(score_file);  % Expected: score_o, score_s, score_c, skin_lab
required = {'score_o','score_s','score_c','skin_lab'};

score_o  = S.score_o;   % 49×12
score_s  = S.score_s;   % 49×12
score_c  = S.score_c;   % 49×12
skin_lab = S.skin_lab;  % 49×36 (12 groups × 3 columns [L a b])


% Inferred labels from 原始数据 Excel image names (update if your order differs)
label_type="model";
% label_type="nation";
if strcmp(label_type,"model")
    group_labels = {'BK_F','BK_M','BR_F','BR_M','YY_F','YY_M','GU_F','GU_M','YO_F','YO_M'};
    label_cols{1}=1;
    label_cols{2}=2;
    label_cols{3}=3;
    label_cols{4}=4;
    label_cols{5}=[5,11];
    label_cols{6}=[6,12];
    label_cols{7}=7;
    label_cols{8}=8;
    label_cols{9}=9;
    label_cols{10}=10;
elseif strcmp(label_type,"nation")
    group_labels={"BK","BR","YY","GU","YO"};
    label_cols{1}=[1:2];
    label_cols{2}=[3:4];
    label_cols{3}=[5,6,11,12];
    label_cols{4}=[7:8];
    label_cols{5}=[9:10];
end
num_groups = length(group_labels);
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

for m = 1:numel(observer_modes)
    mode = observer_modes{m};
    par_all=[];r_all=[];

    for i = 1:num_groups
        % Build zscore by mode
        idx_models=label_cols{i};

        switch mode.type
            case 'weighted'
                w = mode.w;  % [30 30 31]
                score_wei=(w(1)*score_o + w(2)*score_s + w(3)*score_c) / sum(w);
                zscore = score_wei(:,idx_models);
            case 'o'
                zscore = score_o(:,idx_models);
            case 's'
                zscore = score_s(:,idx_models);
            case 'c'
                zscore = score_c(:,idx_models);
            otherwise
                error('Unknown observer mode: %s', mode.type);
        end
        zscore=mean(zscore,2);
         
        
    
        % LAB for group i (49×3)
        cielab=zeros(size(skin_lab,1),3);
        for i_model=idx_models
            cielab = cielab+skin_lab(:, (i_model-1)*3 + (1:3));
        end
        cielab=cielab/length(idx_models);

    
        label = group_labels{i};
        ethnicity = ethnicity_from_label(label);
    
        plotted_weighted = false;

        % Fit (2D): ellipsoidfit2 on a*,b*
        [par, r,y] = ellipsoidfit3_1(cielab, zscore);
        par_all=[par_all;par];
        r_all=[r_all;r];
        picname_check{i,1}=label;
        picname_check{i,2}=idx_models;

        labNscore_folder=fullfile("res",label_type,mode.type,"labNscore");
        if ~exist(labNscore_folder,"dir")
            mkdir(labNscore_folder);
        end
        save(fullfile(labNscore_folder,sprintf("%02d%s.mat",i,label)), ...
            "cielab","zscore","par","r");
        pre_draw_folder=fullfile("res",label_type,mode.type,"pre_draw");
        if ~exist(pre_draw_folder,"dir")
            mkdir(pre_draw_folder);
        end
        plot_contour_with_scatter3D(par, cielab, zscore, ...
            pre_draw_folder,sprintf("%02d%s.mat",i,label));
        disp("d")


    end
    fitRes_folder=fullfile("res",label_type,mode.type,"fitRes");
    if ~exist(fitRes_folder,"dir")
        mkdir(fitRes_folder);
    end
    save(fullfile(fitRes_folder,"ellipPara.mat"),"par_all","r_all","picname_check");
end

