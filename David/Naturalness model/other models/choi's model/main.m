load imgname_natural.mat
load n_natural.mat
n = (zscore - min(zscore))/(max(zscore)-min(zscore));
naturalnum = [9 10 11 12 13 14 17];
for i = 1:7
    for j = 1:30
        imgname1 = char(imgname_natural((i-1)*30+j,:));
        imgname0 = [int2str(naturalnum(i)),'.jpg'];
        [N((i-1)*30+j,:),Ct((i-1)*30+j,:),RSDt((i-1)*30+j,:),St((i-1)*30+j,:)] = N_choi(imgname1,imgname0);
        nr((i-1)*30+j,:) = n((i-1)*30+j,:)/n((i-1)*30+20,:);
    end
end
        