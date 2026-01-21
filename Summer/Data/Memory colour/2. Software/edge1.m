clear all
for j=20
img1=imread(strcat('./OPPO-image/',num2str(j),'.png'));
img=double(img1);

img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵
img(img(:,1)==0,:)=255;
w=[255,255,255]; 
xyzw=lut3d_rgb2xyz(w);
xyz=lut3d_rgb2xyz(img);
lab=xyz2lab(xyz,'user',xyzw);

lab1=lab; 
lab(lab(:,2)==0,1)=0;
idx=(lab~=0);
mlab=sum(lab(:,1:3))./(sum(idx(:))./3);
clab=[0 0 0],
mmlab(1:size(img1,1).*size(img1,2),1)=mlab(1)+clab(1);
mmlab(1:size(img1,1).*size(img1,2),2)=mlab(2)+clab(2);
mmlab(1:size(img1,1).*size(img1,2),3)=mlab(3)+clab(3);
dlab=mmlab-lab1;                    %%目标值与平均值的差异

rxyz=lab2xyz(dlab,'user',xyzw);
rgb=newlut3d_xyz2rgb(rxyz);
rgb(rgb(:,1)==0,:)=0;
rimg=uint8(reshape(rgb,[size(img1,1),size(img1,2),3]));

imwrite(rimg,strcat('center_1_2_',num2str(j),'.png'));
imshow(rimg);
end