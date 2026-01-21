load('choicedata.mat');
for i=1:5
bb1(i,:)=b1(i,:)+b1((i+5),:)+b1((i+10),:)+b1((i+15),:)+b1((i+20),:);
bb2(i,:)=b1(i,:)+b1((i+5),:)+b1((i+10),:)+b1((i+15),:)+b1((i+20),:);
bb3(i,:)=b1(i,:)+b1((i+5),:)+b1((i+10),:)+b1((i+15),:)+b1((i+20),:);
end
bb1=zscore(bb1);
bc1=zeros(5,9);bc2=zeros(5,9);bc3=zeros(5,9);
for j=1:8
for i=1:5
cc1(i,:)=b1((i+j*25-25),:)+b1((i+j*25-20),:)+b1((i+j*25-15),:)+b1((i+j*25-10),:)+b1((i+j*25-5),:);
cc2(i,:)=b2((i+j*25-25),:)+b2((i+j*25-20),:)+b2((i+j*25-15),:)+b2((i+j*25-10),:)+b2((i+j*25-5),:);
cc3(i,:)=b3((i+j*25-25),:)+b3((i+j*25-20),:)+b3((i+j*25-15),:)+b3((i+j*25-10),:)+b3((i+j*25-5),:);
end
bc1=bc1+cc1;bc2=bc2+cc2;bc3=bc3+cc3;
end
set(gcf,'position',[100,100,900,300]); 
aa=[1,0.453125000000000,0;1,0.687500000000000,0;1,0.921875000000000,0;0.843750000000000,1,0.156250000000000;0.609375000000000,1,0.390625000000000;0.375000000000000,1,0.625000000000000;0.140625000000000,1,0.859375000000000;0,0.906250000000000,1;0,0.671875000000000,1;0,0.437500000000000,1;0,0.203125000000000,1];
c=[1,1,1,1,0.75,0.75,0.75,0.75,0.4];


subplot(1,3,1);subplot('position', [0.04 0.12 0.29 0.74]); 
h=bar3(bc1);
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
xlabel('Ambient CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
title('Oriental result');view(60,45);


subplot(1,3,2);subplot('position', [0.37 0.12 0.29 0.74]);
h=bar3(bc2);
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
xlabel('Ambient CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
title('South Asian result');view(60,45);

subplot(1,3,3);subplot('position', [0.70 0.12 0.29 0.74]); 
h=bar3(bc3);
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
xlabel('Ambient CCT');ylabel('Display Duv');zlabel('sccore');
set(gca,'yticklabel',{'-0.010','-0.005','0','+0.005','+0.010'});
set(gca,'xticklabel',{'3000 high','4000 high','5000 high','6500 high','3000 low','4000 low','5000 low', '6500 low','dark'});
title('Caucasian result');view(60,45);

sgtitle(strcat('All image display Duv & Ambient CCT score histogram'));
saveas(gcf,'Duv','png');
