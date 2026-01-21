for i=1
[SPQ,SPQn,mlab1]=skin_enhance(i,'Chinese','near distance',0.8);
%  spq((i-1)*4+1)=double(SPQn);
%  lab((i-1)*4+1,:)=mlab_new;
% [SPQ2,SPQ2n,mlab_new]=skin_enhance(i,'Chinese','long distance',0.5);
%  spq((i-1)*4+2)=double(SPQ2n);
%  lab((i-1)*4+2,:)=mlab_new;
%  [SPQ3,SPQ3n,mlab_new]=skin_enhance(i,'Chinese','middle distance',0.8);
%  spq((i-1)*4+3)=double(SPQ3n);
%  lab((i-1)*4+3,:)=mlab_new;
[SPQ5,SPQ5n,mlab2]=skin_enhance(i,'Chinese','C/h',0.8);
 [SPQ4,SPQ4n,mlab3]=skin_enhance(i,'Chinese','zeng',0.8);
%  spq((i-1)*4+4)=double(SPQ4n);
%  lab((i-1)*4+4,:)=tmlab_new;
end

function [SPQ,SPQn,mlab_new]=skin_enhance(i,type,method,f)
% ** FUNCTION skin colour enhancement  肤色喜好量化评价及肤色修正算法 version.2020-10-18
% ** by Rui Peng and Ronnier Luo
% ** i 输入图像序号
% ** type 输入图像肤色类型，“Chinese”，“Caucasian”，“SouthAsian”，“African”
% ** method 输入 enhancement 算法类型，“near distance”，“long distance”，“middle distance”
% ** f 输入调整系数 0<f<=1，f越大肤色调整幅度越大，越靠近喜好肤色中心，但同时会影响图像texture
% ** SPQ: Skin Preference Quality 肤色喜好量化评价指标 0%~100% 百分比越高代表喜好度越高
% ** SPQn: 优化后图像肤色喜好度 0%~100%

%% =================== nargin ====================
if nargin<4
    switch method 
        case 'near distance' 
            f=0.3;
        case 'long distance' 
            f=1;
        case 'middle distance' 
            f=0.7;
    end
end

%% =================== 输入图像 ====================
str='.\原图与优化图像\';  % 待处理图像地址，所有图像以序号命名，每一组图像包括待处理原图和肤色mask
IMG=imread([str,num2str(i),'.png']);
height=size(IMG,1);
weight=size(IMG,2);
I=double(IMG);
img=reshape(I,size(I,1)*size(I,2),3);  % 读图，转为一维矩阵 

%% ==================== 肤色与非肤色分离 ====================
[~,~,idx1]=imread([str,num2str(i),'.png']);       % 待处理原图
idx1(idx1>0)=1;
[~,~,idx2]=imread([str,num2str(i),'_nnmask.png']);  % 原图肤色部分
idx2(idx2>0)=1;
index=double(idx1-idx2);                % 得到图像肤色index，0是肤色，1是非肤色
%  [ ~,~,temp ] = skin_det( I );
% index=double(~temp);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
R = double(R);
G = double(G);
B = double(B);
skin=cat(3,R,G,B).*cat(3,~index,~index,~index);   % 肤色部分
skin2d=reshape(skin,size(skin,1)*size(skin,2),3);  
w=[255,255,255]; 
xyzw = lut3d_rgb2xyz(w);  % 屏幕白点，适用于Huawei P20，Jeti实际测量值
xyzskin=lut3d_rgb2xyz(skin2d);  % 3Dlut显示器校准模型rgb→xyz
lab=xyz2lab(xyzskin,'user',xyzw);  % xyz→lab
averageLab=lab;
averageLab(all(skin2d==0,2),:) = [];   % 去除零行即非肤色
mlab=mean(averageLab);  % 原图平均肤色中心

switch type  % 输入图像肤色类型，g代表不同肤色图像的喜好模型参数
    case 'Chinese'     % 中国人图像
        g=[0.021918043	0.114852178	0.047455333	-0.057891224	62.66080544	18.31126561	19.11766803	2.083585086];
    case 'Caucasian'   % 白种人图像
        g=[0.020667578	0.127532583	0.047573365	-0.055680769	65.07853811	18.83217895	18.8672775	2.396801573]; 
    case 'African'     % 非洲人图像
        g=[0.013829993	0.094652341	0.046905515	-0.057624519	40.26548882	17.76943003	18.68521912	1.288093013]; 
    case 'SouthAsian'  % 南亚人图像
        g=[0.018735974	0.120533937	0.043763641	-0.064045284	57.03592355	17.88425193	18.61228191	1.917478005];
end

xc=g(5);  % 喜好肤色中心
yc=g(6);
zc=g(7);

%% ==================== 肤色喜好量化评价 ====================
xm=mlab(1);
ym=mlab(2);
zm=mlab(3);
E= sqrt(g(1)*(xm-g(5)).^2+g(2)*(ym-g(6)).^2+g(3)*(zm-g(7)).^2+g(4)*(ym-g(6)).*(zm-g(7)));
SPQ=1/(1+exp(E-g(8)));  % 肤色喜好量化评价指标
SPQ=vpa(SPQ*100,3);
disp(['Skin Preference Quality of original image = ',char(SPQ),'%'])

%% ==================== 肤色修正算法 ====================
x = lab(:,1);
y = lab(:,2);
z = lab(:,3);
dp = (g(1)*(x(~index)-xc).^2+g(2)*(y(~index)-yc).^2+g(3)*(z(~index)-zc).^2+g(4)*(y(~index)-yc).*(z(~index)-zc))./(g(8)^2);
% dp: 每个肤色像素跟喜好肤色椭球的马氏距离
max_n=max(dp);
min_n=min(dp);
mean_n=max_n-min_n;  % dp最大值与最小值的差值

