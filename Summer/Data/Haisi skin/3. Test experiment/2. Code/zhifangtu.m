clear all
load('center0610.mat')
sum(reshape(a,500,28)');
b=ans';
b=reshape(b,100,5);
c=b(1:25,:)+b(26:50,:)+b(51:75,:)+b(76:100,:);
cc(1,:)=sum(c(1:5,:));
cc(2,:)=sum(c(6:10,:));
cc(3,:)=sum(c(11:15,:));
cc(4,:)=sum(c(16:20,:));
cc(5,:)=sum(c(21:25,:));
% cc(1,:)=(c(5,:));
% cc(2,:)=(c(10,:));
% cc(3,:)=(c(15,:));
% cc(4,:)=(c(20,:));
% cc(5,:)=(c(25,:));
dd(1,:)=c(1,:)+c(6,:)+c(11,:)+c(16,:)+c(21,:);
dd(2,:)=c(2,:)+c(7,:)+c(12,:)+c(17,:)+c(22,:);
dd(3,:)=c(3,:)+c(8,:)+c(13,:)+c(18,:)+c(23,:);
dd(4,:)=c(4,:)+c(9,:)+c(14,:)+c(19,:)+c(24,:);
dd(5,:)=c(5,:)+c(10,:)+c(15,:)+c(20,:)+c(25,:);

cc=cc./1120;dd=dd./1120;
h=bar3(cc);
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
aa=[1,0.453125000000000,0;1,0.687500000000000,0;1,0.921875000000000,0;0.843750000000000,1,0.156250000000000;0.609375000000000,1,0.390625000000000;0.375000000000000,1,0.625000000000000;0.140625000000000,1,0.859375000000000;0,0.906250000000000,1;0,0.671875000000000,1;0,0.437500000000000,1;0,0.203125000000000,1];
for iii=1:5
for ii=1:5
set(S(ii+iii.*5-5),'facecolor',aa(ii,:));
end
end
% set(gca,'zticklabel',{'0%','50%','100%'});
 set(gca,'zticklabel',{'0%','20%','40%','60%','80%','100%'});

xlabel('Ambient CCT');ylabel('Display CCT');zlabel('P%');
set(gca,'xticklabel',{'8000K','6500k','5000K','4000K','3000K'});
set(gca,'yticklabel',{'4000K','5000K','6500K','8000K','10000K'});
title('Mean preferred result Duv=all');view(60,45);
