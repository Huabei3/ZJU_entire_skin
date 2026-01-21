clear all
load('Memory_mcdm_1105.mat');
for ip=1:29
    for im=1:29
        l1(im,:)=sum(b(:,im.*3-2:im.*3).*c1(im.*48-47:im.*48,ip))./sum(c1(im.*48-47:im.*48,ip));
        l2(im,:)=sum(b(:,im.*3-2:im.*3).*c2(im.*48-47:im.*48,ip))./sum(c2(im.*48-47:im.*48,ip));
        l3(im,:)=sum(b(:,im.*3-2:im.*3).*c3(im.*48-47:im.*48,ip))./sum(c3(im.*48-47:im.*48,ip));
        lab1(im,:)=sum(b(:,im.*3-2:im.*3).*a1(:,im))./sum(a1(:,im));
        lab2(im,:)=sum(b(:,im.*3-2:im.*3).*a2(:,im))./sum(a2(:,im));
        lab3(im,:)=sum(b(:,im.*3-2:im.*3).*a3(:,im))./sum(a3(:,im));
    end
        mcdm(ip,1)=mean(cielabde(l1,lab1));
        mcdm(ip,2)=mean(cielabde(l2,lab2));
        mcdm(ip,3)=mean(cielabde(l3,lab3));
end
% mcdm(:,4)=mean(mcdm(:,1:3));
   
        