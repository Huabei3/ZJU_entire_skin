function img = lab2rgb(lab, imgSize, imgW)
% calculate RGB from Lab
% Input parameters:
%     lab - Lab values of image, by [n*3];
%     imgSize - size of image, by [1*3];
%     imgW - XYZ value of white, by [1*3];
% Output parameter:
%     img - RGB values of image, by [n*m*3].

img_enhanced = lab2xyz(lab, 'user', imgW);
img_enhanced = display_r(img_enhanced,'gog_pars-ipad.mat');
img_enhanced = img_enhanced * 255;
img_enhanced = uint8(reshape(img_enhanced,imgSize));

img = img_enhanced;
end