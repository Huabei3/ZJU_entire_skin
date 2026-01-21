load imgname_natural;
imgclass = [1 0 0
    1 0 1
    1 0 1
    1 0 0
    0 1 0
    0 1 0];
imgname = [];

for i = 168
    imgname = char(imgname_natural(i)) ;
    j = floor((i-1)/30)+1;
    p = strfind(imgname,'_');
    imgnum = str2num(imgname(p(1)+1:p(2)-1));
    ori_imgname = imgname(p(1)+1:p(2)-1);
    lab = meancolor(imgname,ori_imgname,imgclass(j,:));
end