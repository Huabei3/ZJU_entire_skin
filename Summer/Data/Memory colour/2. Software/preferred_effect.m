clear all
load('targat6.mat');

for j=20
img2=imread(strcat('./OPPO-image3/',num2str(j),'.png'));
% [~,~,idx2]=imread(strcat('./OPPO-image3/',num2str(j),'.png'));
% idx2(idx2>0)=1;
img=double(img2);
img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵
w=[255,255,255]; 
xyzw = lut3d_rgb2xyz(w);
xyz=lut3d_rgb2xyz(img);
lab=xyz2lab(xyz,'user',xyzw);
averageLab = lab;
% A=double(idx2(:)==0);
% averageLab(all(A==1,2),:)=[];
 mlab=mean(averageLab);
        tlab=[45.9 	-59.6 	66.4 ];
        ttlab=tlab;
        telab=tlab;
        dlab=tlab-mlab;                    
rlab(:,1)=lab(:,1)+dlab(1);
rlab(:,2)=lab(:,2)+dlab(2);
rlab(:,3)=lab(:,3)+dlab(3); %%改变颜色  
rxyz=lab2xyz(rlab,'user',xyzw);
txyz=lab2xyz(tlab,'user',xyzw);
rgb1=newlut3d_xyz2rgb(rxyz);
% rgb=img;
% rgb(:,1)=128;rgb(:,2)=132;rgb(:,3)=130;
% rgb(idx2(:)==1,:)=newlut3d_xyz2rgb(rxyz(idx2(:)==1,:));
% [m,n]=find(rgb==0);
% for mm=1:size(m,1)./3;
% rgb(m(mm),:)=rgb1;
% end
% rimg=uint8(reshape(rgb,[size(img2,1),size(img2,2),3])); 
% [~,~,idx1]=imread('./image_effect1/image_a.png');
% idx1(idx1<10)=2;
% rgb(idx1(:)==2,:)=img(idx1(:)==2,:);
rimg=uint8(reshape(rgb1,[size(img2,1),size(img2,2),3])); 
imshow(rimg);
tplab(:,j*5-4:j*5-2)=ttlab(:,1:3);
end
