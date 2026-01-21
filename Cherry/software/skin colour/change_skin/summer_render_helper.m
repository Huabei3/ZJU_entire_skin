clc;clear;close all;
%%  交互标注 eye 区域，生成 eye_mask_rect=[x y w h] 并保存到 rendered\eye_rect_info

% 交互标注 eye 区域，生成 eye_mask_rect=[x y w h] 并保存到 rendered\eye_rect_info
% 点击顺序：左上 -> 左下 -> 右下 -> 右上

% 选择要标注的图片（建议选择“缩小后的小图”以直接得到小图坐标）
% img_dir="D:\work\ZJU_entire_skin\ZJU_skin_database\A_images\Summer\original_imgs";
% img_file="CA.jpg";
% img_path = fullfile(img_dir, img_file);
% I = imread(img_path);
% 
% % 显示图像并提示点击
% hFig = figure('Name','Click TL, BL, BR, TR','NumberTitle','off');
% imshow(I, 'InitialMagnification', 'fit'); axis image; hold on;
% title('Click 4 points in order: TL, BL, BR, TR');
% impixelinfo; % 显示光标坐标信息
% 
% labels = {'TL','BL','BR','TR'};
% pts = zeros(4,2);
% for i = 1:4
%     [x, y] = ginput(1);
%     pts(i,:) = [x, y];
%     plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 1.5);
%     text(x+3, y+3, labels{i}, 'Color', 'y', 'FontSize', 10, 'FontWeight', 'bold');
% end
% 
% % 生成轴对齐矩形 [x y w h]
% x1 = min(pts(:,1));
% y1 = min(pts(:,2));
% x2 = max(pts(:,1));
% y2 = max(pts(:,2));
% eye_mask_rect = [x1, y1, x2 - x1, y2 - y1];
% 
% % 在图上预览矩形
% rectangle('Position', eye_mask_rect, 'EdgeColor', 'g', 'LineWidth', 1.5);
% drawnow;
% 
% % 保存到 rendered\eye_rect_info\<basename>_eye_rect.mat
% save_dir = fullfile( 'rendered', 'eye_rect_info');
% if ~exist(save_dir, 'dir')
%     mkdir(save_dir);
% end
% [~, base, ~] = fileparts(img_file);
% mat_path = fullfile(save_dir, strcat(base, '_eye_rect.mat'));
% 
% click_points_order = pts; %#ok<NASGU> % 额外保存原始点击点
% mat_path=char(mat_path);
% save(mat_path, 'eye_mask_rect', 'click_points_order', 'img_path');
% 
% fprintf('Saved eye_mask_rect to: %s\n', mat_path);

%%  rendered Cherry 转 Summer
 


% 批量：按固定四角坐标裁剪 -> 按倍数收缩 -> 置零 eye 区域 -> 输出到对应子目录
nations{1,1}="BK";nations{1,2}="AF";
nations{2,1}="BR";nations{2,2}="SA";
nations{3,1}="GU";nations{3,2}="CA";
nations{4,1}="YY";nations{4,2}="AS";
for i_nation=4:-1:1
% % 1) 必填路径
source_folder = fullfile('D:\work\ZJU_entire_skin\Cherry\software\' ,...
    'skin colour\change_skin\rendered\summer\srgb\changed_bg', ...
    strcat(nations{i_nation,1},"_F"));
dest_folder   = fullfile('D:\work\ZJU_entire_skin\Cherry\software\', ...
    'skin colour\change_skin\rendered\summer\srgb\changed_bg\summer_style', ...
    strcat(nations{i_nation,1},"_F"));
if ~exist(dest_folder,"dir")
    mkdir(dest_folder);
end
% 2) 已知参数：小图四角在原图坐标（[x y]，顺序 TL, TR, BR, BL）
if i_nation==4
    i_nation_used=3;
else
    i_nation_used=i_nation;
end
crop_data=load(fullfile("rendered\find_rect_info", ...
    strcat(nations{i_nation_used,1},"_F.mat")));
corners=crop_data.corners;
scale_factor = crop_data.scale;              % 小图 = 裁剪图 / scale_factor
resize_scale = 1 / scale_factor;

