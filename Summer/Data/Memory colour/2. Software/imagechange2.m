clear all
load('target1.mat');
for j=20 
img2=imread(strcat('./OPPO-image/',num2str(j),'.png'));
[~,~,idx2]=imread(strcat('./OPPO-image/',num2str(j),'.png'));
idx2(idx2>0)=1;

img=double(img2);
img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵

w=[255,255,255]; 
xyzw = lut3d_rgb2xyz(w);
xyz=lut3d_rgb2xyz(img);
lab=xyz2lab(xyz,'user',xyzw);
averageLab = lab;
A=double(idx2(:)==0);
averageLab(all(A==0,2),:)=[];
mlab=mean(averageLab);

% tlab=[10,10,10];                      %%目标颜色
% dlab=tlab-mlab;                    %%目标值与平均值的差异
tlab=tlab*1;
for i=1:48
rlab=lab;
rlab(idx2(:)==1,1)=lab(idx2(:)==1,1)+tlab(i,1);
rlab(idx2(:)==1,2)=lab(idx2(:)==1,2)+tlab(i,2);
rlab(idx2(:)==1,3)=lab(idx2(:)==1,3)+tlab(i,3); %%改变颜色  
rxyz=lab2xyz(rlab,'user',xyzw);
rgb=img;
rgb(idx2(:)==1,:)=newlut3d_xyz2rgb(rxyz(idx2(:)==1,:));
rimg=uint8(reshape(rgb,[400,400,3]));
% imwrite(rimg,strcat('./image_effect/image_',num2str(j),'_',num2str(i),'.png'));
end
imshow(rimg);
end