clear;
close all;
load('DE_00_jnd_5to95percent');
load('DE_00_acc_5to95percent');

rmse=[];
alfa=[];

for i=1:6
%     i=1;
%     xdata=jnd1{1,i}(:,1)';
%     ydata=jnd1{1,i}(:,2)';
    xdata=acc1{1,i}(:,1)';
    ydata=acc1{1,i}(:,2)';
    F=@(a,xdata)1./(1+exp(xdata-a));
    a0=0;
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
        if xdata(ii)>aa && ydata(ii)>0.5
            WN=WN+1;
        elseif xdata(ii)<aa && ydata(ii)<0.5
            WN=WN+1;
        end             
    end
    WD=100*WN/TN;
    l=plot(xdata,ydata,'.');

    hold on;
    h=fplot(@(x) 1/(1+exp(x-a)),[0,6]);
    axis([0 6 0 1]);
    k=plot([a,a],[0,6],'--');
    plot([0,6],[0.5,0.5],'-');
    text(a,-0.1,['DEt=',num2str(a)]);
switch i
    case{1}
        title('DE_0_0 acc 1100cd/m2');
    case{2}
        title('DE_0_0 acc 400cd/m2');
    case{3}
        title('DE_0_0 acc 110cd/m2');
    case{4}
        title('DE_0_0 acc 30cd/m2');
    case{5}
        title('DE_0_0 acc 3cd/m2');
    otherwise
        title('DE_0_0 acc 0.25cd/m2');
end
end
% switch i
%     case{1}
%         title('DE_0_0 jnd 1100cd/m2');
%     case{2}
%         title('DE_0_0 jnd 400cd/m2');
%     case{3}
%         title('DE_0_0 jnd 110cd/m2');
%     case{4}
%         title('DE_0_0 jnd 30cd/m2');
%     case{5}
%         title('DE_0_0 jnd 3cd/m2');
%     otherwise
%         title('DE_0_0 jnd 0.25cd/m2');



