clear;
close all;
load('Duv_acc3');
rmse=[];
alfa=[];
    i=1;
    xdata=acc(:,1);
    ydata=acc(:,2);
    F=@(a,xdata)1./(1+exp(xdata.*a(1)-a(2)));
    a0=[0,1];
    warning off
    [a,resnorm] = lsqcurvefit(F,a0,xdata,ydata);
    alfa=[alfa,a];
    r=sqrt(resnorm/length(xdata));
    rmse=[rmse,r];
    aa=a;
    DEt=aa;
    TN=length(xdata);
    WN=0;
    for ii=1:TN
        if xdata(ii).*a(1)>a(2) && ydata(ii)>0.5
            WN=WN+1;
        elseif xdata(ii).*a(1)<a(2) && ydata(ii)<0.5
            WN=WN+1;
        end             
    end
    WD=100*WN/TN;
    l=plot(xdata,ydata,'.','markersize',20);

    hold on;
    h=fplot(@(x) 1/(1+exp(x.*a(1)-a(2))),[0,10]);
    x=0:0.01:0.1;
    y=1./(1+exp(x.*a(1)-a(2)));

    plot(x,y,'r','LineWidth',2);
    hold on
    axis([0 0.1 0 1]);
    k=plot([a(2)./a(1),a(2)./a(1)],[0,1],'--','Color',[0 0.8 0.1],'LineWidth',2);
    plot([0,0.1],[0.5,0.5],'LineWidth',2,'Color',[0.7 0 0.7]);
%     text(a,-0.1,['DEt=',num2str(a)]);
        title('Duv acc image Lady');
      print(gcf,'-dpng','Duv acc3.png') 
