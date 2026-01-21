function flag = find_naturalness_class(imgname)



p = strsplit(char(imgname),'_');
str1 = cell2mat(p(1));
str2 = cell2mat(p(2));
if isnan(str2double(str1))
    imgnum = str2double(str2);
    if length(str1) <= 2
        path = ['D:\我的坚果云\data\original imgs\natural image pixel index\hw databse\'];
    else
        path = ['D:\我的坚果云\data\original imgs\natural image pixel index\oppo database\'];
    end
else
    imgnum = str2double(str1);
    path = ['D:\我的坚果云\data\original imgs\natural image pixel index\individual database\'];
end

try
    id = importdata([path,num2str(imgnum),'_grass.mat']);
    flag = 1;
catch
    try
        id = importdata([path,num2str(imgnum),'_sky.mat']);
        flag = 2;
    catch
        try
            id = importdata([path,num2str(imgnum),'_skin.mat']);
            flag = 3;
        catch
            flag = 0;
        end
    end
end