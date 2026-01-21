function Qc = colorfulness(imgname)

% r1 = xyz2xyY(display_f([1 0 0]));
% g1 = xyz2xyY(display_f([0 1 0]));
% b1 = xyz2xyY(display_f([0 0 1]));
% 
% Sp = (1 / 2) * (r1(1) * g1(2) + g1(1) * b1(2) + b1(1) * r1(2) - r1(1) * b1(2) - g1(1) * r1(2) - b1(1) * g1(2));
% 
% r2 = xyz2xyY(srgb2xyz([1 0 0]));
% g2 = xyz2xyY(srgb2xyz([0 1 0]));
% b2 = xyz2xyY(srgb2xyz([0 0 1]));
% 
% Sr = (1 / 2) * (r2(1) * g2(2) + g2(1) * b2(2) + b2(1) * r2(2) - r2(1) * b2(2) - g2(1) * r2(2) - b2(1) * g2(2));
% 
% Gsrgb = Sp / Sr;
Gsrgb = 1.3611;

img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
CAM = xyz2cam02(xyz0 , display_f([1 1 1]) , 60 , 20 , 'dark');


aG = 1.543;
bG = 2.686;
mC = 49.938;

Qct = mean(CAM(: , 2));
Qc = (aG / (1 + exp(-bG * (Gsrgb - 1)))) * (Qct/mC);
if isnan(Qc)
    Qc = 0;
end