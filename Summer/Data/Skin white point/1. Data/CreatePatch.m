rgbw = display_r(Xw_24.*3.2, 'gog_pars-apple-ipadpro105.mat').*255;
t=uint8(ones(600,600,1));
img=cat(3,125*t,125*t,125*t);

for i=1:24
    img(:, :, 1) = rgbw(i, 1);
    img(:, :, 2) = rgbw(i, 2);
    img(:, :, 3) = rgbw(i, 3);
    imwrite(uint8(img), strcat('white', num2str(i),'.png'));
end