function n = calculate_naturalness(imgname)


% for kadid
% str = cell2mat(p(1));
% imgnum = str2num(str(2:3));
% for zju
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
    load n_sg_2d;
%     par = n_sg;
    flag = 2;
catch
    try
        id = importdata([path,num2str(imgnum),'_sky.mat']);
        load n_sky_2d;
%         par = n_sky;
        flag = 2;
    catch
        try
            id = importdata([path,num2str(imgnum),'_skin.mat']);
            load n_skin;
            par = n_skin;
            flag = 2;
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
    lab = xyz2lab(xyz0,'user',display_f([1 1 1]));
    lab0 = mean(lab(id,:));
    if flag == 1
    % for sky and grass
    n = (1./(1+exp(par(1)*sqrt((lab0(:,1)-par(5)).^2+par(2)*(lab0(:,2)-par(6)).^2+...
        par(3)*(lab0(:,3)-par(7)).^2+par(4)*(lab0(:,2)-par(6)).*(lab0(:,3)-par(7)))-par(8))));
    % for skin
    elseif flag == 2
    n = (1./(1+exp(par(1)*sqrt((lab0(:,2)-par(5)).^2+par(2)*(lab0(:,3)-par(6)).^2+...
        par(3)*(lab0(:,2)-par(5)).*(lab0(:,3)-par(6)))-par(4))));
    end
else
    n = 0;
end

