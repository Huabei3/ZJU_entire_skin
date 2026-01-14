for i = 1:10
    img = double(imread(cropped_image_name(i,:)))/255;
    sz = size(img);
    img1 = reshape(img,sz(1)*sz(2),3);
    skyidx = (img1(1,:) == 0 & img1(2,:) == 0 & img1(3,:) == 0);
end