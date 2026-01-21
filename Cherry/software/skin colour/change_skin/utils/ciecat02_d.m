function [XYZ2,XYZw2] = ciecat02_d (XYZ1,XYZ1w,XYZ2w,CATtype,La1,La2,D)
%   Author: ZHAI Qiyan, Zhejiang University
%   XYZ1: 1 by 3, input tristimulus values (0~1 or 0~100 or cd/m2)
%   XYZ2: 1 by 3, output tristimulus values (0~1 or 0~100 or cd/m2)
%   XYZ1w: 1 by 3, adapting white point of input source (0~1 or 0~100 or cd/m2)
%   XYZ2w: 1 by 3, adapting white point of output source (0~1 or 0~100 or cd/m2)
%   (The above four var should be in the same scale)
%
%   M: 'CAT02' or 'CAT16'
%   La1: Luminance of original adapting filed under illuminante1 (cd/m2)
%   La2: Luminance of target adapting filed under illuminante2 (cd/m2)
%   F2: scaling factor of surrounding (usually 0.7~1)(average surrounding: F=1)

%   D=F.*(1-(1/3.6).*exp((-La1-42)./92));


switch CATtype
    case 'CAT02'
        Ac=[0.7328, 0.4296, -0.1624;
             -0.7036, 1.6975,  0.0061;
              0.0030, 0.0136,  0.9834];
    case 'CAT16'
        Ac=[0.401288   0.650173  -0.051461
             -0.250268   1.204414   0.045854
             -0.002079   0.048952   0.953127];
end

RGB1=(Ac*XYZ1');
RGBw1=(Ac*XYZ1w');
RGBw2=(Ac*XYZ2w');

RGB2(1,:)=RGB1(1,:).*(D.*(La1./La2).*(RGBw2(1)./RGBw1(1))+1-D);
RGB2(2,:)=RGB1(2,:).*(D.*(La1./La2).*(RGBw2(2)./RGBw1(2))+1-D);
RGB2(3,:)=RGB1(3,:).*(D.*(La1./La2).*(RGBw2(3)./RGBw1(3))+1-D);

RGBw2(1,:)=RGBw1(1,:).*(D.*(La1./La2).*(RGBw2(1)./RGBw1(1))+1-D);
RGBw2(2,:)=RGBw1(2,:).*(D.*(La1./La2).*(RGBw2(2)./RGBw1(2))+1-D);
RGBw2(3,:)=RGBw1(3,:).*(D.*(La1./La2).*(RGBw2(3)./RGBw1(3))+1-D);

XYZ2=(Ac\RGB2)';
XYZ2(XYZ2<0)=0;

XYZw2=(Ac\RGBw2)';
XYZw2(XYZw2<0)=0;
end