function s = S_choi(cam,sz)
jab = reshape(cam , sz(1) , sz(2) , 3);
jab1 = imresize(jab,[128,96]);
for i = 2 : 128 - 1
    for j = 2 : 96 - 1
        de(1) = LABdistance(jab1(i-1,j,:),jab1(i,j,:));
        de(2) = LABdistance(jab1(i-1,j-1,:),jab1(i,j,:));
        de(3) = LABdistance(jab1(i,j-1,:),jab1(i,j,:));
        de(4) = LABdistance(jab1(i+1,j+1,:),jab1(i,j,:));
        de(5) = LABdistance(jab1(i-1,j+1,:),jab1(i,j,:));
        de(6) = LABdistance(jab1(i+1,j-1,:),jab1(i,j,:));
        de(7) = LABdistance(jab1(i+1,j,:),jab1(i,j,:));
        de(8) = LABdistance(jab1(i,j+1,:),jab1(i,j,:));
        meande(i-1,j-1) = mean(de);
    end
end

s = mean(mean(meande));