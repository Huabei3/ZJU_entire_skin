clear;
close all;
load x1;
load y1;
rmse=[];
% for i=0.19:0.001:0.205
%    for ii=0.435:0.001:0.445  %----遍历
%       uc=i;
%       vc=ii;
uc=0.199;vc=0.4379;
      for iii=1:1:36
          eval(sprintf('data%d = []', iii));
      end
      for j=1:size(y)  %------扇形分区
         if (x(j,2)-vc)/(x(j,1)-uc)>=0 && (x(j,2)-vc)/(x(j,1)-uc)<0.1763 && x(j,2)-vc>=0 && x(j,1)-uc>0
             data1=[data1;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=0.1763 && (x(j,2)-vc)/(x(j,1)-uc)<0.3640 && x(j,2)-vc>0
             data2=[data2;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=0.3640 && (x(j,2)-vc)/(x(j,1)-uc)<0.5774 && x(j,2)-vc>0
             data3=[data3;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=0.5774 && (x(j,2)-vc)/(x(j,1)-uc)<0.8391 && x(j,2)-vc>0
             data4=[data4;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=0.8391 && (x(j,2)-vc)/(x(j,1)-uc)<1.1918 && x(j,2)-vc>0
             data5=[data5;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=1.1918 && (x(j,2)-vc)/(x(j,1)-uc)<1.7321 && x(j,2)-vc>0
             data6=[data6;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=1.7321 && (x(j,2)-vc)/(x(j,1)-uc)<2.7475 && x(j,2)-vc>0
             data7=[data7;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=2.7475 && (x(j,2)-vc)/(x(j,1)-uc)<5.6713 && x(j,2)-vc>0
             data8=[data8;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>=5.6713 && x(j,2)-vc>0
             data9=[data9;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-5.6713 && x(j,2)-vc>0
             data10=[data10;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-2.7475 && (x(j,2)-vc)/(x(j,1)-uc)>-5.6713 && x(j,2)-vc>0
             data11=[data11;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-1.7321 && (x(j,2)-vc)/(x(j,1)-uc)>-2.7475 && x(j,2)-vc>0
             data12=[data12;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-1.1918 && (x(j,2)-vc)/(x(j,1)-uc)>-1.7321 && x(j,2)-vc>0
             data13=[data13;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.8391 && (x(j,2)-vc)/(x(j,1)-uc)>-1.1918 && x(j,2)-vc>0
             data14=[data14;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.5774 && (x(j,2)-vc)/(x(j,1)-uc)>-0.8391 && x(j,2)-vc>0
             data15=[data15;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.3640 && (x(j,2)-vc)/(x(j,1)-uc)>-0.5774 && x(j,2)-vc>0
             data16=[data16;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.1763 && (x(j,2)-vc)/(x(j,1)-uc)>-0.3640 && x(j,2)-vc>0
             data17=[data17;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=0 && (x(j,2)-vc)/(x(j,1)-uc)>-0.1763 && x(j,2)-vc>=0
             data18=[data18;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=0.1763 && (x(j,2)-vc)/(x(j,1)-uc)>0 && x(j,2)-vc<0
             data19=[data19;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=0.3640 && (x(j,2)-vc)/(x(j,1)-uc)>0.1763 && x(j,2)-vc<0
             data20=[data20;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=0.5774 && (x(j,2)-vc)/(x(j,1)-uc)>0.3640 && x(j,2)-vc<0
             data21=[data21;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=0.8391 && (x(j,2)-vc)/(x(j,1)-uc)>0.5774 && x(j,2)-vc<0
             data22=[data22;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=1.1918 && (x(j,2)-vc)/(x(j,1)-uc)>0.8391 && x(j,2)-vc<0
             data23=[data23;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=1.7321 && (x(j,2)-vc)/(x(j,1)-uc)>1.1918 && x(j,2)-vc<0
             data24=[data24;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=2.7475 && (x(j,2)-vc)/(x(j,1)-uc)>1.7321 && x(j,2)-vc<0
             data25=[data25;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=5.6713 && (x(j,2)-vc)/(x(j,1)-uc)>2.7475 && x(j,2)-vc<0
             data26=[data26;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)>5.6713 && x(j,2)-vc<0
             data27=[data27;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-5.6713 && x(j,2)-vc<0
             data28=[data28;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-2.7475 && (x(j,2)-vc)/(x(j,1)-uc)>-5.6713 && x(j,2)-vc<0
             data29=[data29;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-1.7321 && (x(j,2)-vc)/(x(j,1)-uc)>-2.7475 && x(j,2)-vc<0
             data30=[data30;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-1.1918 && (x(j,2)-vc)/(x(j,1)-uc)>-1.7321 && x(j,2)-vc<0
             data31=[data31;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.8391 && (x(j,2)-vc)/(x(j,1)-uc)>-1.1918 && x(j,2)-vc<0
             data32=[data32;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.5774 && (x(j,2)-vc)/(x(j,1)-uc)>-0.8391 && x(j,2)-vc<0
             data33=[data33;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.3640 && (x(j,2)-vc)/(x(j,1)-uc)>-0.5774 && x(j,2)-vc<0
             data34=[data34;x(j,:),y(j)];
         elseif (x(j,2)-vc)/(x(j,1)-uc)<=-0.1763 && (x(j,2)-vc)/(x(j,1)-uc)>-0.3640 && x(j,2)-vc<0
             data35=[data35;x(j,:),y(j)];
         else
             data36=[data36;x(j,:),y(j)];
         end
      end
      dp=[];
      for jj=1:36  %-----分区进行概率分布拟合
          b1=['data',num2str(jj)];
          t1=eval(b1);
          if ~isempty(t1)
              xdata=sqrt((t1(:,1)-uc).^2+(t1(:,2)-vc).^2);
              xdata=[xdata;0];
              ydata=t1(:,3);
              ydata=[ydata;1];
              theta=jj*10-5;
              F=@(a,xdata)1./(1+exp(a(2).*xdata-a(1)));
              a0=[1,1];
              warning off
              [a,resnorm] = lsqcurvefit(F,a0,xdata,ydata);
              dp=[dp;a(1)/a(2)*cosd(theta)+uc,a(1)/a(2)*sind(theta)+vc];
          
          end
      end
      xdp=dp;
      plot(x(:,1),x(:,2),'r.');
      hold on;
      plot(uc,vc,'k.');
      plot(xdp(:,1),xdp(:,2),'go');
      f=@(p,xdp)p(1).*(xdp(:,1)-uc).^2+p(2).*(xdp(:,1)-uc).*(xdp(:,2)-vc)+p(3).*(xdp(:,2)-vc).^2+p(4);
      p0=[1 1 1 1];
    warning off
    % 拟合系数，最小二乘方法
    [p,R,J,CovB,MSE,ErrorModelInfo]=nlinfit(x,zeros(size(x,1),1),f,p0);
    rmse=[rmse;sqrt(MSE),uc,vc];
    ezplot(@(x,y)f(p,[x,y]),[0.1,0.3,0.35,0.55]);
%    end
% end