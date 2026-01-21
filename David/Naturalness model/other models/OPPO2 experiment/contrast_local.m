function [djl,dcl] = contrast_local(imgname)


img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);

CAM = xyz2cam02(xyz0 , display_f([1 1 1]) ,  60 , 20 , 'dark');

C = real(reshape(CAM(: , 2) , sz(1) , sz(2)));
J = real(reshape(CAM(: , 1) , sz(1) , sz(2)));

for i = 1 : sz(1) - 4
    for j = 1 : sz(2) - 4
        tempmat = C(i : i + 4 , j : j + 4 );
        dC(i ,j) = sum(sum((tempmat - C(i + 2 , j + 2)) .^ 2)) / 24;
        tempmat = J(i : i + 4 , j : j + 4 );
        dJ(i ,j) = sum(sum((tempmat - J(i + 2 , j + 2)) .^ 2)) / 24;
    end
end


djl = mean(mean(dJ));
dcl = mean(mean(dC));

