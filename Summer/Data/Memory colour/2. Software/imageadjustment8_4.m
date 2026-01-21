%  clear all
%  load('targat6.mat');

for j=5
y(:,1)=y(:,1).*n(j,1);
y(:,2)=y(:,2).*n(j,2);
y(:,3)=y(:,3).*n(j,3);
xx=x(j,1:3);

img2=imread(strcat('./OPPO-image3/',num2str(j),'.png'));
[~,~,idx2]=imread(strcat('./OPPO-image3/',num2str(j),'.png'));
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

BigPic = cell(6, 8);
% set(Figure1,'color',[70,70,70]./255);
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
txyz=lab2xyz(tlab,'user',xyzw);
rgb1=newlut3d_xyz2rgb(txyz);
rgb=img;
rgb=newlut3d_xyz2rgb(rxyz);
[~,~,idx1]=imread(strcat('./OPPO-image3/',num2str(j),'.png'));
idx1(idx1==0)=2;
rgb(idx1(:)==2,:)=img(idx1(:)==2,:);

bb(i)=sum(rgb(:,1)==0|rgb(:,2)==255)./size(img,1);

% rimg=uint8(reshape(rgb,[400,400,3])); 

% [~,~,idx1]=imread('./image_effect1/image_a.png');
% idx1(idx1<10)=2;
% rgb(idx1(:)==2,:)=img(idx1(:)==2,:);

rimg=uint8(reshape(rgb,[size(img2,1),size(img2,2),3])); 
% imwrite(rimg,strcat('./image_effect2/image_',num2str(j),'_',num2str(i),'.png'));
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
% bb=reshape(bb,6,8)';
% ttlab=[ttlab,de'];
% tplab(:,5*j-4:5*j-2)=ttlab;
% ttt=[xx,0;ttlab];
%  imshow(P);
%  fig=figure(1);
%  set(gcf,'color',[128,132,130]./255);
%  saveas(gcf,strcat('45-',num2str(j),'.jpg'));
end