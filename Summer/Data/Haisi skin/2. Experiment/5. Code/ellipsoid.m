% load('ellipsoidscore.mat')
score=aaa1;
for i=9
ss(:,1:2)=score(:,(3*i-1):3*i);ss(:,3)=score(:,(1*3-2));
% ss(:,1:2)=score(:,(3*i-1):(3*i));
  [h,V(i,:),aa(i,:),bb(i,:),cc(i,:)]=ConfidenceRegion1(ss,0.05,'norm');hold on;
% [h,V,aa,bb]=ConfidenceRegion2(ss,0.05,'norm');hold on;
xlabel('a,');ylabel('b,');zlabel('J,');grid on;
% axis([-30 30 -30 30 101.5 102.5]);hold on
% set(gca,'XTick',[-30:5:30]);%设置要显示坐标刻度
% set(gca,'YTick',[-30:5:30]);%设置要显示坐标刻度
% set(gca,'ZTick',[101.5:0.1:102.5]);%设置要显示坐标刻度
 axis equal
% view([0,0,1]);
 u(i,1)=h(1,1);u(i,2)=(h(1,2)+h(2,1))./2;u(i,3)=h(2,2);
 u(i,4)=(h(1,3)+h(3,1))./2;u(i,5)=(h(2,3)+h(3,2))./2;u(i,6)=h(3,3);
 t(i,3)=0.5*atan(2.*u(i,2)./(u(i,1)-u(i,3)));
 t(i,1)=1./(u(i,3)+u(i,2).*cot(t(i,3)));
 t(i,2)=1./(u(i,1)-u(i,2).*cot(t(i,3)));
end