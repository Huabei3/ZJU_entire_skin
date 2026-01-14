% r = [0:8:256];
% g = [0:8:256];
% b = [0:8:256];

hue_angle = 123;

[r,g,b] = meshgrid([0:1:255],[0:1:255],[0:1:255]);
r = reshape(r,256*256*256,1);
g = reshape(g,256*256*256,1);
b = reshape(b,256*256*256,1);
rgb = [r,g,b]/255;
idr1 = find(rgb(:,1) == 0);
idr2 = find(rgb(:,1) == 1);
idg1 = find(rgb(:,2) == 0);
idg2 = find(rgb(:,2) == 1);
idb1 = find(rgb(:,3) == 0);
idb2 = find(rgb(:,3) == 1);
id = unique([idr1;idr2;idg1;idg2;idb1;idb2]);
xyz = display_f(rgb(id,:));
lab = xyz2lab(xyz,display_f([1 1 1]));
idh = find((hue_angle_degree(lab(:,2),lab(:,3))>=hue_angle-1)&(hue_angle_degree(lab(:,2),lab(:,3))<=hue_angle+1));
% scatter(lab(:,2),lab(:,3))
% scatter(sqrt(lab(idh,2).^2+lab(idh,3).^2),lab(idh,1));
% hold on
C = sqrt(lab(idh,2).^2+lab(idh,3).^2);
max(C)