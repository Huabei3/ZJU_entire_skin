clear all
load('targat2.mat');

y(:,1)=y(:,1).*1.3;
y(:,2)=y(:,2).*1;
y(:,3)=y(:,3).*0.3;
for j=19
    x(j,1)=x(j,1).*1.3;
    x(j,2:4)=x(j,2:4)*0.9;
img2=imread(strcat('./OPPO-image1/',num2str(j),'.png'));
[~,~,idx2]=imread(strcat('./OPPO-image1/',num2str(j),'.png'));
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
        d=tan((x(j,5)+y(i,3))/180*pi);
        if x(j,2)>0
        a=sqrt((x(j,4)+y(i,2)).^2./(1+d.^2));
        else
        a=-sqrt((x(j,4)+y(i,2)).^2./(1+d.^2));
        end
        b=a.*d;
        L=x(j,1)+y(i,1);
        telab(i,:)=[L,a,b];
        tlab=[L,a,b];
        dlab=tlab-mlab;                    
rlab=lab;
rlab=lab+dlab(1);
rlab=lab+dlab(2);
rlab=lab+dlab(3); %%改变颜色  
rxyz=lab2xyz(rlab,'user',xyzw);
% 
% rgb=img;
% rgb(:,1)=70;rgb(:,2)=70;rgb(:,3)=70;
% rgb(idx2(:)==1,:)=newlut3d_xyz2rgb(rxyz(idx2(:)==1,:));
rgb=newlut3d_xyz2rgb(rxyz);
bb(i)=sum(rgb(:,1)==0|rgb(:,3)==255)./size(img,1);

rimg=uint8(reshape(rgb,[400,400,3])); 
P = imresize(rimg,4); 
p=subplot(6,8,i);  
PPP=get(p,'pos');      %第NN张子图的当前位置PPP是一个1×4的行向量，
%四个值分别是用百分比表示的该子图的左下角的x、y的坐标， 宽、高的比例   
PPP(3)=PPP(3)+0.022;  
PPP(4)=PPP(4)+0.022;      
set(p,'pos',PPP)      
imshow(P);  
clear Picture;
set(gcf,'color',[70,70,70]./255);
%  imwrite(rimg,strcat('./image_effect1/image_',num2str(j),'_',num2str(i),'.png'));

end
bb=reshape(bb,8,6)';
 imshow(P);
 fig=figure(1);
%  imwrite(fig,strcat('./OPPO-image1/all_',num2str(j),'.png'));
end