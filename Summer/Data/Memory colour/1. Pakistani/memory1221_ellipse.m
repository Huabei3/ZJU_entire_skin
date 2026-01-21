clear all
load('data1221c.mat');
for i=9
    set(gcf,'position',[100,100,800,320]);
%===================== ellipses ===========================================
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=a1(:,i);
 f1=@(a,xdata)(1./(1+exp(a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
      options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1,-2,-1],[0.5,2,6,6,c(2,:),4,1,1],options);
%    a=lsqcurvefit(f1,a0,xdata,ydata,[-inf,0,-inf,-inf,-inf,-inf,-inf,-inf],[inf,inf,inf,inf,inf,inf,inf,inf],options);
%     a=lsqcurvefit(f1,a0,xdata,ydata,[-inf,0,-inf,-inf,c(1,:),-inf,-inf,-inf],[inf,inf,inf,inf,c(2,:),inf,inf,inf],options);
   y=(1./(1+exp(a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7))+a(9).*(xdata(:,1)-a(5)).*(xdata(:,2)-a(6))+a(10).*(xdata(:,1)-a(5)).*(xdata(:,3)-a(7)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:10)=afinal;    
%======================= subplot1 =========================================    
subplot(1,3,1);
subplot('position', [0.04 0.12 0.29 0.74]); 
fab=[num2str(par(i,2)),'*sqrt(','(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
hab=ezplot(fab,[-100,120]);set(hab,'Color',[0,0,0]);hold on;
plot(par(i,6),par(i,7),'o','Color',[0,0,1],'MarkerFaceColor',[0,0,1],'MarkerSize',3);hold on;
text(par(i,6),par(i,7)-5,num2str(i));
 for j=1:16
     if a1(j,i)>0.5
         plot(b(j,3*i-1),b(j,3*i),'+','Color',[1,0,0],'MarkerSize',8);
     else
         plot(b(j,3*i-1),b(j,3*i),'x','Color',[0,1,0],'MarkerSize',8);
     end
 end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([30 70 -40 0]);hold on;grid on;
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title(strcat('Image',num2str(i),'results on CIELAB a*b*'));
%======================= subplot2 =========================================
subplot(1,3,2);
subplot('position', [0.37 0.12 0.29 0.74]); 
fal=[num2str(par(i,2)),'*sqrt(','(x-',num2str(par(i,6)),')^2+',num2str(par(i,1)),'*(y-',num2str(par(i,5)),')^2+',num2str(par(i,9)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,5)),'))','=',num2str(par(i,8))];
hal=ezplot(fal,[-100,120]);set(hal,'Color',[0,0,0]);hold on;
plot(par(i,6),par(i,5),'o','Color',[0,0,1],'MarkerFaceColor',[0,0,1],'MarkerSize',3);hold on;
text(par(i,6),par(i,5)-5,num2str(i));
 for j=17:32
     if a1(j,i)>0.5
         plot(b(j,3*i-1),b(j,3*i-2),'+','Color',[1,0,0],'MarkerSize',8);
     else
         plot(b(j,3*i-1),b(j,3*i-2),'x','Color',[0,1,0],'MarkerSize',8);
     end
 end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([30 70 15 55]);hold on;grid on;
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('L*','FontSize',15);
title(strcat('Image',num2str(i),'results on CIELAB a*L*'));
%======================= subplot3 =========================================
subplot(1,3,3);
subplot('position', [0.70 0.12 0.29 0.74]);; 
fbl=[num2str(par(i,2)),'*sqrt(',num2str(par(i,3)),'*(x-',num2str(par(i,7)),')^2+',num2str(par(i,1)),'*(y-',num2str(par(i,5)),')^2+',num2str(par(i,10)),'*(x-',num2str(par(i,7)),')','*(y-',num2str(par(i,5)),'))','=',num2str(par(i,8))];
hbl=ezplot(fbl,[-100,120]);set(hbl,'Color',[0,0,0]);hold on;
plot(par(i,7),par(i,5),'o','Color',[0,0,1],'MarkerFaceColor',[0,0,1],'MarkerSize',3);hold on;
text(par(i,7),par(i,5)-5,num2str(i));
 for j=33:48
     if a1(j,i)>0.5
         plot(b(j,3*i),b(j,3*i-2),'+','Color',[1,0,0],'MarkerSize',8);
     else
         plot(b(j,3*i),b(j,3*i-2),'x','Color',[0,1,0],'MarkerSize',8);
     end
 end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
axis([-40 0 15 55]);hold on;grid on;
set(gca,'XTick',[-100:5:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:5:100]);%设置要显示坐标刻度
xlabel('b*','FontSize',15);
ylabel('L*','FontSize',15);
title(strcat('Image',num2str(i),'results on CIELAB b*L*'));
saveas(gcf,strcat('Memory1221_image_',num2str(i),'.tif'));
end

