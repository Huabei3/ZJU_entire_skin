% load imgname_sky;
% c = 1;
% 
% 
% 
% 
% for i = 1 : 120
% 
%             imgname = char(imgname_natural(i));
%             p = strfind(imgname,'_');
%             imgnum = str2num(imgname(p(1)+1:p(2)-1));
%             ori_imgname = imgname(p(1)+1:p(2)-1);
% 
% %             de(c,:) = memory_cd(imgname,ori_imgname,[1,0,0]);
%              lab0 = meancolor(imgname,ori_imgname,[1,0,0]);
%              lab(c,:) = lab0;
%             c = c + 1;
% 
% end
load imgname_natural;
load imgname_oppo2;
for i = 1 : size(imgname_oppo2)
    imgn(i,:) = string(imgname_oppo2(i,:));
end
load colorfulness;
imgclass = [1 0 0
    1 0 1
    1 0 1
    1 0 0
    0 1 0
    0 1 0];
load best_names;
imgname = [];
zscore0 = [];
c = 1;
for i = 1: 6
    djl1(i,:) = djl(char(best_names(i)));
end
for i = 1:size(imgname_natural)

    imgname = char(imgname_natural(i)) ;
    j = floor((i-1)/30)+1;
    p = strfind(imgname,'_');
    imgnum = str2num(imgname(p(1)+1:p(2)-1));
    ori_imgname = imgname(p(1)+1:p(2)-1);
    best_imgname = char(best_names(j));
%     DDC(c,:) = ddc(imgname , ori_imgname,best_imgname,imgclass(j , :));
%     QCL(c,:) = clearness(imgname);
%     QC(c,:) = colorfulness(imgname);
    d = djl(imgname);
    
    ddjl(c,:) = d-djl1(j);
%     zscore0(c,:) = zscore(find(imgn == imgname));
    c = c + 1;
end
% save D D;
% save QN QN;
% save QCL QCL;
% save QC QC;

