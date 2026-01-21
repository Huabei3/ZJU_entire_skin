imgname = '11.jpg';

classnumber = 5;


img = double(imread(imgname));
sz = size(img);
img0 = double(reshape(img , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
lab0 = xyz2lab(xyz0 , display_f([1 1 1]));

[idx,center] = kmeans(lab0,classnumber);
lab1 = lab0;
for k = 1:classnumber
    id = find(idx == k);
    lab1(id,1) = center(k,1);
    lab1(id,2) = center(k,2);
    lab1(id,3) = center(k,3);
end
%  for class = 1:classnumber
%     area(class,:) = size(find(idx == class));
%  end
% 
% maxarea = find(area(:,1) == max(area(:,1)));
% id = find(idx == maxarea);
% lab1(id,1) = 0;
% lab1(id,2) = 0;
% lab1(id,3) = 0;


xyz1 = lab2xyz(lab1 , display_f([1 1 1]));
img1 = display_r(xyz1);
result = reshape(img1 , sz(1) , sz(2) , 3);
imshow(result);

