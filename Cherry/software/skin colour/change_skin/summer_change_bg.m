% 批量按掩膜对 sRGB PNG 图的指定区域进行色温渲染（CAT16），输出到对应色温子文件夹
% 依赖：路径中可调用 ciecat02_d(xyz, destW, srcW, 'CAT16', LA, Yb, D)
% 注意：本脚本需要 R2016b+（脚本内局部函数支持）
clc;clear;close all;
addpath("utils\");
%%
% >>> 修改为你的路径 <<<
source_folder = 'rendered\summer\srgb';
dest_folder   = fullfile(source_folder,"changed_bg");
if ~exist(dest_folder,"dir")
    mkdir(dest_folder);
end

ori_img_folder=pwd;
% 目标色温列表
cct_list = [3000 4000 5000 6500 8000];
D=[0.400022155398037,0.435962870307167,0.463461478673384,...
    0.486570795652174,0.505905034011941];
% 源白点（D65），与示例一致
srcWhiteXYZ = [94.813 100.000 107.262];  % Y=100 标定
LA = 100; Yb = 100; D_factor = 1;        % 与你示例相同的参数风格



% 列出所有 PNG
files = dir(fullfile(source_folder, '*.png'));
for k = 1:numel(files)
    name = files(k).name;

    imgPath = fullfile(source_folder, name);
    img = imread(imgPath);
    img=double(img);
    sz = size(img);
    img_lin=reshape(img,[sz(1)*sz(2),sz(3)]);
    

    % 寻找对应掩膜：<name>_mask.png -> <name>-mask.png -> mask.png
    maskPath=fullfile(ori_img_folder,strcat(name(1:4),"_bgMask.jpg"));
    if ~exist(maskPath,"file")
        continue
    end
    bull = imread(maskPath);
    [logicalIndex,~]=read_bull(bull,0);

    XYZ_lin=srgb2xyz(img_lin);
    xyz_bg=XYZ_lin(logicalIndex,:);

    XYZ_temp=XYZ_lin;
    XYZ_temp(logicalIndex,:)=0;
    imshow(reshape(XYZ_temp./100,[sz(1),sz(2),sz(3)]));

    XYZ_out=XYZ_lin;
    

 
    % 对每个目标色温生成输出
    for tt = 1:numel(cct_list)
        T = cct_list(tt);
        outDir = fullfile(dest_folder, sprintf('%dK', T));

        % 目标白点（Y=100）
        destWhiteXYZ = CCT2xyz(T);

        XYZ_sel2 = ciecat02_d(xyz_bg,  srcWhiteXYZ,destWhiteXYZ, ...
            'CAT16', 100,100,D(tt));
        XYZ_out(logicalIndex, :) = XYZ_sel2;
        % figure(1)
        % imshow(reshape(XYZ_lin./100,[sz(1),sz(2),sz(3)]));
        % figure(2)
        % imshow(reshape(XYZ_out./100,[sz(1),sz(2),sz(3)]));

        % 回到 sRGB（保留 alpha）
        rgb_out=xyz2srgb(XYZ_out);
        outImg=reshape(rgb_out,[sz(1),sz(2),sz(3)]);
        outImg=outImg./255;
        % imshow(outImg);


        outDir = fullfile(dest_folder, name(1:4),sprintf('%dK', T));
        if ~exist(outDir, 'dir')
            mkdir(outDir)
        end
        imwrite(outImg, fullfile(outDir, name));
    end
end

