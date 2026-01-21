% par=par1;
for i=1:5
k1=par(i,1);
k2=par(i,2);
k3=par(i,3);
k4=par(i,4);
k5=par(i,9);
k6=par(i,10);
k7=par(i,8);
a(i,1)=(k4.^2<4.*k2.*k3);
a(i,2)=(k6.^2<4.*k1.*k3);
a(i,3)=(k3.*k7<0);
a(i,4)=((k4.*k6-2.*k3.*k5).^2<(k4.^2-k2.*k3).*(k6.^2-k1.*k3));
end