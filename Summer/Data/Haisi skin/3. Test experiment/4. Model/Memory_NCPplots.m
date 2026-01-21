clear all;
load('memorydata.mat');
% b1=mean(a1'); b2=mean(a2');b3=mean(a3');
b1=reshape(a1,1,1392);b2=reshape(a2,1,1392);b3=reshape(a3,1,1392);

 
subplot(1,3,1);
subplot('position', [0.04 0.12 0.29 0.74]);  
scatter(b2,b1);hold on;
plot([0,1],[0,1]);
r=corrcoef(b1,b2);r1=r(1,2);
text(0.1,0.95,strcat('r=',num2str(r1)));
axis([0 1 0 1]);hold on;grid on;
set(gca,'XTick',[0:0.1:1]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('Preference %','FontSize',15);
ylabel('Colourfulness %','FontSize',15);

subplot(1,3,2);
subplot('position', [0.37 0.12 0.29 0.74]);
scatter(b3,b1);hold on;
plot([0,1],[0,1]);
r=corrcoef(b1,b3);r1=r(1,2);
text(0.1,0.95,strcat('r=',num2str(r1)));
axis([0 1 0 1]);hold on;grid on;
set(gca,'XTick',[0:0.1:1]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('Naturalness %','FontSize',15);
ylabel('Colourfulness %','FontSize',15);


subplot(1,3,3);
subplot('position', [0.70 0.12 0.29 0.74]); 
scatter(b2,b3);hold on;
plot([0,1],[0,1]);
r=corrcoef(b2,b3);r1=r(1,2);
text(0.1,0.95,strcat('r=',num2str(r1)));
axis([0 1 0 1]);hold on;grid on;
set(gca,'XTick',[0:0.1:1]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('Preference %','FontSize',15);
ylabel('Natralness %','FontSize',15);

% for i=1:29
%     r=corrcoef(a1(:,i),a2(:,i));r1(i,1)=r(1,2);
%     r=corrcoef(a1(:,i),a3(:,i));r1(i,2)=r(1,2);
%     r=corrcoef(a2(:,i),a3(:,i));r1(i,3)=r(1,2);
% end