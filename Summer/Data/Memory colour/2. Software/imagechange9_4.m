% 不需要扣出灰背景的单层图
 clear all
 load('target1110.mat');
for j=20
y(:,1)=y(:,1).*n(j,1);
y(:,2)=y(:,2).*n(j,2);
y(:,3)=y(:,3).*n(j,3);

img2=imread(strcat('./OPPO-image1/',num2str(j),'.png'));
img=double(img2);
img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵
w=[255,255,255]; 
xyzw =lut3d_rgb2xyz(w);
xyz=lut3d_rgb2xyz(img);
lab=xyz2lab(xyz,'user',xyzw);
mlab=sum(lab)./160000;
BigPic = cell(6, 8);

for i=1:48
        tlab=x(j,1:3)+y(i,1:3);
        ttlab(i,:)=tlab;
        telab(i,:)=tlab;
        de(i)=cielabde(x(j,1:3),tlab);
        dlab=tlab-mlab;                    

rlab(:,1)=lab(:,1)+dlab(1);
rlab(:,2)=lab(:,2)+dlab(2);
rlab(:,3)=lab(:,3)+dlab(3); %%改变颜色  
rxyz=lab2xyz(rlab,'user',xyzw);
rgb1=newlut3d_xyz2rgb(rxyz);
rimg=uint8(reshape(rgb1,[size(img2,1),size(img2,2),3])); 
imwrite(rimg,strcat('./image_effect2/new/new_image_',num2str(j),'_',num2str(i),'.png'));
P = imresize(rimg,4); 
p=subplot(6,8,i);  
PPP=get(p,'pos');      %第NN张子图的当前位置PPP是一个1×4的行向量，
% 四个值分别是用百分比表示的该子图的左下角的x、y的坐标， 宽、高的比例   
PPP(3)=PPP(3)+0.022;  
PPP(4)=PPP(4)+0.022;      
set(p,'pos',PPP)      
imshow(P);  
clear Picture;
set(gcf,'color',[128,132,130]./255);
end
 imshow(P);
 fig=figure(1);
 set(gcf,'color',[128,132,130]./255);
 saveas(gcf,strcat('45-',num2str(j),'.jpg'));
end 
