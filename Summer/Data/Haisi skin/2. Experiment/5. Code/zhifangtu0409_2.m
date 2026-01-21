
cc1=c1(1:5,:);
cc2=c2(1:5,:);
cc3=c3(1:5,:);
for i=2:8
    cc1=cc1+c1((5*i-4):5*i,:);
    cc2=cc2+c2((5*i-4):5*i,:);
    cc3=cc3+c3((5*i-4):5*i,:);
end
aa=[1,0.687500000000000,0;1,0.921875000000000,0;0.843750000000000,1,0.156250000000000;0.609375000000000,1,0.390625000000000;0,0.906250000000000,1;0,0.671875000000000,1;0,0.437500000000000,1;0,0.203125000000000,1];
c=[1,1,1,1,0.75,0.75,0.75,0.75,0.4];
set(gcf,'position',[100,100,1200,300]);    
subplot(1,3,1);
h=bar3(cc1);
cm = get(gcf,'colormap');  % Use the current colormap.
cnt = 0;
for jj = 1:length(h)
    xd = get(h(jj),'xdata');
    yd = get(h(jj),'ydata');
    zd = get(h(jj),'zdata');
    delete(h(jj))    
    idx = [0;find(all(isnan(xd),2))];
    if jj == 1
        S = zeros(length(h)*(length(idx)-1),1);
        dv = floor(size(cm,1)/length(S));
    end
    for ii = 1:length(idx)-1
        cnt = cnt + 1;
        S(cnt) = surface(xd(idx(ii)+1:idx(ii+1)-1,:),...
                         yd(idx(ii)+1:idx(ii+1)-1,:),...
                         zd(idx(ii)+1:idx(ii+1)-1,:),...
                         'facecolor',cm((cnt-1)*dv+1,:));
    end
end
for iii=1:9
for ii=1:5
set(S(ii+iii.*5-5),'facecolor',aa(ii,:).*c(iii));
end
end
xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Chinese result');
view(125,35);

subplot(1,3,2);
h=bar3(cc2);
cm = get(gcf,'colormap');  % Use the current colormap.
cnt = 0;
for jj = 1:length(h)
    xd = get(h(jj),'xdata');
    yd = get(h(jj),'ydata');
    zd = get(h(jj),'zdata');
    delete(h(jj))    
    idx = [0;find(all(isnan(xd),2))];
    if jj == 1
        S = zeros(length(h)*(length(idx)-1),1);
        dv = floor(size(cm,1)/length(S));
    end
    for ii = 1:length(idx)-1
        cnt = cnt + 1;
        S(cnt) = surface(xd(idx(ii)+1:idx(ii+1)-1,:),...
                         yd(idx(ii)+1:idx(ii+1)-1,:),...
                         zd(idx(ii)+1:idx(ii+1)-1,:),...
                         'facecolor',cm((cnt-1)*dv+1,:));
    end
end
for iii=1:9
for ii=1:5
set(S(ii+iii.*5-5),'facecolor',aa(ii,:).*c(iii));
end
end
xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('South Asian result');
view(125,35);

subplot(1,3,3);
h=bar3(cc3);
cm = get(gcf,'colormap');  % Use the current colormap.
cnt = 0;
for jj = 1:length(h)
    xd = get(h(jj),'xdata');
    yd = get(h(jj),'ydata');
    zd = get(h(jj),'zdata');
    delete(h(jj))    
    idx = [0;find(all(isnan(xd),2))];
    if jj == 1
        S = zeros(length(h)*(length(idx)-1),1);
        dv = floor(size(cm,1)/length(S));
    end
    for ii = 1:length(idx)-1
        cnt = cnt + 1;
        S(cnt) = surface(xd(idx(ii)+1:idx(ii+1)-1,:),...
                         yd(idx(ii)+1:idx(ii+1)-1,:),...
                         zd(idx(ii)+1:idx(ii+1)-1,:),...
                         'facecolor',cm((cnt-1)*dv+1,:));
    end
end
for iii=1:9
for ii=1:5
set(S(ii+iii.*5-5),'facecolor',aa(ii,:).*c(iii));
end
end
xlabel('Ambient CCT');ylabel('Display CCT');zlabel('sccore');
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Caucasian result');
view(125,35);

sgtitle(strcat('All',num2str(j),' preferred score histogram'));
saveas(gcf,'scoreall','png');