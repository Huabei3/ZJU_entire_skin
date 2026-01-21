function index = natural_test_sky(imgname)

cclab = [48.8683   14.9163  -51.2714];


ccxyz = lab2xyz(cclab , display_f([1 1 1]));


CCT = 6500;
Mn = 4.865;
aT = 5.404 * (10 ^ 3);

img = double(imread([imgname,'.jpg']));

sz = size(img);

img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));

lab1 = lab0;
for i = 1
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(labc , lab0);
    dh = abs(hue_angle_degree(lab0(: , 2) , lab0(: , 3)) - hue_angle_degree(labc(: , 2) , labc(: , 3)));
%     dl = abs(dl);
%     dc = abs(dc);
    da = abs(lab0(: , 2) - labc(: , 2));
    db = abs(lab0(: , 3) - labc(: , 3));
    index = find((dl >= -40) &(dl <= 40) & (dh <= 28) & (dc <= 30)& (dc >= -30));
    index = index';
    sky = length(index) / (sz(1) * sz(2));
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
filename = [imgname,'_sky'];
save(filename,'index');

% p = [sky skin1 skin2 skin3 grass];







