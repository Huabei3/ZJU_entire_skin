
% 稳健版 plot_ellipse（完全自包含，避免原脚本未定义变量 z/g/gg 等导致报错）
% 任务：
%   - 基于 score_percent.mat 中的 score_o/s/c 与 skin_lab，
%     对每个“目标组”（skin_lab 的 12 组，每组 L,a,b 三列）在 a*-b* 平面拟合椭圆（取拟合函数 y 的等值线 y=0.5）。
%   - 使用本项目中的 ellipsoidfit2.m（二维）做拟合；将 y=0.5 转换为二次曲线一般式，交给 ellipsefig1.m 绘制。
%
% 数据来源（确证）：
%   - score_percent.mat（本工程已有，字段：score_o, score_s, score_c, skin_lab）
%     • score_o/score_s/score_c：49×12，分别对应 Oriental / South Asian(Brown) / Caucasian 观察者对 12 组目标的打分
%     • skin_lab：49×36，每 3 列为一组目标的 L,a,b（共 12 组）
%   - 依赖函数（本目录已有）：ellipsoidfit2.m, ellipsefig1.m
%
% 推测/假设（在代码中明确标出便于替换）：
%   - 12 组目标（skin_lab 的 12 组）真实标签顺序在仓库中未见明确标注，此处以占位标签标注，可按你掌握的真实顺序替换。
%   - 椭圆等值线选 y=0.5（可调），按 ellipsoidfit2 的函数形式 y = 1/(1 + a6*exp(sqrt(Q))) 推导 Q0：
%       1/y - 1 = a6*exp(sqrt(Q)) => sqrt(Q) = log((1/y - 1)/a6) => Q = [log((1/y - 1)/a6)]^2
%     若 a6<=0 或对数参数≤0，则以 eps 兜底并警告（这属于数据/拟合的边界情况）。

clc; close all;clear;
%%
% 1) 尝试定位 score_percent.mat（优先当前“分析过程”，其次“分析结果/分析过程”）
score_file = locate_score_percent();
if isempty(score_file)
    error('未找到 score_percent.mat，请在“分析过程”或“分析结果/分析过程”目录下确认该文件存在。');
end

% 2) 载入并校验字段
S = load(score_file);  % 预期：score_o, score_s, score_c, skin_lab
required = {'score_o','score_s','score_c','skin_lab'};
for k = 1:numel(required)
    if ~isfield(S, required{k})
        error('数据文件缺少变量 %s（应包含 score_o/score_s/score_c/skin_lab）', required{k});
    end
end
score_o  = S.score_o;   % 49×12（东方观察者）
score_s  = S.score_s;   % 49×12（南亚观察者）
score_c  = S.score_c;   % 49×12（高加索观察者）
skin_lab = S.skin_lab;  % 49×36（12 组 × 每组3列[L,a,b]）

% 3) 组数与标签（占位推测；请按真实顺序替换）
num_groups = size(skin_lab, 2) / 3;
if any([size(score_o,2), size(score_s,2), size(score_c,2)] ~= num_groups)
    error('skin_lab 的组数(=%d)与 score_* 的列数不一致，请检查 score_percent.mat', num_groups);
end

group_labels = {'BK_F','BK_M','BR_F','BR_M','CY_F','CY_M','GU_F','GU_M','YO_F','YO_M','YY_F','YY_M'};

if num_groups == numel(group_labels)
    group_labels = group_labels;
else
    group_labels = arrayfun(@(i) sprintf('Group-%02d', i), 1:num_groups, 'UniformOutput', false);
    warning('组标签以通用占位生成（真实标签未明确）。可在 group_labels 中替换为真实含义。');
end

% 4) 构造加权 zscore（确证：沿用原脚本权重 30/30/31）
w_o = 30; w_s = 30; w_c = 31;
w_sum = w_o + w_s + w_c;

% 5) 拟合与绘图（a*-b* 平面；采用 ellipsoidfit2）
figure('Name','AB-plane Ellipse Fits','Color','w'); hold on; axis equal;
xlabel('a*'); ylabel('b*'); title('AB-plane: y=0.5 contour from ellipsoidfit2');
grid on; box on;
colors = lines(num_groups);

% 保存每组的拟合参数与中心
res2D = cell(num_groups,1);  % par=[k1,k2,k3,a0,b0,k6]
centers = zeros(num_groups, 2);
level_y = 0.5;              % 等值线水平，可按需调整

for i = 1:num_groups
    % 5.1 取第 i 组目标的 L,a,b（三列）=> 只用 a*, b* 拟合
    cielab = skin_lab(:, (i-1)*3 + (1:3));   % 49×3
    ab     = cielab(:, 2:3);                 % a*, b*

    % 5.2 构造该组加权 zscore
    zscore = (w_o*score_o(:,i) + w_s*score_s(:,i) + w_c*score_c(:,i)) / w_sum;

    % 5.3 拟合（二维）：ellipsoidfit2(ab, zscore)
    try
        [par, r, yhat] = ellipsoidfit2(ab, zscore); %#ok<ASGLU>
    catch ME
        warning('组 %d (%s) 拟合失败：%s', i, group_labels{i}, ME.message);
        continue;
    end
    res2D{i}     = par;
    centers(i,:) = [par(4), par(5)]; % a0,b0

    % 5.4 y=level_y 等值线 → 二次式系数 → 用 ellipsefig1 绘制
    try
        [a_,b_,c_,d_,e_,f_] = ab_levelset_conic(par, level_y); % 推导见子函数
        h = draw_conic_ellipse(a_,b_,c_,d_,e_,f_, colors(i,:), 1.8); %#ok<NASGU>
        plot(par(4), par(5), 'o', 'Color', colors(i,:), 'MarkerFaceColor', colors(i,:), 'MarkerSize', 4);
        text(par(4), par(5), ['  ' group_labels{i}], 'Color', colors(i,:), 'FontSize', 9, 'HorizontalAlignment','left');
    catch ME
        warning('组 %d (%s) 椭圆绘制失败：%s', i, group_labels{i}, ME.message);
    end
