clear all
fig=figure();
set(fig,'Position', [100 100 600 600]);
for i=1:24
%====================CH(Leeds)==========================================
 load('Leeds_all_1226.mat');
% load('data1221p.mat');
for j=1:28  
cc(:,j*3)=b(:,j*3-2); 
cc(:,j*3-1)=sqrt(b(:,j*3-1).^2+b(:,j*3).^2);
cc(:,j*3-2)=atan2(b(:,j*3),b(:,j*3-1))./pi.*180;
end 
b=cc;
c(1,1:3)=min(b(:,3*i-2:3*i));
c(2,1:3)=max(b(:,3*i-2:3*i));
 xdata=b(:,3*i-2:3*i);
 ydata=ap(:,i);
 f1=@(a,xdata)(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[0,0,0,-5,c(1,:),1],[0.5,2,6,6,c(2,:),4],options);
     y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);
     r=corrcoef(y,ydata);
     if r(1,2) >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:8)=afinal;
 par=real(par);
 par(i,1:3)=par(i,1:3).*3;
 a=afinal;
 y=(1./(1+exp(sqrt(a(1)*(xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8)))).*(((xdata(:,1)-a(5)).^2+a(2).*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))>=0);hold on;
 r=corrcoef(y,ydata);
 par(i,9)=r(1,2);
f=['sqrt(',num2str(par(i,2)),'*(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[0.2,0.2,0.2]);hold on;
text(par(i,6)+1,par(i,7),num2str(i),'fontsize',10);
plot(par(i,6),par(i,7),'o','Color',[0.2,0.2,0.2],'MarkerFaceColor',[0.2,0.2,0.2],'MarkerSize',6);hold on;

title(strcat('Memory colour ',num2str(i),' on CIELAB C*L*'));
axis([0 100 0 100]);hold on;grid on;
set(gca,'XTick',[-100:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[-100:10:120]);%设置要显示坐标刻度
xlabel('C*ab','FontSize',15);
ylabel('L*','FontSize',15);
end
plot([0,0],[-100,120],'Color',[0.5,0.5,0.5]);
plot([-100,100],[0,0],'Color',[0.5,0.5,0.5]);
