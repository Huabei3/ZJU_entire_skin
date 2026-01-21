function [demean,Qn] = naturalness(imgname ,ori_imgname, imgclass)

cclab = [           65.89 -7.74 -25.51
                    85.53 10.86 14.00
                    76.40 11.96 28.11
                    20.13 12.70 18.98
                    45.41 -42.14 33.13];

% cclab = importdata([ori_imgname,'_lab.mat']);
ccxyz = lab2xyz(cclab , display_f([1 1 1]));
CCT = 6500;
Mn = 4.865;
% Mn = 3;
aT = 5.404 * (10 ^ 3);

DE = [0,0,0];   
img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));

if imgclass(1)==1
    index = importdata([ori_imgname,'_sky.mat']);

    xyzt = xyz0(index , :);
    sz1 = size(xyzt);
        xyzc = ccxyz(1 , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        DE(1) = mean(det);

end
if imgclass(2)==1
    
    index1 = importdata([ori_imgname,'_skin1.mat']);
    index2 = importdata([ori_imgname,'_skin2.mat']);
    index3 = importdata([ori_imgname,'_skin3.mat']);
    index = unique([index1,index2,index3]);
    xyzt = xyz0(index , :);
    sz1 = size(xyzt);
    xyzc = ccxyz(2 , :) .* ones(sz1(1) , 3);
    det = XYZ2CAM02UCSdeltaE(xyzt ,display_f([1 1 1]) ,  60 , 20 , 'dark', xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
    DE(2) = mean(det);

   
    
    
    
end
if imgclass(3)==1

    index = importdata([ori_imgname,'_grass.mat']);
    xyzt = xyz0(index , :);
    sz1 = size(xyzt);
            xyzc = ccxyz(3 , :) .* ones(sz1(1) , 3);
            det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        DE(3) = mean(det);


end



% n = n / sum(n);
% de0 = de0 .* n;
% DE(1) = de0(1);
% DE(2) = mean(de0(2 : 4));
% DE(3) = de0(3);
DE = DE .* imgclass;
demean = sum(DE)/length((find(DE ~= 0)));
Qnt = 0.9 * exp(-(demean ^ 2) / (Mn ^ 2)) + 0.1;
Qn = exp(-((CCT - 6500) ^ 2) / (aT ^ 2)) * Qnt;
