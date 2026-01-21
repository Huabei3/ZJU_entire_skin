 load('spddata1.mat');
nam=["´óÇÑ×Ó";"Ð¡ÇÑ×Ó";"Ñó´Ð";"»ðÁú¹û";"Ìá×Ó";"ÆÏÌÑ";"À¶Ý®";"Î÷ºìÊÁ";"×Ï¸ÊÀ¶";"ºìÀ±½·";"ºìÉ«Ì«¿Õ½·";"ºúÂÜ²·";"³È×Ó";"»ÆÉ«Ì«¿Õ½·";"Ïã½¶";"ÄûÃÊ";"ÇàÆ»¹û";"»Æ¹ÏÆ¤";"»¨²Ë";"Çà²ËÒ¶";"»Æ¹ÏÆ¬";"ÆæÒì¹û";"°ÙÊÂ¿ÉÀÖ";"Æ»¹û1";"Æ»¹û2";"Æ»¹û3";"ÓÍÌÒ"];
for i=1:27
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c];
    d=tan(b(3,:).*pi./180);
    e=sqrt(b(2,:).^2./(1+d.^2));
    f=abs(e.*d);
    
    for j=1:44
    if b(3,j)>270
        f(j)=-f(j);  
    else if b(3,j)>180
        e(j)=-e(j);f(j)=-f(j);    
    else if b(3,j)>90
        e(j)=-e(j); 
    end
    end
    end
    end
    ff(1:44,(5*i-4):5*i)=[b(1,:)',e',f',b(2:3,:)'];
    scatter(e(1,1:43),f(1,1:43),25,'o');hold on;
    scatter(e(1,44),f(1,44),25,'o','k','filled');hold on;
    text(e(1,44)+1,f(1,44),num2str(i));
    
% saveas(gcf,strcat('./spdab',num2str(i),'.jpg'));
% close all;
end
for i=26:33
    b=reshape(a(:,i),40,43);
    c=mean(b')';
    b=[b,c]; 
%     ff(1:44,(5*i-4):(5*i-2))=b(1:3,:)';
%     ff(1:44,5*i-1)=sqrt(b(2,:).^2+b(3,:).^2);
%     ff(1:44,5*i)=atan(b(3,:)./b(2,:))./2.1316.*180;
    for j=1:44
    ff(j,(5*i-4):(5*i-2))=b(1:3,j)';
    ff(j,5*i-1)=sqrt(b(2,j).^2+b(3,j).^2);
    ff(j,5*i)=atan(b(3,j)./b(2,j))./2.1316.*180;
        if ff(j,5*i)<0
            ff(j,5*i)=ff(j,5*i)+360;
        end
    end
    scatter(b(2,:),b(3,:),25,'o'); hold on;
    scatter(b(2,44),b(3,44),25,'o','k','filled');hold on;
    text(b(2,44)+1,b(3,44),num2str(i));
end
for i=1:24
  scatter(g(i,2),g(i,3),25,'o','r','filled');hold on;  
  text(g(i,2)+1,g(i,3),num2str(i),'Color','red');
end
% for i=1:8
%   scatter(h(i,2),h(i,3),25,'o','k','filled');hold on;  
%   text(h(i,2)+1,h(i,3),num2str(i+25));
% end
axis equal; axis on;
axis([-60 100 -60 100]);hold on
y1=-100:0.1:100;x1=0*y1;plot(x1,y1,'k');
x2=-100:0.1:100;y2=0*x2;plot(x2,y2,'k');
title('Plot on CIELAB (a*b*)','FontSize',15);
set(gca,'XTick',[-60:10:100]);%ÉèÖÃÒªÏÔÊ¾×ø±ê¿Ì¶È
set(gca,'YTick',[-60:10:100]);%ÉèÖÃÒªÏÔÊ¾×ø±ê¿Ì¶È
grid on; 
xlabel('a*','FontName','Times New Roman','FontSize',15);
ylabel('b*','FontName','Times New Roman','FontSize',15);
