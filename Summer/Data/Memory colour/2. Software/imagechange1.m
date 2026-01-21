clear all
load('target1.mat');
img1=imread(strcat('./OPPO-image/1.png'));
[~,~,idx2]=imread(strcat('./OPPO-image/1.png'));
idx2(idx2>0)=1;
img=double(img1);
img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵
img(img(:,1)==0,:)=255;
w=[255,255,255]; 
xyzw=lut3d_rgb2xyz(w);
xyz=lut3d_rgb2xyz(img);
lab=xyz2lab(xyz,'user',xyzw);
averageLab = lab;
A=double(idx2(:)==0);
averageLab(all(A==0,2),:)=[];
mlab=mean(averageLab);

clab=[57 10 73 ];                      %%目标颜色
tlab=tlab;
for i=1:48
rlab=lab;
mmlab(1:size(img1,1).*size(img1,2),1)=tlab(i,1)-mlab(1)+clab(1);
mmlab(1:size(img1,1).*size(img1,2),2)=tlab(i,2)-mlab(2)+clab(2);
mmlab(1:size(img1,1).*size(img1,2),3)=tlab(i,3)-mlab(3)+clab(3);%%改变颜色 
dlab=lab+mmlab;          %%目标值与平均值的差异
% flab(1:size(img1,1).*size(img1,2),1)=tlab(i,1)+lab1(1); 
% flab(1:size(img1,1).*size(img1,2),2)=tlab(i,2)+lab1(2);
% flab(1:size(img1,1).*size(img1,2),3)=tlab(i,3)+lab1(3);%%改变颜色 

rxyz=lab2xyz(dlab,'user',xyzw);
rgb=img;
rgb(idx2(:)==1,:)=newlut3d_xyz2rgb(rxyz(idx2(:)==1,:));

rimg=uint8(reshape(rgb,[size(img1,1),size(img1,2),3]));
imwrite(rimg,strcat('center_',num2str(i),'_0_1.png'));
end
% imshow(rimg);