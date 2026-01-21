CHZ=n(1:24,:);
PK=n(25:48,:);
CHL=n(49:72,:);
UK=n(73:96,:);
AF=n(97:120,:);
ALL=n(121:144,:);
for i=1:24
m(i,1)=MCDM([CHZ(i,1:3);PK(i,1:3);CHL(i,1:3);UK(i,1:3);AF(i,1:3);ALL(i,1:3)]);
m(i,2)=mean(abs([CHZ(i,1)-ALL(i,1);PK(i,1)-ALL(i,1);CHL(i,1)-ALL(i,1);UK(i,1)-ALL(i,1);AF(i,1)-ALL(i,1)]));
m(i,3)=mean(abs([CHZ(i,4)-ALL(i,4);PK(i,4)-ALL(i,4);CHL(i,4)-ALL(i,4);UK(i,4)-ALL(i,4);AF(i,4)-ALL(i,4)]));
m(i,4)=mean(abs([CHZ(i,5)-ALL(i,5);PK(i,5)-ALL(i,5);CHL(i,5)-ALL(i,5);UK(i,5)-ALL(i,5);AF(i,1)-ALL(i,5)]));
end
