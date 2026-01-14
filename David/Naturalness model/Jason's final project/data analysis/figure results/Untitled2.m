img = imread('10.tif');
img = imresize(img,[7090,9450]);
imwrite(img,'10.tif');