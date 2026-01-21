 clear all
load('cov_choice_0206.mat');
  a=n;aa=nn;aLeeds=nCHL;aUK=nUK;aZJU=nZJU2;aZJU1=nZJU1;aAF=nAF;aPK=nPK;
%   a=p;aa=pp;aLeeds=pCHL;aUK=pUK;aZJU=pZJU2;aZJU1=pZJU1;aAF=pAF;aPK=pPK;
% clear score;
for j=1:24
    %=================ALL=============================
for i=1:62
    score(i,:)=sum(b(:,3*j-2:3*j).*a(49*j-48:49*j,i))./sum(a(49*j-48:49*j,i));
if sum(b(:,3*j-2:3*j).*a(49*j-48:49*j,i))==0
    score(i,:)=score(i-1,:);
end
end
for i=1:42
    score(i+62,:)=sum(b1(:,3*j-2:3*j).*aa(48*j-47:48*j,i))./sum(aa(48*j-47:48*j,i));
if sum(b1(:,3*j-2:3*j).*aa(48*j-47:48*j,i))==0
    score(i+62,:)=score(i+61,:);
end
end
sc(1,:)=mean(score);
s(j,1)=MCDM(score);
scoreall=score;
clear score;
%=================CHN-Leeds=============================
for i=1:21
    score(i,:)=sum(b(:,3*j-2:3*j).*aLeeds(49*j-48:49*j,i))./sum(aLeeds(49*j-48:49*j,i));
if sum(b(:,3*j-2:3*j).*aLeeds(49*j-48:49*j,i))==0
    score(i,:)=score(i-1,:);
end
end
sc(3,:)=mean(score);
s(j,3)=MCDM(score);
scoreCHL=score;
clear score;
% =================UK=============================
for i=1:21
   score(i,:)=sum(b(:,3*j-2:3*j).*aUK(49*j-48:49*j,i))./sum(aUK(49*j-48:49*j,i));
if sum(b(:,3*j-2:3*j).*aUK(49*j-48:49*j,i))==0
    score(i,:)=[];
end
end
sc(4,:)=mean(score);
s(j,4)=MCDM(score);
scoreUK=score;
clear score;
%=================CHN-ZJU=============================
for i=1:9
   score(i,:)=sum(b(:,3*j-2:3*j).*aZJU(49*j-48:49*j,i))./sum(aZJU(49*j-48:49*j,i));
if sum(b(:,3*j-2:3*j).*aZJU(49*j-48:49*j,i))==0
    score(i,:)=score(i-1,:);
end
end
for i=1:11
    score(i+9,:)=sum(b1(:,3*j-2:3*j).*aZJU1(48*j-47:48*j,i))./sum(aZJU1(48*j-47:48*j,i));
if sum(b1(:,3*j-2:3*j).*aZJU1(48*j-47:48*j,i))==0
    score(i+9,:)=score(i+8,:);
end
end
sc(2,:)=mean(score);
s(j,2)=MCDM(score);
scoreCHZ=score;
clear score;
%=================CHN-PK=============================
for i=1:31
    score(i,:)=sum(b1(:,3*j-2:3*j).*aPK(48*j-47:48*j,i))./sum(aPK(48*j-47:48*j,i));
if sum(b1(:,3*j-2:3*j).*aPK(48*j-47:48*j,i))==0
    score(i,:)=score(i-1,:);
end
end
sc(5,:)=mean(score);
s(j,5)=MCDM(score);
scorePK=score;
 clear score;
% %=================CHN-AF=============================
for i=1:11
    score(i,:)=sum(b(:,3*j-2:3*j).*aAF(49*j-48:49*j,i))./sum(aAF(49*j-48:49*j,i));
if sum(b(:,3*j-2:3*j).*aAF(49*j-48:49*j,i))==0
    score(i,:)=score(i-1,:);
end
end
sc(6,:)=mean(score);
s(j,6)=MCDM(score);
s(j,7)=MCDM(sc);
scoreAF=score;
clear score;
se(j,1)=sqrt(sum((sc(2,:)-sc(3,:)).^2));
se(j,2)=sqrt(sum((sc(2,:)-sc(4,:)).^2));
se(j,3)=sqrt(sum((sc(2,:)-sc(5,:)).^2));
se(j,4)=sqrt(sum((sc(2,:)-sc(6,:)).^2));
se(j,5)=sqrt(sum((sc(3,:)-sc(4,:)).^2));
se(j,6)=sqrt(sum((sc(3,:)-sc(5,:)).^2));
se(j,7)=sqrt(sum((sc(3,:)-sc(6,:)).^2));
se(j,8)=sqrt(sum((sc(4,:)-sc(5,:)).^2));
se(j,9)=sqrt(sum((sc(4,:)-sc(6,:)).^2));
se(j,10)=sqrt(sum((sc(5,:)-sc(6,:)).^2));

end
score=[scoreall;scoreAF;scoreCHL;scoreCHZ;scorePK;scoreUK];

