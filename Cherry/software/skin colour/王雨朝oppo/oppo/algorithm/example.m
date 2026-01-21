% example
figName = '1.png';
img = imread(figName);

figure;
subplot(1,2,1); imshow(img);
title('original');

imgSize = size(img);
[skin, mask] = skin_mine(img);
img = double(reshape(img,imgSize(1)*imgSize(2),3));

imgXYZ = display_f(img/255, 'gog_pars-ipad.mat'); % RGB to XYZ using ipad display model
imgW = display_f([1,1,1], 'gog_pars-ipad.mat'); % XYZ of white
imgLab = xyz2lab(imgXYZ, 'user', imgW);

skinXYZ = display_f(skin/255, 'gog_pars-ipad.mat');
skinLab = xyz2lab(skinXYZ, 'user', imgW);
center = findCenter(skinLab(1));

% labN = alg1(imgLab, mask, center); % enhance image
% imgN = lab2rgb(labN, imgSize, imgW); % Lab to RGB

labN = alg4_51(imgLab, mask); % enhance image
imgN = lab2rgb(labN, imgSize, imgW); % Lab to RGB

subplot(1,2,2); imshow(imgN);
title('enhanced');