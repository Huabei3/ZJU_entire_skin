%%%%% zju4 %%%%
% load newimgname2343;
% load naturalness2343;
% load data2343;
% load natural_class;

% tempnum = 2;
% idx = natural_class == 2;
% tempn = [];
% tempiq = [];
% 
% % zju4
% % class 3 skin = [7 8 -18 -29 -33 -40 50 51 54 65 -67 -77];
% % class 2 sky = [2 4 -6 -11 -13 -14 -27 44 52 57 -58 63 -68 74];
% % class 1 grass = [1 16 20 21 49 62 75 76];
% 
% %skin
% % for i = [1:126,138:247,259:291,303:362,378:679]
% %grass
% % for i = 1:743
% %sky
% for i = [1:25,31:49,61:71,94:225,237:616,632:694,700:743]
%     if idx(i,:)
%         imgname = char(newimgname2343(i,:));
%         p = strsplit(char(imgname),'_');
%         str1 = cell2mat(p(1));
%         str2 = cell2mat(p(2));
%         if isnan(str2double(str1))
%             imgnum = str2double(str2);
%             if length(str1) <= 2
%                 path = ['D:\我的坚果云\data\original imgs\natural image pixel index\hw databse\'];
%             else
%                 path = ['D:\我的坚果云\data\original imgs\natural image pixel index\oppo database\'];
%             end
%         else
%             imgnum = str2double(str1);
%             path = ['D:\我的坚果云\data\original imgs\natural image pixel index\individual database\'];
%         end
%         if imgnum == tempnum
%             tempn = [tempn;naturalness2343(i,:)];
%             tempiq = [tempiq;cell2mat(data2343(i,2))];
%         else
%             tempniq = sortrows([tempn,tempiq],1);
%             plot(tempniq(:,1),tempniq(:,2));
%             hold on;
%             tempn = [];
%             tempiq = [];
%             tempnum = imgnum;
%         end
%     end
% end
% plot(tempn,tempiq);

%%%% zju5 %%%%
load newimgname2343;
load naturalness2343;
load data2343;
load zju5skin;
load zju5sky;
load zju5grass;
tempn = [];
tempiq = [];
t = 0;
% for i = 1:length(zju5skin)
for i = 1:85
    imgname = zju5grass(i,:);
    for j = 1:2343
        if strcmp(char(newimgname2343(j,:)),char(imgname))
            idx = j;
            break;
        end
    end
    tempn = [tempn;naturalness2343(idx,:)];
    tempiq = [tempiq;cell2mat(data2343(idx,2))];
    t = t+1;
    if t == 5
        tempniq = sortrows([tempn,tempiq],1);
        plot(tempniq(:,1),tempniq(:,2));
        hold on;
        tempn = [];
        tempiq = [];
        t = 0;
    end
end