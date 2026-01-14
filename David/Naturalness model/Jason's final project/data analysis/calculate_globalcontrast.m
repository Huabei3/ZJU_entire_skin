function gc = calculate_globalcontrast(imgname)

    img = double(imread(imgname));
    img = imresize(img,[512,512]);
    sz = size(img);
    img0 = double(reshape(img,sz(1)*sz(2),3))/255;
    xyz0 = display_f(img0);
    lab0 = xyz2lab(xyz0,display_f([1 1 1]));

    l0 = lab0(:,1);

    lightness = sort(l0,'descend');

    gc = (mean(lightness(1:round(1/100*sz(1)*sz(2)),:))/mean(lightness(round((100-1)/100*sz(1)*sz(2)):sz(1)*sz(2),:)));
end


