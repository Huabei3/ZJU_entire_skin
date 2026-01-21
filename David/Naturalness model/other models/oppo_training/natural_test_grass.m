function index = natural_test_grass(imgname)

cclab = [           65.89 -7.74 -25.51
                    85.53 10.86 14.00
                    76.40 11.96 28.11
                    20.13 12.70 18.98
                    45.41 -42.14 33.13];



img = double(imread([imgname,'.jpg']));

sz = size(img);

img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));

lab1 = lab0;

for i = 5
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(lab0 , labc);
    dh = abs(hue_angle_degree(lab0(: , 2) , lab0(: , 3)) - hue_angle_degree(labc(: , 2) , labc(: , 3)));
    dl = abs(dl);
    dc = abs(dc);
    da = abs(lab0(: , 2) - labc(: , 2));
    db = abs(lab0(: , 3) - labc(: , 3));
    index = find((dl <= 50) & (dh <= 50) & (dc <= 40));
    index = index';
    grass = length(index) / (sz(1) * sz(2));
    if ~isempty(index)
        for k = 1 : size(index')
            lab1(index(k),:) = [0 0 0];
        end
    end
end


xyz1 = lab2xyz(lab1 , display_f([1 1 1]));
img1 = display_r(xyz1);
result = reshape(img1 , sz(1) , sz(2) , 3);
imshow(result);
filename = [imgname,'_grass'];
save(filename,'index');

% p = [sky skin1 skin2 skin3 grass];







