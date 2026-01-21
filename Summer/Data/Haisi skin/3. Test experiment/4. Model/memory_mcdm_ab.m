clear all
load('memorydata.mat');
for i=24
c(1,1:3)=min(b(1:16,3*i-2:3*i));
c(2,1:3)=max(b(1:16,3*i-2:3*i));
    for j=1:15
% output: par = [k1,k2,k3,k4,l0,a0,b0,alpha,k5,k6]
 xdata=b(1:16,3*i-1:3*i);
 ydata=a2(1:16,i);
 f1=@(a,xdata)(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 rmax=0;
 for t=1:100
     a0=[-rand,rand,rand,rand,rand,rand];
     options=optimset('MaxFunEvals',200000);
     a=lsqcurvefit(f1,a0,xdata,ydata,[-inf,0,-inf,c(1,2:3),-inf],[inf,inf,inf,c(2,2:3),inf],options);
     y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
     r=corr(y,ydata);
     if r >= rmax
        rmax=r;
        afinal=a;
     end
 end
 par(i,1:6)=afinal;
 a=afinal;
 y =(1./(1+exp((sqrt(a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3).*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5))))-a(6)))).*((a(1)*(xdata(:,1)-a(4)).^2+a(2)*(xdata(:,2)-a(5)).^2+a(3)*(xdata(:,1)-a(4)).*(xdata(:,2)-a(5)))>=0);
 r=corr(y,ydata);
 par(i,7)=r;
 parr(j,:)=par(i,:);
theta = 0.5*atan(par(i,3)/(par(i,1)-par(i,2)))./pi.*180+90;
maj = sqrt(4*par(i,6)./(par(i,1)+par(i,2)-sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
min = sqrt(4*par(i,6)./(par(i,1)+par(i,2)+sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
theta1(j,1) = 0.5*atan(par(i,3)/(par(i,1)-par(i,2)))./pi.*180+90;
maj1(j,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)-sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
min1(j,1) = sqrt(4*par(i,6)./(par(i,1)+par(i,2)+sqrt((par(i,1)-par(i,2)).^2+par(i,3).^2)));
if maj<min
  bb=min;
  min=maj;
  maj=bb;
end
  mr=maj./min;
  pa(j,:)=[par(i,1:6),r,theta,maj,mr];
    end 
 parrr(i*15-14:i*15,:)=parr;
 mcdm(i,1)=MCDM(parr(1:3,3:5));    
 mcdm(i,2)=MCDM(parr(4:6,3:5));
 mcdm(i,3)=MCDM(parr(7:9,3:5));    
 mcdm(i,4)=MCDM(parr(10:12,3:5));
 mcdm(i,5)=MCDM(parr(13:15,3:5));
 clear c;
end