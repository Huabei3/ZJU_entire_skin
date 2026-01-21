function Qn = calculate_naturalness_gong(imgname,imgclass)
if imgclass == 0
    Qn = 0;
else
    cclab = [45.41 -42.14 33.13 %grass
            65.89 -7.74 -25.51 %sky
            85.53 10.86 14.00 %skin
            76.40 11.96 28.11
            20.13 12.70 18.98
            ]; 
    ccxyz = lab2xyz(cclab(imgclass,:) ,'user', display_f([1 1 1]));
    CCT = 6500;
    Mn = 4.865;
    aT = 5.404 * (10 ^ 3);


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
    catch
        try
            id = importdata([path,num2str(imgnum),'_sky.mat']);
        catch
            try
                id = importdata([path,num2str(imgnum),'_skin.mat']);
            catch
                id = [];
            end
        end
    end
    if ~isempty(id)
        img = double(imread(imgname));
        img = imresize(img,[512,512]);
        sz = size(img);
        img0 = double(reshape(img,sz(1)*sz(2),3))/255;
        xyz0 = display_f(img0);
        xyztemp = xyz0(id,:);
        sz1 = size(xyztemp);
        xyzc = ccxyz.* ones(sz1(1) , 3);
        det = XYZ2CAM02UCSdeltaE(xyztemp , display_f([1 1 1]) ,  60 , 20 , 'avg' , xyzc , display_f([1 1 1]) , 60 , 20 , 'avg');
        de0 = mean(det);
        n = (sz1(1) / (sz(1) * sz(2)));

        de1 = de0 * n;

        Qnt = 0.9 * exp(-(de1 ^ 2) / (Mn ^ 2)) + 0.1;
        Qn = exp(-((CCT - 6500) ^ 2) / (aT ^ 2)) * Qnt;
    end
end
