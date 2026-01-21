% 不需要扣出灰背景的双层图
clear all
load('targat6.mat');

for j=22
x(j,1:3)=[49 -36	39];
y(:,1)=y(:,1).*n(j,1);
y(:,2)=y(:,2).*n(j,2);
y(:,3)=y(:,3).*n(j,3);
xx=x(j,1:3);

img2=imread(strcat('./OPPO-image3/',num2str(j),'-1.png'));
[~,~,idx2]=imread(strcat('./OPPO-image3/',num2str(j),'-1.png'));
idx2(idx2>0)=1;
img3=imread(strcat('./OPPO-image3/',num2str(j),'-2.png'));
[~,~,idx3]=imread(strcat('./OPPO-image3/',num2str(j),'-2.png'));
idx3(idx3>0)=1;

img=double(img2);
img=reshape(img,size(img,1)*size(img,2),3);  %% 读图，转为一维矩阵

w=[255,255,255]; 
xyzw = lut3d_rgb2xyz(w);
xyz=lut3d_rgb2xyz(img);
lab=xyz2lab(xyz,'user',xyzw);
averageLab = lab;
A=double(idx2(:)==0);
averageLab(all(A==1,2),:)=[];
mlab=mean(averageLab);

BigPic = cell(6, 8);
% set(Figure1,'color',[70,70,70]./255);
for i=1:48
        tlab=x(j,1:3)+y(i,1:3);
        ttlab(i,:)=tlab;
        telab(i,:)=tlab;
        de(i)=cielabde(x(j,1:3),tlab);
        dlab=tlab-mlab;                    
% 
rlab(:,1)=lab(:,1)+dlab(1);
rlab(:,2)=lab(:,2)+dlab(2);
rlab(:,3)=lab(:,3)+dlab(3); %%改变颜色  
rxyz=lab2xyz(rlab,'user',xyzw);
txyz=lab2xyz(tlab,'user',xyzw);
rgb1=newlut3d_xyz2rgb(txyz);
rgb=img;

xx1=lab2xyz(xx,'user',xyzw);
xx2=newlut3d_xyz2rgb(xx1);
rgb(:,1)=xx2(1);rgb(:,2)=xx2(2);rgb(:,3)=xx2(3); %gray background L=[50,0,0]
% rgb(:,1)=154;rgb(:,2)=158;rgb(:,3)=156; %gray background L=[60,0,0]
rgb(idx2(:)==1,:)=newlut3d_xyz2rgb(rxyz(idx2(:)==1,:));

[m,n]=find(rgb==0);
for mm=1:size(m,1)./3;
rgb(m(mm),:)=rgb1;
end
bb(i)=sum(rgb(:,1)==0|rgb(:,2)==0|rgb(:,2)==0|rgb(:,1)==255|rgb(:,2)==255|rgb(:,3)==255)./size(img,1);


rimg=uint8(reshape(rgb,[size(img2,1),size(img2,2),3])); 
% imwrite(rimg,'./image_effect1/image_a.png');
% [~,~,idx1]=imread('./image_effect1/image_a.png');
% idx1(idx1<10)=2;
% rgb(idx1(:)==2,:)=img(idx1(:)==2,:);
% rgb(idx3(:)==1,1)=0;rgb(idx3(:)==1,2)=0;rgb(idx3(:)==1,3)=0;


rimg=uint8(reshape(rgb,[size(img2,1),size(img2,2),3])); 
for ri=1:size(img2,1)
    for rj=1:size(img2,2)
        if idx3(ri,rj)==1
 rimg(ri,rj,:)=img3(ri,rj,:);
        end
    end
end
% rimg=rimg+img3;
imwrite(rimg,strcat('./image_effect2/image_',num2str(j),'_',num2str(i),'.png'));
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
tplab(:,5*j-4:5*j-2)=ttlab;
bb=reshape(bb,8,6)'; 
ttlab(:,4)=de;
ttt=[xx,0;ttlab];
 imshow(P);
 fig=figure(1);
end
