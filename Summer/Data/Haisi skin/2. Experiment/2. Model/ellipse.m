% clear all
% load('uv25.mat');
%  load('W1.mat');
%  [m1,n1] = size(aa);
%  for k=1:9
% for kk=1:n1
%      num1=reshape(aa(:,kk),25,9);
%      num=num1(:,k);
%     for jj=1
% u=a(1:(25*jj),1);
% v=a(1:(25*jj),2);
% 
% w=num;  %percentage
% 
% p0 = [1 1 1 1 1 1 ];  
% X=[u,v];
% [p,r] = nlinfit(X,w,@summer,p0);
% y = summer(p, X);
% plot(w,y);
% pr=corrcoef(w,y);
% mse=mean((w-y).^2);
% 
% % find the max
% CCT=6000:50:10000;
% Duv=-0.015:0.001:0.015;
% for i=1:81
%     for j=1:31
%         c=i*31-31+j;
%         XYZ=CCT2xyz(CCT(i),Duv(j));
%         cform = makecform('xyz2upvpl');
%         uvY = applycform(XYZ,cform);
%         u=uvY(1);
%         v=uvY(2);
%         Y=uvY(3);
%         Ydark=Y.*0.54;
%         uvYdark(1)=u;
%         uvYdark(2)=v;
%         uvYdark(3)=Ydark;
%         cform = makecform('upvpl2xyz');
%         xyzdark = applycform(uvYdark,cform);
%         XYZ_D65=xyzdark./100;
%         uv= xyz2uvY(XYZ_D65);       
%         uv01(c,:)=uv;        
%     end
% end
% yy = summer(p, uv01);
% [uu,vv]=mydraw(p,0.55);
% tab1(kk,k)=uu;
% tab2(kk,k)=vv;
% uvYtab=[uu,vv,0.54];
% XYZtab=uvY2xyz(uvYtab);
% [CCTtab,Duvtab]=CCTa(XYZtab);
%     end
% end
%  end

load('Chinese.mat')
load('P1uv.mat')
a11=['r','b','y','g','k'];
a12=['y','b','r','g','k'];
a13=['r','b','y','g','k'];
a2=['r.';'b.';'y.';'g.';'k.'];
a3=['y*';'b*';'r*';'g*';'k*'];
a4=['r^';'b^';'y^';'g^';'k^'];
b1=[1,6,3,4,9];
b2=[5,6,3,8,9];
for k1=1:5
    k=b1(k1);
n=size(tab1);
n1=n(1);
score1=[score(1:n1,1),tab1(:,k),tab2(:,k)];
[m,n] = size(score1);
p = min(m,n);   % 维数
M = mean(score1);           % 均值
s = inv(cov(score1));        % 协方差矩阵的逆矩阵
alpha=0.2;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
% [h] = ellipsefig(M(2:3),P,r,1,a13(k1));   % 绘制置信椭圆
axis equal;
hold on;
xlabel('u','FontSize',15);
ylabel('v','FontSize',15);
plot(M(2),M(3),a2(k1,:),'MarkerSize',20);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
hold on
% for i=1:n1
%     plot(score1(i,2),score1(i,3),a2(k1,:),'MarkerSize',5);
% end
hold on
end
% hold off;