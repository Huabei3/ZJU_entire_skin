
for i=1:24
theta(i,1) = 0.5*atan(par(i,3)/(par(i,1)-par(i,2)))./pi.*180;
theta(i,1)=theta(i,1)+90;
maj(i,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)-sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
min(i,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)+sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
if maj(i,1)<min(i,1)
  b=min(i,1);
  min(i,1)=maj(i,1);
  maj(i,1)=b;
end
  mr(i,1)=maj(i,1)./min(i,1);
  pa(i,:)=[par(i,1:6),r,theta(i,1),maj(i,1),mr(i,1)];
end
