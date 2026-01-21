  load('targetall.mat');
% x(2,1)=x(2,1).*1.2;
no=[2,3,4,5,6,7,8,9,10,11,12,13,16,17,19,20,21,25];
for j=1
    i=no(j);

a=15;b=15;
x0=x(i,2);y0=x(i,3);t0=0;
r=0:pi/4:1.75*pi;r1=pi/8:pi/4:(1.75*pi+pi/8);
x3=a.*cos(r);y3=b.*sin(r);
xx3=x3.*cos(t0)-y3.*sin(t0)+x0;yy3=y3.*cos(t0)+x3.*sin(t0)+y0;
x4=a./2.*cos(r1);y4=b./2.*sin(r1);
xx4=x4.*cos(t0)-y4.*sin(t0)+x0;yy4=y4.*cos(t0)+x4.*sin(t0)+y0;
y(1:8,2)=xx3(1:8)';y(9:16,2)=xx4(1:8)';
y(1:8,3)=yy3(1:8)';y(9:16,3)=yy4(1:8)';
y(1:16,1)=x(i,1);

a=5;b=5;
x0=x(i,1);y0=x(i,2);t0=0;
t=0:pi./200:2*pi;
r=0:pi/4:1.75*pi;
x3=a.*cos(r);y3=b.*sin(r);
xx3=x3.*cos(t0)-y3.*sin(t0)+x0;yy3=y3.*cos(t0)+x3.*sin(t0)+y0;
y(17:24,1)=xx3(1:8)';
y(17:24,2)=yy3(1:8)';
y(17:24,3)=x(i,3);

a=5;b=5;
x0=x(i,1);y0=x(i,3);t0=0;
t=0:pi./200:2*pi;
r=0:pi/4:1.75*pi;
x3=a.*cos(r);y3=b.*sin(r);
xx3=x3.*cos(t0)-y3.*sin(t0)+x0;yy3=y3.*cos(t0)+x3.*sin(t0)+y0;
y(25:32,1)=xx3(1:8)';
y(25:32,3)=yy3(1:8)';
y(25:32,2)=x(i,2);
% scatter(xx3,yy3,50,'k');
% scatter(xx4,yy4,50,'k');
% scatter(x(i,2),x(i,3),100);
% % set(gcf,[100,100,500,500]);%设置要显示坐标刻度
% axis([-100 100 -100 100]);
% set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
% set(gca,'YTick',[-100:10:100]);%设置要显示坐标刻度
% grid on
% xlabel('a*');ylabel('b*');
% axis on;hold on;
% title('95% ellipse of blue sky colours in CIELAB a*-b* coordinates');


img2=imread(strcat('./OPPO-image1/',num2str(i),'.png'));
[~,~,idx2]=imread(strcat('./OPPO-image1/',num2str(i),'.png'));
idx2(idx2>0)=1;

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

BigPic = cell(4, 8);

for i1=1:32    
        tlab=y(i1,1:3);
        telab(i1,:)=tlab;
        de(i1)=cielabde([60,-5.6,-28.5],tlab);
        dlab=tlab-mlab;                    

rlab(:,1)=lab(:,1)+dlab(1);
rlab(:,2)=lab(:,2)+dlab(2);
rlab(:,3)=lab(:,3)+dlab(3); %%改变颜色  
rxyz=lab2xyz(rlab,'user',xyzw);

 rgb=img;
 rgb(:,1)=70;rgb(:,2)=70;rgb(:,3)=70;
 rgb(idx2(:)==1,:)=newlut3d_xyz2rgb(rxyz(idx2(:)==1,:));
 bb(i1)=sum(rgb(:,1)==0|rgb(:,2)==0|rgb(:,2)==0|rgb(:,1)==255|rgb(:,2)==255|rgb(:,3)==255)./size(img,1);

rimg=uint8(reshape(rgb,[400,400,3])); 
imwrite(rimg,'./image_effect1/image_a.png');
[~,~,idx1]=imread('./image_effect1/image_a.png');
idx1(idx1<10)=2;
rgb(idx1(:)==2,:)=img(idx1(:)==2,:);


rimg=uint8(reshape(rgb,[400,400,3])); 
P = imresize(rimg,4); 
p=subplot(6,8,i1);  
PPP=get(p,'pos');      %第NN张子图的当前位置PPP是一个1×4的行向量，
% 四个值分别是用百分比表示的该子图的左下角的x、y的坐标， 宽、高的比例   
PPP(3)=PPP(3)+0.022;  
PPP(4)=PPP(4)+0.022;      
set(p,'pos',PPP)      
imshow(P);  
clear Picture;
set(gcf,'color',[70,70,70]./255);

end
 imshow(P);
 fig=figure(1);
end