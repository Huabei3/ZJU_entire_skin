load jasondata_naturalness;
load jasondata_imgname;
load grasslab;
load skinlab;
load skylab;

for i = 1:490
    [naturalnessjason_gong(i,1),de(i,1)]= calculate_naturalnessjason_gong(skylab(i,:),2);
end
for i = 491:980
    [naturalnessjason_gong(i,1),de(i,1)]= calculate_naturalnessjason_gong(grasslab(i-490,:),1);
end
for i = 981:1470
    [naturalnessjason_gong(i,1),de(i,1)]= calculate_naturalnessjason_gong(skinlab(i-980,:),3);
end
save naturalnessjason_gong naturalnessjason_gong