end

% 6) 可选示例：基于 all-*.mat 的 3D 统计置信椭球（非逻辑拟合；仅示意）
% 说明：
%   - 如果想看“某族群/性别”的总体分布的统计外包椭球，可加载 all-*.mat（变量 score），
%     然后用 ConfidenceRegion2 绘制 3D 椭球（不是 ellipsoidfit2 的等值线）。
%   - 下方演示的是 all-A（非裔），你可以换成 all-S/all-C/all-O 或带 F/M 的细分。
%{
try
    all_file = fullfile(pwd, 'all-A.mat');  % 示例：非裔（African）
    if exist(all_file, 'file')
        T = load(all_file);                 % 变量名为 score（确证）
        if isfield(T,'score')
            figure('Name','3D Confidence Ellipsoid (All-A)','Color','w');
            % 与项目绘图习惯一致：把 [L*,a*,b*] 排成 [a*, b*, L*] 绘图（此为推测便于与 ab 平面对齐）
            Lab3 = [T.score(:,2), T.score(:,3), T.score(:,1)];
            ConfidenceRegion2(Lab3, 0.05, 'norm');  % 统计置信椭球（非拟合）
            xlabel('a*'); ylabel('b*'); zlabel('L*'); title('All-A: 3D Confidence Ellipsoid');
            axis equal; grid on; box on;
        end
    end
catch ME
    warning('3D 统计椭球演示失败：%s', ME.message);
end
%}

 % function plot_ellipse_new


% ========= 子函数：定位 score_percent.mat =========
function fp = locate_score_percent()
% 优先当前目录，其次上级“分析结果/分析过程”
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


% ========= 子函数：将 ellipsoidfit2 的参数转为一般二次式（等值线） =========
function [a_,b_,c_,d_,e_,f_] = ab_levelset_conic(par, level_y)
% 输入：
%   par = [k1,k2,k3,a0,b0,k6] 来自 ellipsoidfit2（二维）
%   level_y = 等值线的 y 水平（默认 0.5）
% 模型（确证自 ellipsoidfit2）：
%   y = 1 / (1 + a6 * exp(sqrt(Q)))，其中
%   Q(x,y) = k1*(x-a0)^2 + k2*(y-b0)^2 + k3*(x-a0)*(y-b0)
% 等值线 y=const 推导（推测依据：代数变形）：
%   1/y - 1 = a6*exp(sqrt(Q)) => sqrt(Q) = log( (1/y - 1)/a6 ) => Q = [ log( (1/y - 1)/a6 ) ]^2
% 说明：
%   - 若 a6<=0 或对数参数≤0，则取 eps 兜底并告警（典型是拟合参数/数据边界造成）。

k1 = par(1); k2 = par(2); k3 = par(3);
x0 = par(4); y0 = par(5); a6 = par(6);

% 计算等值线常数 Q0
arg = (1/level_y - 1) / a6;
if ~(isfinite(arg) && arg > 0)
    warning('等值线对数参数<=0 或非有限（a6=%.4g, level=%.3g），用 eps 兜底。', a6, level_y);
    arg = eps;
end
Q0 = (log(arg))^2;

% 展开 Q 的一般式：Q = a x^2 + b xy + c y^2 + d x + e y + const
a_ = k1;        % x^2
b_ = k3;        % x*y
c_ = k2;        % y^2
d_ = -2*k1*x0 - k3*y0;      % x
e_ = -2*k2*y0 - k3*x0;      % y
const = k1*x0^2 + k2*y0^2 + k3*x0*y0;

% 将 Q = Q0 改写为：a x^2 + b xy + c y^2 + d x + e y + (const - Q0) = 0
f_ = const - Q0;

% 基本椭圆合法性检查（b^2 - 4ac < 0）
if (b_^2 - 4*a_*c_) >= 0
    warning('当前等值线不满足椭圆条件（b^2 - 4ac >= 0），曲线可能退化或拟合不稳定。');
end
end


% ========= 子函数：用 ellipsefig1 绘制一般二次式 =========
function h = draw_conic_ellipse(a_,b_,c_,d_,e_,f_, color, lw)
% 项目中的 ellipsefig1 注释为：
%   “画一般椭圆：ax*x + bx*y + c*y*y + d*x + e*y = f”
% 我们的一般式是：a x^2 + b xy + c y^2 + d x + e y + f = 0
% => a x^2 + b xy + c y^2 + d x + e y = -f  （右侧做 f_rhs）
f_rhs = -f_;

% 直接调用 ellipsefig1；其第三个返回值是句柄 h
[~,~,h] = ellipsefig1(a_, b_, c_, d_, e_, f_rhs);

% 设置绘图属性
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
