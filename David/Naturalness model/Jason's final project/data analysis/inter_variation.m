load raw_n;
load skylab;
load skinlab;
load grasslab;
load ellipsoidmodel;
% raw_n = image_quality(1:1960,:);
raw_n(raw_n == 2) = 0;


for j = 1:20
    obssky(j,:) = sum(skylab.*raw_n(1:490,j))/sum(raw_n(1:490,j));
end
sky_inter = MCDM(obssky);
obsskycenter = mean(obssky);
de(1,:) = cielabde(obsskycenter,par(1,5:7));

for j = 1:20
    obsgrass(j,:) = sum(grasslab.*raw_n(491:980,j))/sum(raw_n(491:980,j));
end
grass_inter = MCDM(obsgrass);
obsgrasscenter = mean(obsgrass);
de(2,:) = cielabde(obsgrasscenter,par(2,5:7));

asian_idx = [];
idx1 = [];
for i = [1 5 7 9 10]
    asian_idx = [asian_idx;(980+(i-1)*49+1:980+(i-1)*49+49)'];
    idx1 = [idx1;((i-1)*49+1:(i-1)*49+49)'];
end
for j = 1:20
    obsskin(j,:) = sum(skinlab(idx1,:).*raw_n(asian_idx,j))/sum(raw_n(asian_idx,j));
end
skin_inter = MCDM(obsskin);
obsskincenter = mean(obsskin);
de(4,:) = cielabde(obsskincenter,par(4,5:7));

caucasian_idx = [];
idx2 = [];
for i = [2 3 4 6 8]
    caucasian_idx = [caucasian_idx;(980+(i-1)*49+1:980+(i-1)*49+49)'];
    idx2 = [idx2;((i-1)*49+1:(i-1)*49+49)'];
end
for j = 1:20
    obsskin2(j,:) = sum(skinlab(idx2,:).*raw_n(caucasian_idx,j))/sum(raw_n(caucasian_idx,j));
end
skin2_inter = MCDM(obsskin2);
obsskin2center = mean(obsskin2);
de(5,:) = cielabde(obsskin2center,par(5,5:7));

for j = 1:20
    obsatmgrass(j,:) = sum(grasslab.*raw_n(1471:1960,j))/sum(raw_n(1471:1960,j));
end
atmgrass_inter = MCDM(obsatmgrass);
obssatmgrasscenter = mean(obsatmgrass);
de(3,:) = cielabde(obssatmgrasscenter,par(3,5:7));


% center_rgb = display_r(lab2xyz(par(:,5:8),display_f([1 1 1])));
% b = bar([sky_inter,grass_inter,atmgrass_inter,skin_inter,mean([sky_inter,grass_inter,atmgrass_inter,skin_inter])],'FaceColor','flat');
% b.CData = [center_rgb(1:4,:);0 0 0];

