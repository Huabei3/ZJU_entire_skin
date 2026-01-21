
cc1=c1(1:5,:);
cc2=c2(1:5,:);
cc3=c3(1:5,:);
for i=2:8
    cc1=cc1+c1((5*i-4):5*i,:);
    cc2=cc2+c2((5*i-4):5*i,:);
    cc3=cc3+c3((5*i-4):5*i,:);
end

% set(gcf,'position',[100,100,1200,300]);    
% % subplot(1,3,1);
% h=bar3(cc1);
% for n=1:numel(h)
%     cdata=get(h(n),'zdata');
%     set(h(n),'cdata',cdata,'facecolor','interp')
% end
% xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');colorbar;
% set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
% set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
% title('Chinese result');
% view(125,35);

% subplot(1,3,2);
% h=bar3(cc2);
% for n=1:numel(h)
%     cdata=get(h(n),'zdata');
%     set(h(n),'cdata',cdata,'facecolor','interp')
% end
% xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');colorbar;
% set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
% set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
% title('South Asian result');
% view(125,35);

% subplot(1,3,3);
% h=bar3(cc3);
% for n=1:numel(h)
%     cdata=get(h(n),'zdata');
%     set(h(n),'cdata',cdata,'facecolor','interp')
% end
% xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');colorbar;
% set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
% set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
% title('Caucasian result');
% view(125,35);
% 
% sgtitle(strcat('All',num2str(j),' preferred score histogram'));
% saveas(gcf,'scoreall','png');