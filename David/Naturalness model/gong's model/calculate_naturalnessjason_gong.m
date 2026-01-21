function [Qn,de0] = calculate_naturalnessjason_gong(lab,imgclass)

cclab = [45.41 -42.14 33.13 %grass
    65.89 -7.74 -25.51 %sky
    85.53 10.86 14.00 %skin
    76.40 11.96 28.11
    20.13 12.70 18.98
    ];
ccxyz = lab2xyz(cclab(imgclass,:),display_f([1 1 1]));
CCT = 6500;
Mn = 4.865;
aT = 5.404 * (10 ^ 3);



xyz0 = lab2xyz(lab,display_f([1 1 1]));

de0 = XYZ2CAM02UCSdeltaE(xyz0 , display_f([1 1 1]) ,  60 , 20 , 'avg' , ccxyz , display_f([1 1 1]) , 60 , 20 , 'avg');


Qnt = 0.9 * exp(-(de0 ^ 2) / (Mn ^ 2)) + 0.1;
Qn = exp(-((CCT - 6500) ^ 2) / (aT ^ 2)) * Qnt;


