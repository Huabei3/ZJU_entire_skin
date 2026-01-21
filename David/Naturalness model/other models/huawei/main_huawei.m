
rendername=["VV","HL","AP","DP","CL","L","C","S"];
imgnum = [3 5 12 14];
imgclass = [1 0 1
    0 1 0
    1 0 1
    0 1 0];
c = 1;
for i = 1 : 8
    for j = 1 : 4
        for k = 1 : 5
            imgname = [char(rendername(i)) , '_' , int2str(imgnum(j)) , '_' , int2str(k) , '.jpg'];
            [D , QN(c)] = naturalness(imgname , imgclass(j , :));
            QCL(c) = clearness(imgname);
            QC(c) = colorfulness(imgname);
            DE(c , :) = D';
            c = c + 1;
        end
    end
end
save QCL QCL;
save QC QC;
save QN QN;
save DE DE;

% rendername=["VV","HL","AP","DP","CL","L","C","S"];
% imgnum = [3 5 12 14];
% c = 1;
% for i = 1 : 8
%     for j = 1 : 4
%         for k = 1 : 5
%             imgname(c) = cellstr([char(rendername(i)) , '_' , int2str(imgnum(j)) , '_' , int2str(k) , '.jpg']);
%  
%             c = c + 1; 
%         end
%     end
% end
% imgname = imgname';
% save imgname_huawei imgname