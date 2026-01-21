
imgname = '10.jpg';


% cclab = [           64.25 -5.13 -52.26
%                     85.53 10.86 14.00
%                     56.95 -54.61 50.42];
% cclab = [65.89 -7.74 -25.51
%     45.41 -42.14 33.13
%     81.7 7.81 21.63];
cclab = [           65.89 -7.74 -25.51
                    85.53 10.86 14.00
                    76.40 11.96 28.11
                    20.13 12.70 18.98
                    45.41 -42.14 33.13];


ccxyz = lab2xyz(cclab , display_f([1 1 1]));



img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));
lab1 = lab0;
for i = 1 : 5
    labc = cclab(i , :) .* ones(sz(1) * sz(2) , 3);
    [de,dl,dc,dh] = cielabde(labc , lab0);

    index = find(de <= 25);
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









