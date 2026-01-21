load('memory_par_2d3d.mat');
load('memorydata.mat');
for i=8
f=[num2str(par(i,2)),'*sqrt(','(x-',num2str(par(i,6)),')^2+',num2str(par(i,3)),'*(y-',num2str(par(i,7)),')^2+',num2str(par(i,4)),'*(x-',num2str(par(i,6)),')','*(y-',num2str(par(i,7)),'))','=',num2str(par(i,8))];
h=ezplot(f,[-100,120]);set(h,'Color',[0,0,0]);hold on;
plot(par(i,6),par(i,7),'o','Color',[0,0,0],'MarkerFaceColor',[0,0,0],'MarkerSize',7);hold on;

% f1=['sqrt(',num2str(par1(i,1)),'*(x-',num2str(par1(i,4)),')^2+',num2str(par1(i,2)),'*(y-',num2str(par1(i,5)),')^2+',num2str(par1(i,3)),'*(x-',num2str(par1(i,4)),')','*(y-',num2str(par1(i,5)),'))','=',num2str(par1(i,6))];
% h1=ezplot(f1,[-100,120]);set(h1,'Color',[0,0,1]);hold on;
% plot(par1(i,4),par1(i,5),'^','Color',[0,0,1],'MarkerFaceColor',[0,0,1],'MarkerSize',7);hold on;

text(par(i,6),par(i,7)-5,num2str(i));
% plot([par(i,6),par1(i,4)],[par(i,7),par1(i,5)],'Color',[0.3,0.3,0.3]);

  for jj=1:48
     if a1(jj,i)>0.5
    plot(b(jj,3*i-1),b(jj,3*i),'+','Color',[1,0,0],'MarkerSize',8);
%          text(b(jj,3*i-1),b(jj,3*i),num2str(a2(jj,i)),'Color',[1,0,0]);
     else
    plot(b(jj,3*i-1),b(jj,3*i),'+','Color',[0,1,0],'MarkerSize',8);
%          text(b(jj,3*i-1),b(jj,3*i),num2str(a2(jj,i)),'Color',[0,1,0]);
     end
 end
end
axis([0 100 0 100]);hold on;grid on;
set(gca,'XTick',[0:10:100]);%设置要显示坐标刻度
set(gca,'YTick',[0:10:100]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
title('Memory results on CIELAB a*b*');