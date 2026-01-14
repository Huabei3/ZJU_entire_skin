% load imgname;
% for i = 1:size(imgname,1)
%     img = double(imread(char(imgname(i,:))))/255;
%     img = imresize(img,[512,512]);
%     sz = size(img);
%     img0 = reshape(img,sz(1)*sz(2),3);
%     xyz = display_f(img0);
%     lab = xyz2lab(xyz,display_f([1 1 1]));
%     labmean = mean(lab);
%     chroma(i,:) = sqrt(labmean(:,2)^2+labmean(:,3)^2);
% end
load skylab;
load skinlab;
load grasslab;
load image_quality;
skyc = sqrt(skylab(:,2).^2+skylab(:,3).^2);
sgc = sqrt(grasslab(:,2).^2+grasslab(:,3).^2);
skinc = sqrt(skinlab(:,2).^2+skinlab(:,3).^2);
agc = sqrt(grasslab(:,2).^2+grasslab(:,3).^2);
chroma2 = [skyc;sgc;skinc;agc];
scatter(chroma2,image_quality);