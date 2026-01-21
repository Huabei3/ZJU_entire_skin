load imgname_oppo;
load naturalness_60_oppo;


rendername=["VV","DP","CL","L","C","S"];
imgnum = [1 2];
imgclass = [1 0 1
    0 1 0];

c = 1;
l_imgname = ["L_1_2","CL_2_3"];
for i = 1 : 6
    for j = 1 : 2
        for k = 1 : 5
            imgname = [char(rendername(i)) , '_' , int2str(imgnum(j)) , '_' , int2str(k)];
            ori_imgname = ['VV_' , int2str(imgnum(j)) , '_5'];
%             lcl(c,:) = lightness_contrast_local(imgname);
%             lcg(c,:) = lightness_contrast_global(imgname);
            de(c,:) = memory_cd(imgname,ori_imgname,imgclass(j,:));
                
            c = c + 1;

        end
    end
end
% save Qn Qn
% save Qcon Qcon
% save DER DER
% save Hper Hper


