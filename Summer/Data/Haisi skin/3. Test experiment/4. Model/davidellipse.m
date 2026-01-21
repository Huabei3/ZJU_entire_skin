clear all
load('data0621-3.mat');
c=mean(a')';
c=reshape(c,100,5);
% par=ellipsoidfit5(b(1:25,:),c(1:25,5));
for i=3
    for j=3
par(i+5*j-5,:)=ellipsoidfit5(b(25*j-24:25*j,:),c(25*j-24:25*j,i));
f = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
% ezplot(f,[-100,100]);hold on
    end
end
theta = 0.5*atan(par(i+5*j-5,3)/(1-par(i+5*j-5,2)));
thetapi = theta*360/(2*pi)
majoraxis = sqrt(1/(par(i+5*j-5,2)+par(i+5*j-5,3)*cot(theta)/2))
minoraxis = sqrt(1/(1-par(i+5*j-5,3)*cot(theta)/2))
mr = minoraxis/majoraxis