for i = 1:28
    imgname = [int2str(i),'.jpg'];
    idx = colourcluster(imgname);
    save([int2str(i),'_idx.mat'],'idx');
end