function skin_color_detection(imgnumber,classnumbers)


imgname = [int2str(imgnumber),'.jpg'];

classnumber = classnumbers;


img = double(imread(imgname));
sz = size(img);
img = imresize(img,[800,sz(2)*800/sz(1)]);
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3));
% xyz0 = display_f(img0);
xyz0 = srgb2xyz(img0);
% lab0 = xyz2lab(xyz0 , display_f([1 1 1]));
lab0 = xyz2lab(xyz0);

[idx,center] = kmeans(lab0,classnumber);


r = skin_ellipsoid(center);
index = r;
filename = [int2str(imgnumber),'_skin'];
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
imwrite(result,[int2str(imgnumber),'_',int2str(classnumbers),'skin.jpg']);


