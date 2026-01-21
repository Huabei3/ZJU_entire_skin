
for i=12
theta(i,1) = 0.5*atan(par(i,3)/(par(i,2)-par(i,4)));
thetapi(i,1) = theta(i,1)*360/(2*pi);
if thetapi(i,1)<0
    thetapi(i,1)=thetapi(i,1)+180;
end
majoraxis(i,1) = sqrt(abs(1/(par(i,3)+par(i,4)*cot(theta(i,1))/2)));
minoraxis(i,1) = sqrt(abs(1/(par(i,3)-par(i,4)*cot(theta(i,1))/2)));
if majoraxis(i,1)<minoraxis(i,1)
  b=minoraxis(i,1);
  minoraxis(i,1)=majoraxis(i,1);
  majoraxis(i,1)=b;
end
  mr(i,1)=majoraxis(i,1)./minoraxis(i,1);
end
pa=[thetapi,majoraxis,minoraxis,mr,par(:,11)];