function ddc = ddc(imgname,ori_imgname,imgclass)

%use xyz file of image, and use cam02-ucs to calculate color difference

cclab = [           65.89 -7.74 -25.51 %sky
                     76.40 11.96 28.11 %skin
                    45.41 -42.14 33.13]; % grass
% cclab = [           67 3.5 -25 %sky
%                     48.4 16.3 26.1 %skin
%                     55 -25 48]; % grass
ccxyz = lab2xyz(cclab , display_f([1 1 1]));


imgname1 = [imgname,'.jpg'];
imgname2 = [ori_imgname,'.jpg'];
img = double(imread(imgname1));
img1 = double(imread(imgname2));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
img1 = double(reshape(img1 , sz(1) * sz(2) , 3)) / 255;
xyz1 = display_f(img1);


if imgclass(1)==1
    index = importdata([ori_imgname,'_sky.mat']);
    xyzt = xyz0(index , :);
    xyzt1 = xyz1(index , :);
    sz1 = size(xyzt);
        xyzc = ccxyz(1 , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaCH(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        det1 = XYZ2CAM02UCSdeltaCH(xyzt1 , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        DE(1) = mean(det-det1);

end
if imgclass(2)==1
    
    index1 = importdata([ori_imgname,'_skin1.mat']);
    index2 = importdata([ori_imgname,'_skin2.mat']);
    index3 = importdata([ori_imgname,'_skin3.mat']);
    index = unique([index1,index2,index3]);
    xyzt = xyz0(index , :);
    xyzt1 = xyz1(index , :);
    sz1 = size(xyzt);
        xyzc = ccxyz(1 , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaCH(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        det1 = XYZ2CAM02UCSdeltaCH(xyzt1 , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        DE(2) = mean(det-det1);

   
    
    
    
end
if imgclass(3)==1

    index = importdata([ori_imgname,'_grass.mat']);
    xyzt = xyz0(index , :);
    xyzt1 = xyz1(index , :);
    sz1 = size(xyzt);
        xyzc = ccxyz(1 , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaCH(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        det1 = XYZ2CAM02UCSdeltaCH(xyzt1 , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        DE(3) = mean(det-det1);


end
ddc = sum(DE)/length((find(DE ~= 0)));
if isnan(ddc)
    ddc = 0;
end



