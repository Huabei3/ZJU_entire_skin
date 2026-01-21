function [Qn,DER,Qcon,Hper] = naturalness_david(imgname,ori_imgname,imgclass)


DE = memory_cd(imgname,ori_imgname,imgclass);
DEO = memory_cd(ori_imgname,ori_imgname,imgclass);
DER = DE - DEO + 3;
Hper = highlight_per(imgname) - highlight_per(ori_imgname) + 0.15;
Qcon = contrast(imgname);
Qn = -0.145 * DER + 1.27 * Qcon - 25 * (Hper - 0.05)^2;
