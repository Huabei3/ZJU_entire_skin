function sky_color_detection(imgnumber,classnumbers)


imgname = [int2str(imgnumber),'.jpg'];

classnumber = classnumbers;


img = double(imread(imgname));
sz = size(img);
img = imresize(img,[800,sz(2)*800/sz(1)]);
sz = size(img);
pos = ones(sz(1),sz(2),2);
for m = 1:sz(1)
    for n = 1:sz(2)
        pos(m,n,:) = [m,n];
    end
end
img0 = double(reshape(img , sz(1) * sz(2) , 3));
% xyz0 = display_f(img0);
xyz0 = srgb2xyz(img0);
% lab0 = xyz2lab(xyz0 , display_f([1 1 1]));
lab0 = xyz2lab(xyz0);
l1 = (lab0(:,1)-min(lab0(:,1)))/(max(lab0(:,1))-min(lab0(:,1)));
a1 = (lab0(:,2)-min(lab0(:,2)))/(max(lab0(:,2))-min(lab0(:,2)));
b1 = (lab0(:,3)-min(lab0(:,3)))/(max(lab0(:,3))-min(lab0(:,3)));
pos = reshape(pos , sz(1) * sz(2) , 2);
pos1 = 0.5*pos(:,1)/sz(1);
pos2 = 0.5*pos(:,2)/sz(2);
labpos = [l1,a1,b1,pos1,pos2];

opt = statset('Display','final','MaxIter',1000);
[idx,center] = kmeans(labpos,classnumber,'Options',opt);

for k = 1:classnumber
    
    center(k,1) = center(k,1)*(max(lab0(:,1))-min(lab0(:,1)))+min(lab0(:,1));
    center(k,2) = center(k,2)*(max(lab0(:,2))-min(lab0(:,2)))+min(lab0(:,2));
    center(k,3) = center(k,3)*(max(lab0(:,3))-min(lab0(:,3)))+min(lab0(:,3));
end


r = sky_ellipsoid(center);
index = r;
filename = [int2str(imgnumber),'_sky'];
save(filename,'index');
lab1 = lab0;
for k = 1:classnumber
    if r(k,:) == 1
        id = find(idx == k);
        lab1(id,1) = 0;
        lab1(id,2) = 0;
        lab1(id,3) = 0;
    end
end

% xyz1 = lab2xyz(lab1 , display_f([1 1 1]));
xyz1 = lab2xyz(lab1);
% img1 = display_r(xyz1);
img1 = xyz2srgb(xyz1);
result = reshape(img1 , sz(1) , sz(2) , 3)/255;
imwrite(result,[int2str(imgnumber),'_',int2str(classnumbers),'sky.jpg']);


