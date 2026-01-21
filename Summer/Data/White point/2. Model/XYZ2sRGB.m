%==============CMK=============2017.3.4================================
function[RGB]=XYZ2sRGB(XYZ)
%The CIE XYZ values must be scaled so that the Y of D65("white") is 1.0
%(X,Y,Z = 0.9505, 1.0000, 1.0890)
%XYZ is 1 by 3,RGB is 1 by 3
% Y=XYZ(2);
% XYZ=XYZ./Y;
Rlinear=3.2406*XYZ(1)-1.5372*XYZ(2)-0.4986*XYZ(3);
Glinear=-0.9689*XYZ(1)+1.8758*XYZ(2)+0.0415*XYZ(3);
Blinear=0.0557*XYZ(1)-0.2040*XYZ(2)+1.0570*XYZ(3);
% linear RGB values are not the final result 
% as they have not been adjusted for the gamma correction
%sRGB was designed to reflect a typical real-world monitor with a gamma of 2.2
%the following formula transforms the linear RGB values into sRGB
if Rlinear<=0.0031308
    R=12.92* Rlinear;
else
    R=1.055*(Rlinear^(1/2.4))-0.055;
end

if Glinear<=0.0031308
    G=12.92* Glinear;
else
    G=1.055*(Glinear^(1/2.4))-0.055;
end

if Blinear<=0.0031308
    B=12.92* Blinear;
else
    B=1.055*(Blinear^(1/2.4))-0.055;
end
RGB=[R,G,B];
end