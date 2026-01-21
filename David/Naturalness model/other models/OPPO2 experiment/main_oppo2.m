load imgname_natural;
load imgname_oppo2;
for i = 1 : size(imgname_oppo2)
    imgn(i,:) = string(imgname_oppo2(i,:));
end
load  iq;
imgclass = [1 0 0
    1 0 1
    1 0 1
    1 0 0
    0 1 0
    0 1 0
    0 1 0];
imgname = [];
zscore0 = [];
c = 1;
for i = 1:size(imgname_natural)

    imgname = char(imgname_natural(i)) ;
    j = floor((i-1)/30)+1;
    p = strfind(imgname,'_');
    imgnum = str2num(imgname(p(1)+1:p(2)-1));
    ori_imgname = imgname(p(1)+1:p(2)-1);
%     [D(c,:) , QN(c,:)] = naturalness(imgname , ori_imgname,imgclass(j , :));
%     QCL(c,:) = clearness(imgname);
%     QC(c,:) = colorfulness(imgname);
    
%     zscore0(c,:) = zscore(find(imgn == imgname));
    c = c + 1;
end
% save D D;
% save QN QN;
% save QCL QCL;
save QC QC;