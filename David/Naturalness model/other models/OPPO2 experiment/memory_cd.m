function de = memory_cd(imgname,ori_imgname,imgclass)

%use xyz file of image, and use cam02-ucs to calculate color difference


cclab = [           65.89 -7.74 -25.51 %sky
                     76.40 11.96 28.11 %skin
                    45.41 -42.14 33.13]; % grass
% cclab = [           67 3.5 -25 %sky
%                     48.4 16.3 26.1 %skin
%                     55 -25 48]; % grass
ccxyz = lab2xyz(cclab , display_f([1 1 1]));


imgname1 = imgname;
img = double(imread(imgname1));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);



if imgclass(1)==1
    index = importdata([ori_imgname,'_sky.mat']);
    xyzt = xyz0(index , :);
    sz1 = size(xyzt);
        xyzc = ccxyz(1 , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
        de = mean(det);

end
% if imgclass(2)==1
%     
%     index1 = importdata([ori_imgname,'_skin1.mat']);
%     index2 = importdata([ori_imgname,'_skin2.mat']);
%     index3 = importdata([ori_imgname,'_skin3.mat']);
%     index = unique([index1,index2,index3]);
%     xyzt = xyz0(index , :);
%     sz1 = size(xyzt);
%     xyzc = ccxyz(2 , :) .* ones(sz1(1) , 3);
%     det = XYZ2CAM02UCSdeltaE(xyzt ,display_f([1 1 1]) ,  60 , 20 , 'dark', xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
%     DE(2) = mean(det);
% 
%    
%     
%     
%     
% end
% if imgclass(3)==1
% 
%     index = importdata([ori_imgname,'_grass.mat']);
%     xyzt = xyz0(index , :);
%     sz1 = size(xyzt);
%             xyzc = ccxyz(3 , :) .* ones(sz1(1) , 3);
%             det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) ,  60 , 20 , 'dark');
%         DE(3) = mean(det);
% 
% 
% end
% de = sum(DE)/length((find(DE ~= 0)));



