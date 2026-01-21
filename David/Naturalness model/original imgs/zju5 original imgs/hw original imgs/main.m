for i = [1 3 4 5 8 9 11 12 13 14 16 17 18 19 20 21 22 23 24]
    imgname = [int2str(i),'.jpg'];
    idx = colourcluster(imgname);
    save([int2str(i),'_idx.mat'],'idx');
end