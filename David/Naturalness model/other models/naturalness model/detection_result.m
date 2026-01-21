imgname = 'Sheep';
imgclass = [0 0 0];

img = imread(['C:\Users\SweetHome\Desktop\我的坚果云\Gong''s model\choi''s_data\imgs\',imgname,'\','CIS','.tif']);

sz = size(img);

xyz0 = importdata(['C:\Users\SweetHome\Desktop\我的坚果云\Gong''s model\choi''s_data\data\',imgname,'\','Ori','XYZ.mat']);
lab0 = xyz2lab(xyz0 , [96.61,100,140.22]*174/100);

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
xyz1 = lab2xyz(lab1 , [96.61,100,140.22]*174/100);
img1 = display_r(xyz1);
result = reshape(img1 , sz(1) , sz(2) , 3);
imshow(result);