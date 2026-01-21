function [DE , Qn] = naturalness(imgname , imgclass)

cclab = [           65.89 -7.74 -25.51
                    85.53 10.86 14.00
                    76.40 11.96 28.11
                    20.13 12.70 18.98
                    45.41 -42.14 33.13];
ccxyz = lab2xyz(cclab , display_f([1 1 1]));
CCT = 6500;
% Mn = 4.865;
Mn = 3;
aT = 5.404 * (10 ^ 3);


img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));

for i = 1
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(labc , lab0);
    dh = abs(hue_angle_degree(lab0(: , 2) , lab0(: , 3)) - hue_angle_degree(labc(: , 2) , labc(: , 3)));
    dl = abs(dl);
%     dc = abs(dc);
    da = abs(lab0(: , 2) - labc(: , 2));
    db = abs(lab0(: , 3) - labc(: , 3));
    index = find((dl <= 30) & (dh <= 50) & (dc <= 100) & (dc >= -10));
    xyzt = xyz0(index , :);
    
    if ~isempty(xyzt)
        sz1 = size(xyzt);
        xyzc = ccxyz(i , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'avg' , xyzc , display_f([1 1 1]) , 60 , 20 , 'avg');
        de0(i) = mean(det);
        n(i) = (sz1(1) / (sz(1) * sz(2)));
    end
end
for i = 2
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(lab0 , labc);
    dh = abs(hue_angle_degree(lab0(: , 2) , lab0(: , 3)) - hue_angle_degree(labc(: , 2) , labc(: , 3)));
    dl = abs(dl);
    dc = abs(dc);
    da = abs(lab0(: , 2) - labc(: , 2));
    db = abs(lab0(: , 3) - labc(: , 3));
    index = find((dl <= 30) & (dh <= 15) & (dc <= 30));
    xyzt = xyz0(index , :);
    if ~isempty(xyzt)
        sz1 = size(xyzt);
        xyzc = ccxyz(i , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) , 60 , 20 , 'dark');
        de0(i) = mean(det);
        n(i) = (sz1(1) / (sz(1) * sz(2)));
    end
end
for i = 3
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(lab0 , labc);
    dh = abs(hue_angle_degree(lab0(: , 2) , lab0(: , 3)) - hue_angle_degree(labc(: , 2) , labc(: , 3)));
    dl = abs(dl);
    dc = abs(dc);
    da = abs(lab0(: , 2) - labc(: , 2));
    db = abs(lab0(: , 3) - labc(: , 3));
    index = find((dl <= 20) & (dh <= 15) & (dc <= 20));
    xyzt = xyz0(index , :);
    if ~isempty(xyzt)
        sz1 = size(xyzt);
        xyzc = ccxyz(i , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) , 60 , 20 , 'dark');
        de0(i) = mean(det);
        n(i) = (sz1(1) / (sz(1) * sz(2)));
    end
end
for i = 4
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(lab0 , labc);
    dh = abs(hue_angle_degree(lab0(: , 2) , lab0(: , 3)) - hue_angle_degree(labc(: , 2) , labc(: , 3)));
    dl = abs(dl);
    dc = abs(dc);
    da = abs(lab0(: , 2) - labc(: , 2));
    db = abs(lab0(: , 3) - labc(: , 3));
    index = find((dl <= 30) & (dh <= 15) & (dc <= 30));
    xyzt = xyz0(index , :);
    if ~isempty(xyzt)
        sz1 = size(xyzt);
        xyzc = ccxyz(i , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) , 60 , 20 , 'dark');
        de0(i) = mean(det);
        n(i) = (sz1(1) / (sz(1) * sz(2)));
    end
end
for i = 5
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(lab0 , labc);
    dh = abs(hue_angle_degree(lab0(: , 2) , lab0(: , 3)) - hue_angle_degree(labc(: , 2) , labc(: , 3)));
    dl = abs(dl);
    dc = abs(dc);
    da = abs(lab0(: , 2) - labc(: , 2));
    db = abs(lab0(: , 3) - labc(: , 3));
    index = find((dl <= 30) & (dh <= 50) & (dc <= 30));
    xyzt = xyz0(index , :);
    if ~isempty(xyzt)
        sz1 = size(xyzt);
        xyzc = ccxyz(i , :) .* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyzt , display_f([1 1 1]) ,  60 , 20 , 'dark' , xyzc , display_f([1 1 1]) , 60 , 20 , 'dark');
        de0(i) = mean(det);
        n(i) = (sz1(1) / (sz(1) * sz(2)));
    end
end



n = n / sum(n);
de0 = de0 .* n;
DE(1) = de0(1);
DE(2) = mean(de0(2 : 4));
DE(3) = de0(3);
DE = DE .* imgclass;
demean = sum(DE)/length((find(DE ~= 0)));
Qnt = 0.9 * exp(-(demean ^ 2) / (Mn ^ 2)) + 0.1;
Qn = exp(-((CCT - 6500) ^ 2) / (aT ^ 2)) * Qnt;
if isnan(Qn)
    Qn = 0;
end