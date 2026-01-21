function hper = highlight_per(imgname)

imgname = [imgname,'.jpg'];
img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));


J = real(lab0(: , 1));


count = size(find(J>80));
sz = size(J);
hper = count(1)/sz(1);
