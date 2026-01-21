% rendername=["VV","DP","CL","L","C","S"];
% imgnum = [1];
% c = 1;
% for i = 1 : 6
%     for j = 1
%         for k = 1 : 5
%             imgname(c) = cellstr([char(rendername(i)) , '_' , int2str(imgnum(j)) , '_' , int2str(k) , '.jpg']);
%  
%             c = c + 1; 
%         end
%     end
% end
% imgname = imgname';
% save imgname_OPPO_1 imgname
zscore0=[];
load preferencezscore;
load DE;
for i = 1 : 6
    zscore0 = [zscore0 ; zscore(25*(i-1)+1:25*(i-1)+5,:)];
end
zscore = zscore0;
save zscore_oppo_img1 zscore 