switch method  % 输入 enhancement 算法类型，“near distance”，“long distance”，“middle distance”
    case 'near distance' 
    % 越靠近肤色中心调整越多，dp=min对应w=1，dp=max对应w=0，该方法肤色调整幅度最大，所以在调整l-a*-b*值时考虑用f*w
        w=max_n/mean_n-dp./mean_n; % 计算每一个dp值对应的w值
        lab0_new = lab;
        lab0_new(~index,1) = x(~index) + f*w.*(xc-x(~index)); % calculate new L* values
        lab0_new(~index,2) = y(~index) + f*w.*(yc-y(~index));  % calculate new a* values
        lab0_new(~index,3) = z(~index) + f*w.*(zc-z(~index));  % calculate new b* values  
        
    case 'long distance' 
    % 越远离肤色中心调整越多，dp=max对应w=1，dp=min对应w=0，该方法肤色调整幅度比较小，所以在调整a*-b*值时可以直接用w，调整L值用f*w尽可能保留图像texture
        w=(dp-min_n)./mean_n;
        lab0_new = lab;
        lab0_new(~index,1) = x(~index) + f*w.*(xc-x(~index)); % calculate new L* values
        lab0_new(~index,2) = y(~index) + w.*(yc-y(~index));  % calculate new a* values
        lab0_new(~index,3) = z(~index) + w.*(zc-z(~index));  % calculate new b* values
        
    case 'middle distance' 
    % 向中间偏移，dp=min或max对应w=0，dp=中间值对应w=1
        ds=(max_n+min_n)/2;  % ds 中间值
        w=1-abs(dp-ds)./(max_n-ds);
        lab0_new = lab;
        lab0_new(~index,1) = x(~index) + f*w.*(xc-x(~index)); % calculate new L* values
        lab0_new(~index,2) = y(~index) + w.*(yc-y(~index)); % calculate new a* values
        lab0_new(~index,3) = z(~index) + w.*(zc-z(~index)); % calculate new b* values  
        
    case 'C/h'
    % C/h
        lch0 = zeros(1,3);
        lch0(1) =mlab(1);
        lch0(2) = (mlab(2).^2 + mlab(3).^2).^0.5;
        lch0(3) = 46; % reset the hue to 46 degree
        center = zeros(1,2);
        center(1) = lch0(2).*cosd(lch0(3)); % create a* of center
        center(2) = lch0(2).*sind(lch0(3)); % create b* of center
        yc = center(1);
        zc = center(2);
        dp = (g(1)*(x(~index)-xc).^2+g(2)*(y(~index)-yc).^2+g(3)*(z(~index)-zc).^2+g(4)*(y(~index)-yc).*(z(~index)-zc))./(g(8)^2);
        % dp: 每个肤色像素跟喜好肤色椭球的马氏距离
        max_n=max(dp);
        min_n=min(dp);
        mean_n=max_n-min_n;  % dp最大值与最小值的差值
        w=max_n/mean_n-dp./mean_n; % 计算每一个dp值对应的w值
        lab0_new = lab;
        lab0_new(~index,1) = x(~index) + f*w.*(xc-x(~index)); % calculate new L* values
        lab0_new(~index,2) = y(~index) + f*w.*(yc-y(~index)); % calculate new a* values
        lab0_new(~index,3) = z(~index) + f*w.*(zc-z(~index)); % calculate new b* values
     
    case 'zeng'
    % C/h
        u0=0.00073397;
        u1=0.000356861;
        u2=0.0037019;
        u3=0.000150894;
        u4=-0.00248318;
        u5=0.00196303;
        dp = u0*(x-xm).^2+u1*(x-xm).*(y-ym)+u2*(y-ym).^2+u3*(x-xm).*(z-zm)+u4*(y-ym).*(z-zm)+u5*(z-zm).^2; %多项式公式
        w=1-dp; % 计算每一个dp值对应的w值
        yc=20.5;
        zc=23.3;
        lab0_new = lab;
        lab0_new(~index,2) = y(~index) + f*w(~index).*(yc-y(~index)); % calculate new a* values
        lab0_new(~index,3) = z(~index) + f*w(~index).*(zc-z(~index)); % calculate new b* values
end

%% 生成优化图片
xyznew=lab2xyz(lab0_new,'user',xyzw);
rimg=img;
rgb=lut3d_xyz2rgb(xyznew,height,weight);  % 背景不变，只变肤色部分
rimg(index(:)==0,:)=rgb(index(:)==0,:);
rimg=uint8(reshape(rimg,[size(index),3]));

lab0_new(all(skin2d==0,2),:) = [];   % 去除非肤色
mlab_new=mean(lab0_new);  % 优化后图像平均肤色中心
En= sqrt(g(1)*(mlab_new(1)-g(5)).^2+g(2)*(mlab_new(2)-g(6)).^2+g(3)*(mlab_new(3)-g(7)).^2+g(4)*(mlab_new(2)-g(6)).*(mlab_new(3)-g(7)));
SPQn=1/(1+exp(En-g(8)));  
SPQn=vpa(SPQn*100,3);  % 优化后肤色喜好度
disp(['Skin Preference Quality of enhanced image = ',char(SPQn),'%'])
str2='.\test\'; 
switch method
    case 'near distance'
        imwrite(rimg,[str2,num2str(i),'_3.jpg']);
    case 'long distance'
        imwrite(rimg,[str2,num2str(i),'_2.jpg']);
    case 'middle distance'
        imwrite(rimg,[str2,num2str(i),'_3.jpg']);
    case 'C/h'
        imwrite(rimg,[str2,num2str(i),'_4.jpg']);
    case 'zeng'
        imwrite(rimg,[str2,num2str(i),'_5.jpg']);
end
end