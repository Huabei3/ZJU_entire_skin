function idx = colourcluster(imgname)

classnumber = 20;

img = double(imread(imgname));
img = imresize(img,[512,512]);
sz = size(img);
pos = ones(sz(1),sz(2),2);
for m = 1:sz(1)
    for n = 1:sz(2)
        pos(m,n,:) = [m,n];
    end
end
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 ,'user', display_f([1 1 1]));
l1 = (lab0(:,1)-min(lab0(:,1)))/(max(lab0(:,1))-min(lab0(:,1)));
a1 = (lab0(:,2)-min(lab0(:,2)))/(max(lab0(:,2))-min(lab0(:,2)));
b1 = (lab0(:,3)-min(lab0(:,3)))/(max(lab0(:,3))-min(lab0(:,3)));
pos = reshape(pos , sz(1) * sz(2) , 2);
pos1 = pos(:,1)/sz(1);
pos2 = pos(:,2)/sz(2);
labpos = [l1,a1,b1,pos1,pos2];

opt = statset('Display','final','MaxIter',1000);
[idx,~] = kmeans(labpos,classnumber,'Options',opt);
% [idx,center] = kmeans(labpos,classnumber,'Options',opt);
% lab1 = lab0;
% for k = 1:classnumber
%     id = find(idx == k);
%     lab1(id,1) = center(k,1)*(max(lab0(:,1))-min(lab0(:,1)))+min(lab0(:,1));
%     lab1(id,2) = center(k,2)*(max(lab0(:,2))-min(lab0(:,2)))+min(lab0(:,2));
%     lab1(id,3) = center(k,3)*(max(lab0(:,3))-min(lab0(:,3)))+min(lab0(:,3));
% end
% xyz1 = lab2xyz(lab1 ,'user', display_f([1 1 1]));
% img1 = display_r(xyz1);
% result = reshape(img1 , sz(1) , sz(2) , 3);
% imshow(result);
end
