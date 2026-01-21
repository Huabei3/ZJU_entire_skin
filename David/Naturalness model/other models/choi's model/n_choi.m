
function [N,Ct,RSDt,St] = N_choi(imgname1,imgname0)

img0 = double(imread(imgname0));
sz = size(img0);
img0 = double(reshape(img0 , sz(1) * sz(2) , 3)) / 255;

img = double(imread(imgname1));
sz = size(img);
img = double(reshape(img , sz(1) * sz(2) , 3)) / 255;

xyz0 = display_f(img0);
xyz = display_f(img);

CAM0 = XYZ2CAM02UCS(xyz0,display_f([1 1 1]),60,20,'dark');
CAM = XYZ2CAM02UCS(xyz,display_f([1 1 1]),60,20,'dark');

Ct = C_choi(CAM)/C_choi(CAM0);
IC = exp(2.91-2.89/Ct-2.68*log(Ct));

RSDt = RSD_choi(CAM0)/RSD_choi(CAM);
IRSD = exp(2.17-2.16/RSDt-1.63*log(RSDt));

St = S_choi(CAM,sz)/S_choi(CAM0,sz);
IS = exp(18.29-18.3/St-17.7*log(St));

N = 0.83*IRSD + 0.99*IC + 0.34*IS - 1.18;

