function [DDC,ddjl] = naturalness_david2(imgname,ori_imgname,imgclass)


DDC = ddc(imgname,ori_imgname,imgclass);

[djl,dcl] = contrast_local(imgname);
[djl1,dcl] = contrast_local(ori_imgname);
ddjl = djl-djl1;
Li = -0.02*abs(ddjl)+3.43;
Ci = -0.1*abs(DDC)+3.33;