% 4) eye 区域在小图坐标的矩形 [x y w h]（左上为 x,y；宽高为 w,h）
%    注意：此矩形是在“缩小后的图”上定义的坐标
% load("rendered\eye_rect_info\CA_eye_rect.mat");
% eye_mask_rect = [50 50 120 60];       % TODO: 改成你的值

% 支持的图片扩展名
imgExts = {'*.png','*.jpg','*.jpeg','*.bmp','*.tif','*.tiff'};

% 计算裁剪矩形 [x y w h]（基于四角在原图坐标）
x0 = min(corners(:,1));
y0 = min(corners(:,2));
w  = max(corners(:,1)) - x0;
h  = max(corners(:,2)) - y0;
crop_rect = [x0, y0, w, h];

% 枚举一级子文件夹
dlist = dir(source_folder);
for di = 1:numel(dlist)
    d = dlist(di);
    if ~d.isdir || any(strcmp(d.name, {'.','..'}))
        continue;
    end
    src_subdir  = fullfile(source_folder, d.name);
    dst_subdir  = fullfile(dest_folder,  d.name);
    if ~exist(dst_subdir, 'dir'); mkdir(dst_subdir); end

    % 收集该子目录所有图片
    files = [];
    for ei = 1:numel(imgExts)
        files = [files; dir(fullfile(src_subdir, imgExts{ei}))]; %#ok<AGROW>
    end
    if isempty(files); continue; end

    for k = 1:numel(files)
        in_name = files(k).name;
        in_path = fullfile(src_subdir, in_name);
        out_path = fullfile(dst_subdir, in_name);

        % 读图（尽量保留原类型）
        I = imread(in_path);
        sz=size(I);
        I=imresize(I,[sz(1)*0.5,sz(2)*0.5]);
        % figure(1);hold on;imshow(I);
        % 裁剪（原图坐标；支持非整数）
        Ic = imcrop(I, crop_rect);
        % figure(2);hold on;imshow(Ic);


        imshow(Ic);

        % 收缩
        Is = imresize(Ic, resize_scale);

        % 在小图上置零 eye 区域
        % [H, W, C] = size(Is);
        % % 将矩形转换为合法像素索引范围
        % rx1 = max(1, floor(eye_mask_rect(1)));
        % ry1 = max(1, floor(eye_mask_rect(2)));
        % rx2 = min(W, ceil(eye_mask_rect(1) + eye_mask_rect(3) - 1));
        % ry2 = min(H, ceil(eye_mask_rect(2) + eye_mask_rect(4) - 1));
        % if rx1 <= rx2 && ry1 <= ry2
        %     if C > 1
        %         Is(ry1:ry2, rx1:rx2, 1:min(3,C)) = 0;  % 仅清 RGB；若灰度 C=1 也适用
        %     else
        %         Is(ry1:ry2, rx1:rx2) = 0;
        %     end
        % end

        % 保存
        imwrite(Is, out_path);
    end
end
end
% 如 eye_mask_rect 是在“原图坐标”上给的，可用下述换算得到小图坐标：
% eye_mask_rect_small = [(x - x0) * resize_scale, (y - y0) * resize_scale, ...
%                        w * resize_scale,         h * resize_scale];

%%  交互式对齐小图到大图，记录小图四角坐标（脚本）

