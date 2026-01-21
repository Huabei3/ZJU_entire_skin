imgname = '17';
imgclass = [0 1 0];

img = double(imread([imgname,'.jpg']));

sz = size(img);

img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));

lab1 = lab0;
if imgclass(1)==1
    index = importdata([imgname,'_sky.mat']);
    if ~isempty(index)
        for k = 1 : size(index')
            lab1(index(k),:) = [0 0 0];
        end
    end

end
if imgclass(2)==1
    
    index1 = importdata([imgname,'_skin1.mat']);
    index2 = importdata([imgname,'_skin2.mat']);
    index3 = importdata([imgname,'_skin3.mat']);
    index = unique([index1,index2,index3]);
    if ~isempty(index)
        for k = 1 : size(index')
            lab1(index(k),:) = [0 0 0];
        end
    end


   
    
    
    
end
if imgclass(3)==1

    index = importdata([imgname,'_grass.mat']);
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