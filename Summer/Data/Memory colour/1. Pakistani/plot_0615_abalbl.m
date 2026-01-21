 clear all
 load('data1221c.mat');
for i=1
    set(gcf,'position',[100,100,800,320]);
%===================== ellipses ===========================================
% output: par = [k1,k2,k3,k4,l0,a0,b0,alpha]
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=a3(:,i);
 f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1],[0.5,2,6,6,c(2,:),4],options);
     y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:8)=afinal;
 a=afinal;
%======================= subplot1 =========================================    
subplot(1,3,1);
subplot('position', [0.04 0.12 0.29 0.74]); 
fab=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
hab=ezplot(fab,[-100,120]);set(hab,'Color',[0,0,0]);hold on;
text(par(i,6)+5,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'o','Color',[0,0,0],'MarkerFaceColor',[0.5,0,0],'MarkerSize',3);hold on;
for j=1:16
     if a3(j,i)>0.5
         plot(b(j,3*i-1),b(j,3*i),'+','Color',[0.7,0,0]);
     else
         plot(b(j,3*i-1),b(j,3*i),'X','Color',[0,0.6,0]);
     end
 end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([30 70 20 60]);hold on;grid on;
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',8);
ylabel('b*','FontSize',8);
title(strcat('results on CIELAB a*b*'));
%======================= subplot2 =========================================
subplot(1,3,2);
subplot('position', [0.37 0.12 0.29 0.74]); 
fal=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,1)),'*(y-',num2str(par(i,5)),')^2)','=',num2str(par(i,8))];
hal=ezplot(fal,[-100,120]);set(hal,'Color',[0,0,0]);hold on;
text(par(i,6)+1,par(i,5),num2str(i),'fontsize',10);
plot(par(i,6),par(i,5),'o','Color',[0,0,0],'MarkerFaceColor',[0.5,0,0],'MarkerSize',3);hold on;
for j=17:32
     if a3(j,i)>0.5
         plot(b(j,3*i-1),b(j,3*i-2),'+','Color',[0.7,0,0]);
     else
         plot(b(j,3*i-1),b(j,3*i-2),'X','Color',[0,0.6,0]);
     end
 end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([30 70 15 55]);hold on;grid on;
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',8);
ylabel('L*','FontSize',8);
title(strcat('results on CIELAB a*L*'));
%======================= subplot2 =========================================
subplot(1,3,3);
subplot('position', [0.70 0.12 0.29 0.74]);; 
fbl=['sqrt(',num2str(par(i,3)),'*(x-',num2str(par(i,7)),')^2+',num2str(par(i,1)),'*(y-',num2str(par(i,5)),')^2)','=',num2str(par(i,8))];
hbl=ezplot(fbl,[-100,120]);set(hbl,'Color',[0,0,0]);hold on;
text(par(i,7)+1,par(i,5),num2str(i),'fontsize',10);
plot(par(i,7),par(i,5),'o','Color',[0,0,0],'MarkerFaceColor',[0.5,0,0],'MarkerSize',3);hold on;
for j=33:48
     if a3(j,i)>0.5
         plot(b(j,3*i),b(j,3*i-2),'+','Color',[0.7,0,0]);
     else
         plot(b(j,3*i),b(j,3*i-2),'X','Color',[0,0.6,0]);
     end
 end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([20 60 15 55]);hold on;grid on;
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
xlabel('b*','FontSize',8);
ylabel('L*','FontSize',8);
title(strcat('results on CIELAB b*L*'));
saveas(gcf,strcat('Memory0813_image_',num2str(i),'.tif'));
end