% % % % 选择大图和小图
%     % %BK_F.png,'BK_F','BR_F', 'GU_F'
% % bigImagePath = "BK_F.png";
% % bigImagePath = "GU_F.png";
% % bigImagePath = "BR_F.png";
% bigImagePath = "YY_F.png";
% smallPath="D:\work\ZJU_entire_skin\ZJU_skin_database\A_images\Summer\original_imgs";
% % smallImagePath = fullfile(smallPath, "AF.jpg");
% % smallImagePath = fullfile(smallPath, "CA.jpg");
% % smallImagePath = fullfile(smallPath, "SA.jpg");
% % smallImagePath = fullfile(smallPath, "AS.jpg");
% % 读取图像
% 
% bigImg   = im2double(imread(bigImagePath));
% smallImg = im2double(imread(smallImagePath));
% sz=size(bigImg);
% bigImg=imresize(bigImg,[sz(1)*0.5,sz(2)*0.5]);
% [bigH, bigW, ~] = size(bigImg);
% [sH, sW, ~]     = size(smallImg);
% 
% % 界面
% f = figure('Name','Drag and Scale the small image, then click Confirm', ...
%            'NumberTitle','off', 'Toolbar','figure', 'Units','normalized', ...
%            'Position',[0.1 0.1 0.8 0.8]);
% ax = axes('Parent', f);
% imshow(bigImg, 'Parent', ax); hold(ax,'on');
% 
% % 小图叠加（50%透明）
% hSmall = imshow(smallImg, 'Parent', ax);
% set(hSmall, 'AlphaData', 0.5, 'HitTest','on', 'PickableParts','all');
% 
% % 初始位置与缩放
% x0 = 20; y0 = 20;                   % 左上角位置
% scale0 = 1.0;                       % 初始缩放倍数
% set(hSmall, 'XData', [x0, x0 + sW*scale0 - 1], 'YData', [y0, y0 + sH*scale0 - 1]);
% 
% % 提示与按钮
% uicontrol(f, 'Style','pushbutton', 'String','Confirm', 'Units','normalized', ...
%     'Position',[0.01 0.01 0.10 0.05], 'FontSize',10, 'Callback', @(src,evt) confirmPosition(f));
% uicontrol(f, 'Style','text', 'Units','normalized', 'Position',[0.12 0.01 0.28 0.05], ...
%     'String','Drag to move. Mouse wheel or slider to scale. Click Confirm.', ...
%     'FontSize',10, 'BackgroundColor',[0.94 0.94 0.94]);
% 
% % 缩放滑块与标签
% scaleMin = 0.1; scaleMax = 5.0;
% scaleLabel = uicontrol(f, 'Style','text', 'Units','normalized', 'Position',[0.81 0.01 0.08 0.05], ...
%     'String',sprintf('Scale: %.3f', scale0), 'FontSize',10, 'BackgroundColor',[0.94 0.94 0.94]);
% scaleSlider = uicontrol(f, 'Style','slider', 'Units','normalized', 'Position',[0.60 0.01 0.20 0.05], ...
%     'Min',scaleMin, 'Max',scaleMax, 'Value',scale0, ...
%     'SliderStep',[0.01 0.10], ...
%     'Callback', @(src,evt) setScale(f, get(src,'Value'), true));
% 
% % 交互状态存储
% state.ax = ax;
% state.img = hSmall;
% state.pos = [x0, y0];      % 左上角位置 [x y]
% state.sz  = [sW, sH];      % 小图原始宽高
% state.big = [bigW, bigH];  % 大图宽高
% state.scale = scale0;
% state.scaleMin = scaleMin;
% state.scaleMax = scaleMax;
% state.dragging  = false;
% state.dragStart = [0 0];
% state.posStart  = [x0 y0];
% state.scaleSlider = scaleSlider;
% state.scaleLabel  = scaleLabel;
% state.savePath = "rendered\find_rect_info";
% if ~exist(state.savePath,"dir")
%     mkdir(state.savePath)
% end
% state.bigFile = bigImagePath;
% guidata(f, state);
% 
% % 绑定拖动与滚轮缩放
% set(hSmall, 'ButtonDownFcn', @(src,evt) startDrag(f));
% set(f, 'WindowButtonMotionFcn', @(src,evt) doDrag(f));
% set(f, 'WindowButtonUpFcn', @(src,evt) endDrag(f));
% set(f, 'WindowScrollWheelFcn', @(src,evt) wheelScale(f, evt));
% 
% % ===== 回调函数（脚本本地函数） =====
% function startDrag(fig)
%     st = guidata(fig);
%     cp = get(st.ax, 'CurrentPoint');
%     st.dragging  = true;
%     st.dragStart = cp(1,1:2);
%     st.posStart  = st.pos;
%     set(fig, 'Pointer','fleur');
%     guidata(fig, st);
% end
% 
% function doDrag(fig)
%     st = guidata(fig);
%     if ~st.dragging, return; end
%     cp = get(st.ax, 'CurrentPoint');
%     dxy = cp(1,1:2) - st.dragStart;
%     newPos = st.posStart + dxy;
%     newPos = clampPos(newPos, st.sz, st.scale, st.big);
%     applyOverlay(st, newPos, st.scale);
%     st.pos = newPos;
%     guidata(fig, st);
% end
% 
% function endDrag(fig)
%     st = guidata(fig);
%     if st.dragging
%         st.dragging = false;
%         set(fig, 'Pointer','arrow');
%         guidata(fig, st);
%     end
% end
% 
% function wheelScale(fig, evt)
%     st = guidata(fig);
%     if evt.VerticalScrollCount < 0
%         factor = 1.1;   % 放大
%     else
%         factor = 1/1.1; % 缩小
%     end
%     newScale = min(max(st.scale * factor, st.scaleMin), st.scaleMax);
%     setScale(fig, newScale, true);
% end
% 
% function setScale(fig, newScale, keepCenter)
%     st = guidata(fig);
%     oldScale = st.scale;
%     oldSize  = st.sz .* oldScale;
%     if keepCenter
%         c = st.pos + oldSize/2;
%         newSize = st.sz .* newScale;
%         newPos  = c - newSize/2;
%     else
%         newPos  = st.pos;
%     end
%     newPos = clampPos(newPos, st.sz, newScale, st.big);
%     applyOverlay(st, newPos, newScale);
%     st.pos   = newPos;
%     st.scale = newScale;
%     if ishandle(st.scaleSlider), set(st.scaleSlider,'Value', newScale); end
%     if ishandle(st.scaleLabel),  set(st.scaleLabel,'String', sprintf('Scale: %.3f', newScale)); end
%     guidata(fig, st);
% end
% function p = clampPos(pos, ~, ~, ~)
%     % 不做任何边界约束，直接返回当前位置
%     p = pos;
% end
% % function p = clampPos(pos, sz0, scale, bigWH)
% %     w = sz0(1)*scale; h = sz0(2)*scale;
% %     maxX = bigWH(1) - w + 1;  if maxX < 1, maxX = 1; end
% %     maxY = bigWH(2) - h + 1;  if maxY < 1, maxY = 1; end
% %     p(1) = min(max(1, pos(1)), maxX);
% %     p(2) = min(max(1, pos(2)), maxY);
% % end
% 
% function applyOverlay(st, pos, scale)
%     w = st.sz(1)*scale; h = st.sz(2)*scale;
%     set(st.img, 'XData', [pos(1), pos(1) + w - 1], ...
%                 'YData', [pos(2), pos(2) + h - 1]);
% end
% 
% function confirmPosition(fig)
%     st = guidata(fig);
%     x = st.pos(1); y = st.pos(2); w = st.sz(1)*st.scale; h = st.sz(2)*st.scale;
%     corners = [...
%         x,       y;        % TL
%         x+w-1,   y;        % TR
%         x+w-1,   y+h-1;    % BR
%         x,       y+h-1     % BL
%     ];
%     scale = st.scale;
% 
%     disp('Small image corners [x y] (TL, TR, BR, BL):');
%     disp(corners);
%     disp(['Scale factor: ', num2str(scale, '%.6f')]);
% 
%     % 可视化四角
%     hold(st.ax, 'on');
%     plot(st.ax, corners([1:4 1],1), corners([1:4 1],2), 'g-', 'LineWidth', 1.5);
%     plot(st.ax, corners(:,1), corners(:,2), 'go', 'MarkerFaceColor','g');
% 
%     % 保存到与大图同名 .mat
% 
%     [~, baseName, ~] = fileparts(st.bigFile);         % baseName 为 string
%     outPath = fullfile(st.savePath, baseName + ".mat"); % 用 + 拼接扩展名，保持 string
%     save(char(outPath), 'corners', 'scale');            % 转成 char 传给 save
%     disp(['Saved to: ', char(outPath)]);
% 
% 
% 
%     % 同时放到 base 工作区（可选）
%     assignin('base','smallImageCorners', corners);
%     assignin('base','smallImageScale', scale);
% end


