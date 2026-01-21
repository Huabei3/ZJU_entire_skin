load all-S
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
P=s(2:3,2:3);
[h] = ellipsefig(M(2:3),P,r,1);   % 绘制置信椭圆
%[h] = ellipsefig(M,s,r,2);   % 绘制置信椭圆
plot(M(2),M(3),'.','Color',[0.5 0.5 0.5]);
axis equal;
hold on;
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(M(2),M(3),'o','MarkerSize',8,'MarkerFaceColor',[0,1,1],'MarkerEdgeColor',[0,0,0]);
C=sqrt(M(3)^2+M(2)^2);
h=atan(M(3)/M(2))*180/pi;
axis([-10 50 -10 50]);
for i=33:48
    plot(TargetLab(i,2),TargetLab(i,1),'*','Color',[1 0 1],'MarkerSize',15);
end
hold off;

u0=s(1,1);
u1=s(1,2)+s(2,1);
u2=s(2,2);
u3=s(1,3)+s(3,1);
u4=s(2,3)+s(3,2);
u5=s(3,3);
q=90-0.5*atan(u4/(u5-u2))*180/pi;

plot(compare(1,1),compare(1,2),'s','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[1,0.5,0]); %sander
plot(compare(2,1),compare(2,2),'s','MarkerSize',8,'MarkerFaceColor',[1,1,0],'MarkerEdgeColor',[1,0.5,0]); %sanger
plot(compare(3,1),compare(3,2),'s','MarkerSize',8,'MarkerFaceColor',[1,1,0],'MarkerEdgeColor',[1,0.75,0]);%sanger
plot(compare(4,1),compare(4,2),'s','MarkerSize',8,'MarkerFaceColor',[1,1,0],'MarkerEdgeColor',[0,0,0]);%sanger
plot(compare(5,1),compare(5,2),'m.','MarkerSize',25);   %yano
plot(compare(6,1),compare(6,2),'^','MarkerSize',8,'MarkerFaceColor',[1,0,1],'MarkerEdgeColor',[1,0,1]);   %Park
plot(compare(7,1),compare(7,2),'^','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[1,0.5,0]);  %Park
plot(compare(8,1),compare(8,2),'^','MarkerSize',8,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0]);    %Park
plot(compare(9,1),compare(9,2),'^','MarkerSize',8,'MarkerFaceColor',[0,1,0],'MarkerEdgeColor',[0,1,0]);    %Park
plot(compare(10,1),compare(10,2),'o','MarkerSize',8,'MarkerEdgeColor',[1,0.5,0]);  %Kuang
plot(compare(11,1),compare(11,2),'m-o','MarkerSize',8);%Kuang
plot(compare(12,1),compare(12,2),'k-o','MarkerSize',8);%Kuang
plot(compare(13,1),compare(13,2),'c-o','MarkerSize',8);%Kuang
plot(compare(14,1),compare(14,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[0,0,0]);  %zeng
plot(compare(15,1),compare(15,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0,1],'MarkerEdgeColor',[0,0,0]);%zeng
plot(compare(16,1),compare(16,2),'d','MarkerSize',8,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0]);%zeng
plot(compare(17,1),compare(17,2),'+','MarkerSize',8,'Color',[0,0,1]); %our
plot(compare(18,1),compare(18,2),'+','MarkerSize',8,'Color',[1,0,0]);%our
plot(compare(19,1),compare(19,2),'+','MarkerSize',8,'Color',[0,1,0]);%our
plot(compare(20,1),compare(20,2),'+','MarkerSize',8,'Color',[1,1,0]);%our

plot(compare(1,1),compare(1,2),'^','MarkerSize',8,'MarkerEdgeColor',[0,0,1]);
plot(compare(2,1),compare(2,2),'^','MarkerSize',8,'MarkerEdgeColor',[1,0,0]);
plot(compare(3,1),compare(3,2),'^','MarkerSize',8,'MarkerEdgeColor',[0,1,0]);
plot(compare(4,1),compare(4,2),'^','MarkerSize',8,'MarkerEdgeColor',[1,0,1]);
plot(compare(13,1),compare(13,2),'b.','MarkerSize',20);
plot(compare(14,1),compare(14,2),'r.','MarkerSize',20);
plot(compare(15,1),compare(15,2),'g.','MarkerSize',20);
plot(compare(16,1),compare(16,2),'c.','MarkerSize',20);
plot(compare(9,1),compare(9,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0.5,0],'MarkerEdgeColor',[0,0,0]);
plot(compare(10,1),compare(10,2),'d','MarkerSize',8,'MarkerFaceColor',[1,0,1],'MarkerEdgeColor',[0,0,0]);
plot(compare(11,1),compare(11,2),'d','MarkerSize',8,'MarkerFaceColor',[0,0,0],'MarkerEdgeColor',[0,0,0]);

load all-A
Jch(:,1)=score(:,2);
Jch(:,2)=score(:,3);
Jch(:,3)=score(:,1);
[V,xm,aa,bb,cc] = ConfidenceRegion2(Jch,0.05,'norm');
axis equal;
hold on;
xlabel('R','FontSize',15);
ylabel('G','FontSize',15);
zlabel('B','FontSize',15);
axis([10 20 10 20]);

load all-A
[m,n] = size(score);
p = min(m,n);   % 维数
M = mean(score);           % 均值
s = inv(cov(score));        % 协方差矩阵的逆矩阵
alpha=0.05;                 %显著性水平，标量，取值介于[0,1]，默认值为0.05
r = chi2inv(1-alpha,p);     %基于正态分布
s=s./r;
u0=s(1,1);
u1=s(1,2)+s(2,1);
u2=s(2,2);
u3=s(1,3)+s(3,1);
u4=s(2,3)+s(3,2);
u5=s(3,3);
u=[u0,u1,u2,u3,u4,u5];
syms x
syms y
syms z
x0 =M(:,1);
y0=M(:,2);
z0=M(:,3);
x=x0;
ss = u0*(x-x0)^2+u1*(x-x0)*(y-y0)+u2*(y-y0)^2+u3*(x-x0)*(z-z0)+u4*(y-y0)*(z-z0)+u5*(z-z0)^2; %多项式公式
N = coeffs(expand(ss));
f=1-N(1);
d=N(4);
c=N(3);
e=N(2);
b=N(5);
a=N(6);
a0=y0;
b0=z0;
chroma=sqrt(a0^2+b0^2);
hue=atan(b0/a0)*180/pi;
[aa,bb,h] = ellipsefig1(a,b,c,d,e,f);
ratio=max(aa/bb,bb/aa);
jiao=90-0.5*atan(u4/(u5-u2))*180/pi;
res=double([max(aa,bb),ratio,jiao]);




J=simplify(ss) %%简化多项式

J =...
(2885182245417887*y^2)/18014398509481984 - (393046350213375*y*z)/4503599627370496 - (9032279320171191207886350141353*y)/2535301200456458802993406410752 + (264237365508291*z^2)/2251799813685248 - (3253898028349572384056512664691*z)/1267650600228229401496703205376 + 72816095156583247665246257091381502018862782527/1427247692705959881058285969449495136382746624
 J =...
(2885182245417887*y^2)/18014398509481984 - (393046350213375*y*z)/4503599627370496 - (8027034497543984382001240295337*y)/2535301200456458802993406410752 + (264237365508291*z^2)/2251799813685248 - (2989195496041939042351301055603*z)/1267650600228229401496703205376 + 66220962197829983121394882475699393200007747647/1427247692705959881058285969449495136382746624
(2885182245417887*y^2)/18014398509481984 - (393046350213375*y*z)/4503599627370496 - (11042768965425604859656569833385*y)/2535301200456458802993406410752 + (264237365508291*z^2)/2251799813685248 - (3783303092964839067466935882867*z)/1267650600228229401496703205376 + 103333334841476355817034115190363883385837131839/1427247692705959881058285969449495136382746624
(2885182245417887*y^2)/18014398509481984 - (393046350213375*y*z)/4503599627370496 - (12048013788052811685541679679401*y)/2535301200456458802993406410752 + (264237365508291*z^2)/2251799813685248 - (4048005625272472409172147491955*z)/1267650600228229401496703205376 + 127255441567616199424970598673664155933956446271/1427247692705959881058285969449495136382746624
 
a=2885182245417887/18014398509481984;
b= - 393046350213375/4503599627370496;
c= 264237365508291/2251799813685248;
d=- 12048013788052811685541679679401/2535301200456458802993406410752;
e= - 4048005625272472409172147491955/1267650600228229401496703205376;
f=1-127255441567616199424970598673664155933956446271/1427247692705959881058285969449495136382746624;
delta = 4*a*c-b^2;

xc= (b*e-2*c*d)/delta;
yc = (b*d-2*a*e)/delta;

w=[255,255,255]; 
xyzw = lut3d_rgb2xyz(w);
xyz=lab2xyz(score,'user',xyzw);

rgb=newlut3d_xyz2rgb(xyz);
% M1 = mean(JAB); 
% M2=mean(rgb);
% RGB=rgb./255;
% JAB = XYZ2CAM16UCS(xyz,xyzw,0.01,0.01,'dark');
[J,Q,C,M,S,h,H]= CAM16_frwd(xyz,xyzw,0.01,0.01,'dark');
Jch(:,1)=J';
Jch(:,2)=C';
Jch(:,3)=h';
% Jab(:,1)=JAB(:,2);
% Jab(:,2)=JAB(:,3);
% Jab(:,3)=JAB(:,1);
[V,xm,aa,bb,cc] = ConfidenceRegion2(Jch,0.05,'norm');
hold on
set(gca,'xTickLabel',num2str(get(gca,'xTick')','%.3f'))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
set(gca,'zTickLabel',num2str(get(gca,'zTick')','%.3f'))