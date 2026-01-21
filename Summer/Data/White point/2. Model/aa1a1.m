load('aa1a1');
for i=1:5
    a=xyzo(:,(3*i-2):3*i);
    for j=1:11
    lab(j,(6*i-5):(6*i-3))=xyz2lab(a(j,:),'user',w(j,:));
    lab(j,(6*i-2))=sqrt(lab(j,(6*i-4)).^2+lab(j,(6*i-3)).^2);
    [J,Q,C,M,S,h,H]= CAM16_frwd(a(j,:),xyzw(j,:),c(j,1),100,'dark');
    lab(j,(i*6-1))=Q;
    lab(j,(i*6))=M;
    end
end