%%
    % % 让用户选择大图和小图
    % %BK_F.png,'BK_F','BR_F', 'GU_F'
    % bigImagePath = "BK_F.png";
    % smallPath="D:\work\ZJU_entire_skin\Res\A_images\Summer\original_imgs";
    % smallImagePath = fullfile(smallPath, "AF.jpg");
    % 
    % % 读取图像
    % bigImg = imread(bigImagePath);
    % smallImg = imread(smallImagePath);
    % 
    % % 获取小图尺寸
    % [h_small, w_small, ~] = size(smallImg);
    % 
    % % 创建半透明的小图
    % alpha = 0.5; % 不透明度为50%
    % smallImgAlpha = smallImg;
    % if size(smallImg, 3) == 3
    %     % 如果是RGB图像，需要处理alpha通道
    %     smallImgAlpha = cat(3, smallImg, uint8(alpha * 255 * ones(h_small, w_small)));
    % end
    % 
    % % 创建图形界面
    % fig = figure('Name', '图像对齐工具', 'NumberTitle', 'off', ...
    %              'Position', [100, 100, 800, 600], ...
    %              'MenuBar', 'none', 'ToolBar', 'none');
    % 
    % % 创建轴显示图像
    % ax = axes('Parent', fig, 'Position', [0.05, 0.1, 0.9, 0.85]);
    % imshow(bigImg, 'Parent', ax);
    % hold(ax, 'on');
    % 
    % % 初始化小图位置（放在大图中心）
    % [h_big, w_big, ~] = size(bigImg);
    % x_center = (w_big - w_small) / 2;
    % y_center = (h_big - h_small) / 2;
    % 
    % % 显示半透明的小图
    % h_small_img = imshow(smallImg, 'Parent', ax);
    % set(h_small_img, 'AlphaData', alpha); % 设置透明度
    % set(h_small_img, 'XData', [x_center, x_center + w_small]);
    % set(h_small_img, 'YData', [y_center, y_center + h_small]);
    % 
    % % 初始化坐标变量
    % currentPos = [x_center, y_center, w_small, h_small];
    % corners = zeros(4, 2); % 存储四个角坐标
    % 
    % % 创建UI控制按钮
    % uicontrol('Style', 'pushbutton', 'String', '确认对齐', ...
    %           'Position', [300, 20, 100, 30], ...
    %           'Callback', @confirmAlignment);
    % 
    % uicontrol('Style', 'pushbutton', 'String', '重置位置', ...
    %           'Position', [420, 20, 100, 30], ...
    %           'Callback', @resetPosition);
    % 
    % uicontrol('Style', 'text', 'String', '操作说明: 拖动小图进行对齐，点击"确认对齐"记录坐标', ...
    %           'Position', [100, 60, 600, 20], ...
    %           'BackgroundColor', get(fig, 'Color'));
    % 
    % % 坐标显示区域
    % coordText = uicontrol('Style', 'text', 'String', '坐标: 未记录', ...
    %                       'Position', [550, 20, 200, 30], ...
    %                       'BackgroundColor', get(fig, 'Color'), ...
    %                       'HorizontalAlignment', 'left');
    % 
    % % 启用图像拖动功能
    % set(h_small_img, 'ButtonDownFcn', @startDrag);
    % set(fig, 'WindowButtonUpFcn', @stopDrag);
    % 
    % % 拖动状态变量
    % isDragging = false;
    % dragStartPos = [0, 0];
    % imgStartPos = [0, 0];
    % 
    % % 开始拖动函数
    % function startDrag(~, ~)
    %     isDragging = true;
    %     dragStartPos = get(ax, 'CurrentPoint');
    %     dragStartPos = dragStartPos(1, 1:2);
    %     imgStartPos = currentPos(1:2);
    %     set(fig, 'WindowButtonMotionFcn', @dragging);
    % end
    % 
    % % 拖动过程中
    % function dragging(~, ~)
    %     if isDragging
    %         currentPos = get(ax, 'CurrentPoint');
    %         currentPos = currentPos(1, 1:2);
    % 
    %         % 计算新位置
    %         dx = currentPos(1) - dragStartPos(1);
    %         dy = currentPos(2) - dragStartPos(2);
    % 
    %         newX = imgStartPos(1) + dx;
    %         newY = imgStartPos(2) + dy;
    % 
    %         % 限制在大图范围内
    %         newX = max(0, min(newX, w_big - w_small));
    %         newY = max(0, min(newY, h_big - h_small));
    % 
    %         % 更新小图位置
    %         set(h_small_img, 'XData', [newX, newX + w_small]);
    %         set(h_small_img, 'YData', [newY, newY + h_small]);
    % 
    %         currentPos = [newX, newY, w_small, h_small];
    %     end
    % end
    % 
    % % 停止拖动
    % function stopDrag(~, ~)
    %     isDragging = false;
    %     set(fig, 'WindowButtonMotionFcn', '');
    % end
    % 
    % % 重置位置函数
    % function resetPosition(~, ~)
    %     x_center = (w_big - w_small) / 2;
    %     y_center = (h_big - h_small) / 2;
    % 
    %     set(h_small_img, 'XData', [x_center, x_center + w_small]);
    %     set(h_small_img, 'YData', [y_center, y_center + h_small]);
    %     currentPos = [x_center, y_center, w_small, h_small];
    % 
    %     set(coordText, 'String', '坐标: 已重置');
    % end
    % 
    % % 确认对齐函数
    % function confirmAlignment(~, ~)
    %     % 计算四个角的坐标
    %     x = currentPos(1);
    %     y = currentPos(2);
    %     w = currentPos(3);
    %     h = currentPos(4);
    % 
    %     % 四个角坐标：[左上，右上，右下，左下]
    %     corners = [x, y;                    % 左上角
    %                x + w, y;                % 右上角
    %                x + w, y + h;            % 右下角
    %                x, y + h];               % 左下角
    % 
    %     % 在图像上标记四个角
    %     hold(ax, 'on');
    %     plot(ax, corners(:,1), corners(:,2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    %     plot(ax, corners([1:4,1],1), corners([1:4,1],2), 'r-', 'LineWidth', 1.5);
    % 
    %     % 显示坐标
    %     coordStr = sprintf('左上: (%.1f, %.1f)\n右上: (%.1f, %.1f)\n右下: (%.1f, %.1f)\n左下: (%.1f, %.1f)', ...
    %                        corners(1,1), corners(1,2), ...
    %                        corners(2,1), corners(2,2), ...
    %                        corners(3,1), corners(3,2), ...
    %                        corners(4,1), corners(4,2));
    % 
    %     set(coordText, 'String', '坐标已记录！');
    % 
    %     % 在控制台输出坐标
    %     fprintf('\n========== 对齐完成 ==========\n');
    %     fprintf('小图四个角在大图上的坐标（左上、右上、右下、左下）：\n');
    %     for i = 1:4
    %         fprintf('角 %d: (%.2f, %.2f)\n', i, corners(i,1), corners(i,2));
    %     end
    % 
    %     % 创建一个新的对话框显示坐标
    %     msgbox(coordStr, '对齐坐标结果', 'help');
    % 
    %     % 将坐标保存到工作空间
    %     assignin('base', 'alignment_corners', corners);
    %     fprintf('坐标已保存到工作空间变量 "alignment_corners"\n');
    %     fprintf('==================================\n\n');
    % end
    % 
    % % 添加键盘快捷键支持
    % set(fig, 'KeyPressFcn', @keyboardShortcut);
    % 
    % function keyboardShortcut(~, event)
    %     % 键盘快捷键
    %     step = 5; % 每次移动的像素数
    % 
    %     switch event.Key
    %         case 'leftarrow'
    %             currentPos(1) = max(0, currentPos(1) - step);
    %         case 'rightarrow'
    %             currentPos(1) = min(w_big - w_small, currentPos(1) + step);
    %         case 'uparrow'
    %             currentPos(2) = max(0, currentPos(2) - step);
    %         case 'downarrow'
    %             currentPos(2) = min(h_big - h_small, currentPos(2) + step);
    %         case 'r'  % 重置
    %             resetPosition([], []);
    %             return;
    %         case 'c'  % 确认
    %             confirmAlignment([], []);
    %             return;
    %     end
    % 
    %     % 更新位置
    %     if ~strcmp(event.Key, 'r') && ~strcmp(event.Key, 'c')
    %         set(h_small_img, 'XData', [currentPos(1), currentPos(1) + w_small]);
    %         set(h_small_img, 'YData', [currentPos(2), currentPos(2) + h_small]);
    %     end
    % end
    % 
    % fprintf('操作说明：\n');
    % fprintf('1. 拖动小图进行对齐\n');
    % fprintf('2. 使用方向键微调位置\n');
    % fprintf('3. 按 R 键重置位置\n');
    % fprintf('4. 按 C 键或点击"确认对齐"记录坐标\n');
    % fprintf('==================================\n\n');
