load naturalness1;
load skylab;
load skinlab;
load grasslab;
addpath("utils\")
% A=load("skinlab");

output_folder=fullfile("res");
if ~exist(output_folder,"dir")
    mkdir(output_folder);
end
fitRes_folder=fullfile(output_folder,"fitRes");
if ~exist(fitRes_folder,"dir")
    mkdir(fitRes_folder);
end



% sky
templab = [];
tempn = [];
for i = 1:10
    templab = [templab;skylab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1((i-1)*49+1:(i-1)*49+49,:)];
    
end
labNscore{1,1}=templab;
labNscore{1,2}=tempn;
labNscore{2,3}="sky";
[par(1,:),r(1,:)] = ellipsoidfit4(templab,tempn);
LCh(1,:) = [par(1,5),sqrt(par(1,6).^2+par(1,7).^2),hue_angle_degree(par(1,6),par(1,7))] ;
shape(1,:) = calculate_ellipse_shape(par(1,:));


% spring grass
templab = [];
tempn = [];
for i = [2 3 4 6 8 9 10]
    templab = [templab;grasslab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(490+(i-1)*49+1:490+(i-1)*49+49,:)];
    
end
labNscore{2,1}=templab;
labNscore{2,2}=tempn;
labNscore{2,3}="spring grass";
[par(2,:),r(2,:)] = ellipsoidfit4(templab,tempn);
LCh(2,:) = [par(2,5),sqrt(par(2,6).^2+par(2,7).^2),hue_angle_degree(par(2,6),par(2,7))] ;
shape(2,:) = calculate_ellipse_shape(par(2,:));

% autumn grass
templab = [];
tempn = [];
for i = 1:10
    templab = [templab;grasslab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(1470+(i-1)*49+1:1470+(i-1)*49+49,:)];
    
end
labNscore{3,1}=templab;
labNscore{3,2}=tempn;
labNscore{3,3}="autumn grass";
[par(3,:),r(3,:)] = ellipsoidfit4(templab,tempn,[48.64,-0.26,41.36]);
LCh(3,:) = [par(3,5),sqrt(par(3,6).^2+par(3,7).^2),hue_angle_degree(par(3,6),par(3,7))] ;
shape(3,:) = calculate_ellipse_shape(par(3,:));


% asian skin
templab = [];
tempn = [];

for i = [1 5 7 9 10]
    templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:)];
    
end

labNscore{4,1}=templab;
labNscore{4,2}=tempn;
labNscore{4,3}="asian skin";
[par(4,:),r(4,:)] = ellipsoidfit4(templab,tempn);
LCh(4,:) = [par(4,5),sqrt(par(4,6).^2+par(4,7).^2),hue_angle_degree(par(4,6),par(4,7))] ;
shape(4,:) = calculate_ellipse_shape(par(4,:));

pre_draw_folder = fullfile(fitRes_folder, 'pre_draw');
if ~exist(pre_draw_folder, 'dir')
    mkdir(pre_draw_folder);
end
figure('Visible','off');
plot_contour_with_scatter3D(par, templab,tempn,pre_draw_folder,sprintf("skin_%d",i))
title(sprintf("skin_%d",i));

frame = getframe(gcf); % 获取当前 Figure 窗口的帧
img = frame2im(frame); % 将帧转换为图像数据
imwrite(img, fullfile(pre_draw_folder, ...
    strcat(sprintf("asian skin"), '.jpg')));
close(gcf);



% caucasian skin
templab = [];
tempn = [];

for i = [2 3 4 6 8]
    templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:)];
    
end
labNscore{5,1}=templab;
labNscore{5,2}=tempn;
labNscore{5,3}="caucasian skin";
[par(5,:),r(5,:)] = ellipsoidfit4(templab,tempn,[65.21,21.43,23.75]);

LCh(5,:) = [par(5,5),sqrt(par(5,6).^2+par(5,7).^2),hue_angle_degree(par(5,6),par(5,7))] ;
shape(5,:) = calculate_ellipse_shape(par(5,:));


                % 绘制等高线图并保存
pre_draw_folder = fullfile(fitRes_folder, 'pre_draw');
if ~exist(pre_draw_folder, 'dir')
    mkdir(pre_draw_folder);
end
figure('Visible','off');
plot_contour_with_scatter3D(par, templab,tempn,pre_draw_folder,sprintf("skin_%d",i))

title(sprintf("caucasian skin"));

frame = getframe(gcf); % 获取当前 Figure 窗口的帧
img = frame2im(frame); % 将帧转换为图像数据
imwrite(img, fullfile(pre_draw_folder, ...
    strcat(sprintf("skin_%d",i), '.jpg')));
close(gcf);
save(fullfile(fitRes_folder,"fitRes.mat"),"par","r","labNscore");

ellipse_atr = [LCh,shape,r];

save ellipsoidmodel par;
save ellipse_atr ellipse_atr;