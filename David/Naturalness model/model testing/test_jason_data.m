load grasslab;
load skinlab;
load skylab;
load jasondata_naturalness;


% for i = 1:490
%     load n_sky_2d
%     lab0 = skylab(i,:);
%     n(i,:) = (1./(1+exp(par(1)*sqrt((lab0(:,2)-par(5)).^2+par(2)*(lab0(:,3)-par(6)).^2+...
%         par(3)*(lab0(:,2)-par(5)).*(lab0(:,3)-par(6)))-par(4))));
% end
% scatter(n(1:490,:),naturalness(1:490,:),'b')
% hold on;
% for i = 491:980
%     load n_sg_2d
%     lab0 = grasslab(i-490,:);
%     n(i,:) = (1./(1+exp(par(1)*sqrt((lab0(:,2)-par(5)).^2+par(2)*(lab0(:,3)-par(6)).^2+...
%         par(3)*(lab0(:,2)-par(5)).*(lab0(:,3)-par(6)))-par(4))));
% end
% scatter(n(491:980,:),naturalness(491:980,:),'g')

% for i = 981:1470
%     load n_skin_2d
%     lab0 = skinlab(i-980,:);
%     n(i,:) = (1./(1+exp(par(1)*sqrt((lab0(:,2)-par(5)).^2+par(2)*(lab0(:,3)-par(6)).^2+...
%         par(3)*(lab0(:,2)-par(5)).*(lab0(:,3)-par(6)))-par(4))));
% end

n = [];

templab = [];
tempn = [];
for i = 1:10
    templab = [templab;skylab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness((i-1)*49+1:(i-1)*49+49,:)];
end
load n_sky_2d
n = [n;(1./(1+exp(par(1)*sqrt((templab(:,2)-par(5)).^2+par(2)*(templab(:,3)-par(6)).^2+par(3)*(templab(:,2)-par(5)).*(templab(:,3)-par(6)))-par(4))))];

templab = [];
for i = [1 2 3 5 6 7 9 10]
    templab = [templab;grasslab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness(490+(i-1)*49+1:490+(i-1)*49+49,:)];
end
load n_sg_2d
n = [n;(1./(1+exp(par(1)*sqrt((templab(:,2)-par(5)).^2+par(2)*(templab(:,3)-par(6)).^2+par(3)*(templab(:,2)-par(5)).*(templab(:,3)-par(6)))-par(4))))];

templab = [];
for i = [2 3 4 5 6 8 9]
    templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness(980+(i-1)*49+1:980+(i-1)*49+49,:)];
end
load n_skin_2d
n = [n;(1./(1+exp(par(1)*sqrt((templab(:,2)-par(5)).^2+par(2)*(templab(:,3)-par(6)).^2+par(3)*(templab(:,2)-par(5)).*(templab(:,3)-par(6)))-par(4))))];
scatter(n,tempn)

r = corr(n,tempn)
stress = mySTRESS(n,tempn)



