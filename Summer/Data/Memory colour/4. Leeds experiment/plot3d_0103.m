clear all;
fig=figure();
set(fig,'Position', [100 100 900 700]);
load('plot3d_0103.mat');
%===========exemple LCh===================================================
i=1;
[x,y,z]=meshgrid(linspace(-100,100,401));
val=par(i,1).*(z-par(i,5)).^2+par(i,2).*(x-par(i,6)).^2+par(i,3).*(y-par(i,7)).^2+par(i,4).*(x-par(i,6)).*(y-par(i,7));
[f,v]=isosurface(x,y,z,val,par(i,8).^2);
subplot(1,3,1);
v2(:,1)=v(:,1);v2(:,2)=v(:,3);v2(:,3)=v(:,2);
patch('Faces',f,'Vertices',v2,'facecolor','w','edgecolor','flat','CData',v2(:,3))
grid on;view(3);
axis([0 100 0 100 0 360]);axis equal;grid on;hold on;
xlabel('C*ab','FontSize',10);
ylabel('hab*','FontSize',10);
zlabel('L*','FontSize',10);
set(gca,'XTick',[0:2:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:2:100]);%设置要显示坐标刻度
set(gca,'ZTick',[0:2:360]);%设置要显示坐标刻度
%===========exemple LCh 2 lab===================================================
subplot(1,3,2);
v1(:,1)=v(:,1)./sqrt(1+tan(v(:,3)./180.*pi).^2);
v1(:,2)=sqrt(v(:,1).^2-v1(:,1).^2);
v1(:,3)=v(:,2);
patch('Faces',f,'Vertices',v1,'facecolor','w','edgecolor','flat','CData',v1(:,3))
grid on;view(3);
axis([0 100 0 100 0 360]);axis equal;grid on;hold on;
xlabel('a*','FontSize',10);
ylabel('b*','FontSize',10);
zlabel('L*','FontSize',10);
set(gca,'XTick',[0:2:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:2:100]);%设置要显示坐标刻度
set(gca,'ZTick',[0:2:100]);%设置要显示坐标刻度
% %===========exemple lab===================================================
par=par2;
val=par(i,1).*(z-par(i,5)).^2+par(i,2).*(x-par(i,6)).^2+par(i,3).*(y-par(i,7)).^2+par(i,4).*(x-par(i,6)).*(y-par(i,7));
[f,v3]=isosurface(x,y,z,val,par(i,8).^2);
subplot(1,3,3);
patch('Faces',f,'Vertices',v3,'facecolor','w','edgecolor','flat','CData',v3(:,3))
grid on;view(3);
axis([0 100 0 100 0 360]);axis equal;grid on;hold on;
xlabel('a*','FontSize',10);
ylabel('b*','FontSize',10);
zlabel('L*','FontSize',10);
set(gca,'XTick',[0:2:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:2:100]);%设置要显示坐标刻度
set(gca,'ZTick',[0:2:100]);%设置要显示坐标刻度
%===========================2d====================================
% j=[1,2,3,6,7,8,9,10,11,12,13,14,15,16,18,19,21,23,24];
% for ii=1:19;
%     i=j(ii);
% subplot(4,6,i);
% [x,y,z]=meshgrid(linspace(-100,100,101));
% val=par(i,1).*(z-par(i,5)).^2+par(i,2).*(x-par(i,6)).^2+par(i,3).*(y-par(i,7)).^2+par(i,4).*(x-par(i,6)).*(y-par(i,7));
% [f,v]=isosurface(x,y,z,val,par(i,8).^2);
% patch('Faces',f,'Vertices',v,'facecolor','w','edgecolor','flat','CData',v(:,3))
% grid on;view(3);
% axis([0 100 0 100 0 360]);axis equal;grid on;hold on;
% xlabel('C*ab','FontSize',10);
% ylabel('L*','FontSize',10);
% zlabel('hab*','FontSize',10);
% set(gca,'XTick',[0:10:100]);%设置要显示坐标刻度
% set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
% set(gca,'ZTick',[0:10:360]);%设置要显示坐标刻度
% end
%======================3d==========================================
% par=par1;
% j=[1,2,3,4,6,7,8,9,10,11,12,14,15,16,18,19,20,21,22,24];
% for ii=1:20;
%     i=j(ii);
% subplot(4,6,i);
% [x,y,z]=meshgrid(linspace(-100,100,101));
% % val=par(i,1).*(z-par(i,5)).^2+par(i,2).*(x-par(i,6)).^2+par(i,3).*(y-par(i,7)).^2+par(i,4).*(x-par(i,6)).*(y-par(i,7))+par(i,9).*(z-par(i,5)).*(x-par(i,6))+par(i,10).*(z-par(i,5)).*(y-par(i,7));
% val=par(i,1).*(z-par(i,5)).^2+par(i,2).*(x-par(i,6)).^2+par(i,3).*(y-par(i,7)).^2+par(i,4).*(x-par(i,6)).*(y-par(i,7));
% [f,v]=isosurface(x,y,z,val,par(i,8).^2);
% patch('Faces',f,'Vertices',v,'facecolor','w','edgecolor','flat','CData',v(:,3))
% grid on;view(3);
% axis([0 100 0 100 0 360]);axis equal;grid on;hold on;
% xlabel('C*ab','FontSize',10);
% ylabel('L*','FontSize',10);
% zlabel('hab*','FontSize',10);
% set(gca,'XTick',[0:10:100]);%设置要显示坐标刻度
% set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
% set(gca,'ZTick',[0:10:360]);%设置要显示坐标刻度
% end