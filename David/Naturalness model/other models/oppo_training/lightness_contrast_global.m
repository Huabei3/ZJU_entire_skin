function lcg = lightness_contrast_global(imgname)

imgname = [imgname,'.jpg'];
img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);

CAM = xyz2cam02(xyz0 , display_f([1 1 1]) ,  60 , 20 , 'dark');


J = real(CAM(: , 1));
sz = size(J);
thr = round(sz(1)*0.1);
J = sort(J);
Jl = mean(J(1:thr,:));
Jh = mean(J((sz(1)-thr):sz(1),:));
lcg = Jh-Jl;





