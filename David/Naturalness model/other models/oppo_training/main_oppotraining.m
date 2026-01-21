load imgname_oppo;
load preferencezscore
for i = 1 : size(imgname)
    imgn(i,:) = string(imgname(i,:));
end

imgname = [];
zscore0 = [];
rendername=["VV","DP","CL","L","C","S"];
imgnum = [1 2];
imgclass = [1 0 1
    0 1 0];
c = 1;
for i = 1 : 6
    for j = 1 : 2
        for k = 1 : 5
            imgname = [char(rendername(i)) , '_' , int2str(imgnum(j)) , '_' , int2str(k) , '.jpg'];
            [D , QN(c)] = naturalness(imgname , imgclass(j , :));
            QCL(c) = clearness(imgname);
            QC(c) = colorfulness(imgname);
            DE(c , :) = D';
            c = c + 1;
            zscore0 = [zscore0 ; zscore(find(imgn == imgname))];
        end
    end
end
save QCL QCL;
save QC QC;
save QN QN;
save DE DE;
zscore = zscore0;
save zscore60_oppo zscore