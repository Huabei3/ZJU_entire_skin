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
