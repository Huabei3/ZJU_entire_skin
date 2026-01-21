% clear all
% load('center0610.mat')
% b=reshape(a,500,28);
% c=mean(b')';
% c=reshape(c,100,5);
% for i=1:5
%     e(:,1:3)=c(:,i).*d(:,1:3);
%     f(i,1:3)=sum(e(1:25,:))./sum(c(1:25,i));
%     f(i,4:6)=sum(e(26:50,:))./sum(c(26:50,i));
%     f(i,7:9)=sum(e(51:75,:))./sum(c(51:75,i));
%     f(i,10:12)=sum(e(76:100,:))./sum(c(76:100,i));
% end

color=[255,0,0;255,192,0;255,255,0;146,208,80;91,155,213]./255;
ethnic=["o","^","d","s"];
subplot(1,2,1);
for j=1:2
    for i=1:5
scatter(g(i,(j.*4-3)),g(i,(j.*4-2)),55,color(i,:),ethnic(j),'filled');hold on;
    end
    plot(g(:,(j.*4-3)),g(:,(j.*4-2)),'-','color',[0.7,0.7,0.7]);
end
    axis([12 26 12 26]);hold on
title('Compare culture and background difference','FontSize',15)
set(gca,'XTick',[12:2:26]);%设置要显示坐标刻度
set(gca,'YTick',[12:2:26]);%设置要显示坐标刻度
grid on;
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);
subplot(1,2,2);
for j=3:4
    for i=1:5
scatter(g(i,(j.*4-3)),g(i,(j.*4-2)),55,color(i,:),ethnic(j),'filled');hold on;
    end
    plot(g(:,(j.*4-3)),g(:,(j.*4-2)),'-','color',[0.7,0.7,0.7]);
end
    axis([12 26 12 26]);hold on
title('Compare culture and background difference','FontSize',15)
set(gca,'XTick',[12:2:26]);%设置要显示坐标刻度
set(gca,'YTick',[12:2:26]);%设置要显示坐标刻度
grid on;
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);
% 
% color=[255,0,0;255,192,0;255,255,0;146,208,80;91,155,213]./255;
% ethnic=["o","^","d","s"];
% for j=1:4
%     for i=1:5
% scatter(g(i,(j.*4-1)),g(i,(j.*4)),55,color(i,:),ethnic(j),'filled');hold on;
%     end
%     plot(g(:,(j.*4-1)),g(:,(j.*4)),'-','color',[0.7,0.7,0.7]);
% end
%     axis([0 40 40 80]);hold on
% title('Compare culture and background difference','FontSize',15)
% set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
% set(gca,'YTick',[40:5:80]);%设置要显示坐标刻度
% grid on;
% xlabel('C*','FontName','Times New Roman','FontSize',15);
% ylabel('L*','FontName','Times New Roman','FontSize',15);