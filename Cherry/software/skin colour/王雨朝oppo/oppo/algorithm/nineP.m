function [] = nineP()
% Lightness for Asian: 60, 65, 70
% Lightness for Pakistani: 45, 52.5, 60
%% 前期工作
I = imread('08.tif'); %读入图片

%I=I.*1.3;
xy=[12.1412886927655,10.7613977142027,9.38150673563992,15.0713608703995,13.6914698918367,12.3115789132739,18.0014330480334,16.6215420694706,15.2416510909078;
24.4095041328989,20.7699270483693,17.1303499638397,23.2986112817375,19.6590341972079,16.0194571126782,22.1877184305761,18.5481413460464,14.9085642615168;
1,1,1,1,1,1,1,1,1];
dx=[0,1,2,0,1,2,0,1,2];
dy=[0,1,2,0,1,2,0,1,2];
% dx=[0,2,4,0,2,4,0,2,4];
% dy=[0,4,8,0,4,8,0,4,8];
xy(1,:)=xy(1,:);
xy(2,:)=xy(2,:);
xy(3,:)=xy(3,:)*60; %改变Lightness值
w=[206.4138,207.2329,202.0627]; %24色色卡白块RGB值

% I=I*1.1937;
% w=w*1.1937;

[skin, bg, temp] = skin_det(I); %skin肤色，bg背景，temp肤色位置标记
[s1,s2,~] = size(I); 

% m=[0.233049558	0.278523121	0.171312432
% -0.118982655	-0.158092036	-0.154164156
% -0.322817774	-0.347128751	-0.265539821
% 0.00926544	0.00642356	-0.00477681
% 0.000305085	0.000389758	0.000677054
% 0.011737979	0.012471051	3.22E-05
% -0.004170182	-0.003548146	0.000985922
% -0.009465251	-0.007253043	0.004056859
% -0.005327772	-0.005928583	0.001794761
% 5.258162311	5.532692509	9.530963897]; %rgb转xyz的model

%% 预处理
R = skin(:,:,1);
G = skin(:,:,2);
B = skin(:,:,3);
R = (R(:)); %矩阵降维顺序是从上到下从左到右
G = (G(:));
B = (B(:));
temp=[temp(:),temp(:),temp(:)];
skin2d = [R,G,B];
skin2d = double(skin2d);

%% **********************************%
% using rgb2xyz model
% 10 terms matrics
% r g b rg rb gb r^2 g^2 b^2 1
%{
 skin2d(:,7)=skin2d(:,1).^2;
 skin2d(:,8)=skin2d(:,2).^2;
 skin2d(:,9)=skin2d(:,3).^2;
 skin2d(:,4)=skin2d(:,1).*skin2d(:,2);
 skin2d(:,5)=skin2d(:,1).*skin2d(:,3);
 skin2d(:,6)=skin2d(:,2).*skin2d(:,3);
 skin2d(:,10)=skin2d(:,1)-skin2d(:,1)+1;
 xyzskin=skin2d*m;
 xyzskin=xyzskin.*temp;
%}

%% **********************************%
% using srgb2xyz model
%{
xyzskin=srgb2xyz(skin2d);
xyzskin=xyzskin.*100;
xyzw=srgb2xyz(w).*100; %图片白的选择
%}

%% **********************************%
% ipad-pro model

xyzskin = display_f(skin2d/255,'gog_pars-ipad.mat');
xyzw = display_f(w/255,'gog_pars-ipad.mat');


%%
labskin = xyz2lab(xyzskin,'user',xyzw); %选择相对的白
% labskin = xyz2lab(xyzskin,'d65_64'); %选择绝对的白
averageLab = labskin;
averageLab (~temp(:,1),:) = []; %去除零行
meanLab = mean(averageLab);
temp(:,1) = temp(:,1)*meanLab(1);
temp(:,2) = temp(:,2)*meanLab(2);
temp(:,3) = temp(:,3)*meanLab(3);
dlab = labskin - temp; %各点与平均值的差异


%% ****************************
% image show, 9 by 9 grid
% image save, 9 in total
subplot('position',[0,.666,.333,.333]); nineab(xy(1,1),xy(2,1),xy(3,1),'1',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[.333,.666,.333,.333]); nineab(xy(1,2),xy(2,2),xy(3,2),'2',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[.666,.666,.333,.333]); nineab(xy(1,3),xy(2,3),xy(3,3),'3',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[0,.333,.333,.333]); nineab(xy(1,4),xy(2,4),xy(3,4),'4',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[.333,.333,.333,.333]); nineab(xy(1,5),xy(2,5),xy(3,5),'5',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[.666,.333,.333,.333]); nineab(xy(1,6),xy(2,6),xy(3,6),'6',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[0,0,.333,.333]); nineab(xy(1,7),xy(2,7),xy(3,7),'7',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[.333,0,.333,.333]); nineab(xy(1,8),xy(2,8),xy(3,8),'8',bg,temp,dlab,meanLab,s1,s2,xyzw);
subplot('position',[.666,0,.333,.333]); nineab(xy(1,9),xy(2,9),xy(3,9),'9',bg,temp,dlab,meanLab,s1,s2,xyzw);

% load chirp
% sound(y,Fs);

end

function []=nineab(a,b,l,n,bg,temp,dlab,meanLab,s1,s2,xyzw)
%% 处理

temp(:,1) = temp(:,1)/meanLab(1)*l;
temp(:,2) = temp(:,2)/meanLab(2)*a;
temp(:,3) = temp(:,3)/meanLab(3)*b;


temp = temp + dlab;
%temp(:,1) = temp(:,1) + dlab(:,1);
labskin = temp;


%% 后续处理
xyzskin2 = lab2xyz(labskin,'user',xyzw);
% xyzskin2 = xyzskin2./100;
% skin2d2 = xyz2srgb(xyzskin2);
skin2d2 = display_r(xyzskin2,'gog_pars-ipad.mat');
skin2d2 = skin2d2 * 255;
skin2=reshape(skin2d2,[s1,s2,3]);
%for i = 0 : s2-1
%    skin2(:,i+1,1) = skin2d2(i*s1+1:(i+1)*s1,1);
%    skin2(:,i+1,2) = skin2d2(i*s1+1:(i+1)*s1,2);
%    skin2(:,i+1,3) = skin2d2(i*s1+1:(i+1)*s1,3);
%end

% clear labskin xyzskin2 skin2d2 i s1 s2 s3
%% 显示
skin2 = uint8(skin2);
bg = uint8(bg);
new = skin2 + bg;
%subplot(1,2,2); imshow(I); title('Origin');
%subplot(1,3,2); imshow(new); title('dL');
imshow(new);
imwrite(new,['8','3',n,'.png']);
%subplot(1,4,3); imshow(bg); title('Background');
%subplot(1,4,4); imshow(new); title('Combination');
end
