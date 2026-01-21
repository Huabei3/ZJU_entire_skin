load oriimgname;
for i = 1:77
    img = imread(char(oriimgname(i,:)));
    imwrite(img,[int2str(i),'.jpg']);
end