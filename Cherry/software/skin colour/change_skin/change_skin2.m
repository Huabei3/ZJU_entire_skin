I=double(imread('GU_M.png'));
[ ~,~,temp ] = skin_det( I );
idx=double(~temp);                               %%得到index

[~,~,idx1]=imread('GU_M.png');
idx1(idx1>0)=1;
[~,~,idx3]=imread('GU_M_Skin.png');
idx3(idx3>0)=1;
idx0=idx1-idx3;  

img=double(imread('GU_M.png'));
height=size(img,1);
weight=size(img,2);
img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵

w=[255,255,255]; 
xyzw = lut3d_rgb2xyz(w);
xyz=lut3d_rgb2xyz(img);
lab=xyz2lab(xyz,'user',xyzw);
averageLab = lab;
A=double(idx0(:)==0);
averageLab(all(A==0,2),:)=[];
mlab=mean(averageLab);

load TargetLab_Chinese.mat  TargetLab          %%椭圆上的目标取点,对应L,a,b

for i=1:49
    rlab=lab;
    tlab=TargetLab(i,:);
    dlab=tlab-mlab;                    %%目标值与平均值的差异
    rlab(idx(:)==0,1)=rlab(idx(:)==0,1)+dlab(1);
    rlab(idx(:)==0,2)=rlab(idx(:)==0,2)+dlab(2);
    rlab(idx(:)==0,3)=rlab(idx(:)==0,3)+dlab(3);        %%改变颜色
    
    rxyz=lab2xyz(rlab,'user',xyzw);
    rimg=img;
    %rgb(idx(:)==0,:)=newlut3d_xyz2rgb(rxyz(idx(:)==0,:));
    rgb=lut3d_xyz2rgb(rxyz,height,weight);
    rimg(idx(:)==0,:)=rgb(idx(:)==0,:);
    rimg=uint8(reshape(rimg,[size(idx),3]));
    imwrite(rimg,strcat('GU_M',num2str(i),'.png'),'png');
end
