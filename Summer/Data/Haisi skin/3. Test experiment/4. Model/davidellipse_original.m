clear all
% load('data0621-3.mat');
load('..\2. Code\data0621-3.mat');
color=[255,0,0;255,162,0;225,225,0;146,208,80;91,155,213]./255;
% D=[0.454 0.521 0.562 0.599 0.622];
 D=[0.503 	0.551 	0.588 	0.618 	0.644]; 
% D=1-[0.06 	0.15 	0.27 	0.47 	0.62 ];
CAT_type="original";
output_folder=fullfile("res",CAT_type);
if ~exist(output_folder,"dir")
    mkdir(output_folder);
end
fitRes_folder=fullfile(output_folder,"fitRes");
if ~exist(fitRes_folder,"dir")
    mkdir(fitRes_folder);
end

c=mean(a')';
c=reshape(c,100,5);
% par=ellipsoidfit5(b(1:25,:),c(1:25,5));

subplot(2,2,1);
subplot('position', [0.1 0.55 0.35 0.35]); 
par_all=[];
labNcore={};
curr=1;
for i=1:5
%     xyz=lab2xyz(b,'user',[433.8 475.0 566.4]);
%     f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*475,[94.813 100.000 107.262],'CAT16',100,100,D(i)); 
%     b1=xyz2lab(f2,'user',[433.8 475.0 566.4]);
%     b1(:,3)=b1(:,3)+3;
b1=b;
    for j=1
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i));

par_all=[par_all;par];
labNcore{curr,1}=b1(25*j-24:25*j,:);
labNcore{curr,2}=c(25*j-24:25*j,i);
curr=curr+1;

f = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(i+5*j-5,5),par(i+5*j-5,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i+5*j-5,1) = 0.5*atan(par(i+5*j-5,3)/(1-par(i+5*j-5,2)));
thetapi(i+5*j-5,1) = theta(i+5*j-5,1)*360/(2*pi);
majoraxis(i+5*j-5,1) = sqrt(1/(par(i+5*j-5,2)+par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
minoraxis(i+5*j-5,1) = sqrt(1/(1-par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
mr(i+5*j-5,1) = minoraxis(i+5*j-5,1)/majoraxis(i+5*j-5,1);
    end
end
save(fullfile(fitRes_folder,"African.mat"),"par_all","labNcore");

title('African results');

subplot(2,2,2);
subplot('position',[0.6 0.55 0.35 0.35]);

par_all=[];
labNcore={};
curr=1;

for i=1:5
%     xyz=lab2xyz(b,'user',[433.8 475.0 566.4]);
%     f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*475,[94.813 100.000 107.262],'CAT16',100,100,D(i)); 
%     b1=xyz2lab(f2,'user',[433.8 475.0 566.4]);
%     b1(:,3)=b1(:,3)+3;
b1=b;
    for j=2
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i));

par_all=[par_all;par];
labNcore{curr,1}=b1(25*j-24:25*j,:);
labNcore{curr,2}=c(25*j-24:25*j,i);
curr=curr+1;

f = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(i+5*j-5,5),par(i+5*j-5,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i+5*j-5,1) = 0.5*atan(par(i+5*j-5,3)/(1-par(i+5*j-5,2)));
thetapi(i+5*j-5,1) = theta(i+5*j-5,1)*360/(2*pi);
majoraxis(i+5*j-5,1) = sqrt(1/(par(i+5*j-5,2)+par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
minoraxis(i+5*j-5,1) = sqrt(1/(1-par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
mr(i+5*j-5,1) = minoraxis(i+5*j-5,1)/majoraxis(i+5*j-5,1);
    end
end
save(fullfile(fitRes_folder,"Caucasian.mat"),"par_all","labNcore");
title('Caucasian results');

subplot(2,2,3);
subplot('position',[0.1 0.1 0.35 0.35]);  

par_all=[];
labNcore={};
curr=1;

for i=1:5
%     xyz=lab2xyz(b,'user',[433.8 475.0 566.4]);
%     f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*475,[94.813 100.000 107.262],'CAT16',100,100,D(i)); 
%     b1=xyz2lab(f2,'user',[433.8 475.0 566.4]);
%     b1(:,3)=b1(:,3)+3;
b1=b;
    for j=3
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i))
par_all=[par_all;par];
labNcore{curr,1}=b1(25*j-24:25*j,:);
labNcore{curr,2}=c(25*j-24:25*j,i);
curr=curr+1;
f = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(i+5*j-5,5),par(i+5*j-5,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i+5*j-5,1) = 0.5*atan(par(i+5*j-5,3)/(1-par(i+5*j-5,2)));
thetapi(i+5*j-5,1) = theta(i+5*j-5,1)*360/(2*pi);
majoraxis(i+5*j-5,1) = sqrt(1/(par(i+5*j-5,2)+par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
minoraxis(i+5*j-5,1) = sqrt(1/(1-par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
mr(i+5*j-5,1) = minoraxis(i+5*j-5,1)/majoraxis(i+5*j-5,1);
    end
end
save(fullfile(fitRes_folder,"Oriental.mat"),"par_all","labNcore");
title('Oriental results');

subplot(2,2,4);
subplot('position',[0.6 0.1 0.35 0.35]);

par_all=[];
labNcore={};
curr=1;

for i=1:5
%     xyz=lab2xyz(b,'user',[433.8 475.0 566.4]);
%     f2=ciecat02_d(xyz,f1(i,:)./f1(i,2).*475,[94.813 100.000 107.262],'CAT16',100,100,D(i)); 
%     b1=xyz2lab(f2,'user',[433.8 475.0 566.4]);
%     b1(:,3)=b1(:,3)+3;
b1=b;
    for j=4
par(i+5*j-5,:)=ellipsoidfit5(b1(25*j-24:25*j,:),c(25*j-24:25*j,i));
par_all=[par_all;par];
labNcore{curr,1}=b1(25*j-24:25*j,:);
labNcore{curr,2}=c(25*j-24:25*j,i);
curr=curr+1;
f = [num2str(par(i+5*j-5,1)),'*sqrt(','(x-',num2str(par(i+5*j-5,5)),')^2+',num2str(par(i+5*j-5,2)),'*(y-',num2str(par(i+5*j-5,6)),')^2+',num2str(par(i+5*j-5,3)),'*(x-',num2str(par(i+5*j-5,5)),')','*(y-',num2str(par(i+5*j-5,6)),'))','=',num2str(par(i+5*j-5,4))];
h=ezplot(f,[0,40]);set(h,'Color',color(i,:));hold on;
 axis([0 40 0 40]);hold on;grid on;
 set(gca,'XTick',[0:5:40]);%设置要显示坐标刻度
 set(gca,'YTick',[0:5:40]);%设置要显示坐标刻度
xlabel('a*','FontSize',15);
ylabel('b*','FontSize',15);
plot(par(i+5*j-5,5),par(i+5*j-5,6),'o','Color',color(i,:),'MarkerFaceColor',color(i,:),'MarkerSize',8);hold on;
theta(i+5*j-5,1) = 0.5*atan(par(i+5*j-5,3)/(1-par(i+5*j-5,2)));
thetapi(i+5*j-5,1) = theta(i+5*j-5,1)*360/(2*pi);
majoraxis(i+5*j-5,1) = sqrt(1/(par(i+5*j-5,2)+par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
minoraxis(i+5*j-5,1) = sqrt(1/(1-par(i+5*j-5,3)*cot(theta(i+5*j-5,1))/2));
mr(i+5*j-5,1) = minoraxis(i+5*j-5,1)/majoraxis(i+5*j-5,1);
    end
end
save(fullfile(fitRes_folder,"South_Asian.mat"),"par_all","labNcore");
title('South Asian results');


sgtitle('Preferred skin color centers (David model) on CIELAB (no CAT)');

legend({'3000K','4000K','5000K','6500K','8000K'});


par=[par,thetapi,majoraxis,minoraxis,mr];
