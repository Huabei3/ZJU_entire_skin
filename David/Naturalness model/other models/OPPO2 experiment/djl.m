function dj = djl(imgname)


img = double(imread(imgname));
sz = size(img);
sz(1) = floor(sz(1)/5)*5;
sz(2) = floor(sz(2)/5)*5;
img0 = img(1:sz(1),1:sz(2),:);
img0 = double(reshape(img0 , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
CAM = xyz2cam02(xyz0 , display_f([1 1 1]) , 60 , 20 , 'dark');
J = reshape(CAM(: , 1) , sz(1) , sz(2));
J0 = J(3:5:sz(1)-2,3:5:sz(2)-2);

for i = 1:5
    for j = 1:5
        Jt(i,j) = mean(mean((J(i:5:sz(1)-5+i,j:5:sz(2)-5+j)-J0).^2));
    end
end
dj = mean(mean(Jt));