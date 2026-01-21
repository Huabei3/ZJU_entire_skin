clc 
clear
%load YY_M_Lab % example的顺序排列 选点肤色Lab
result=xlsread('example.xlsx');
%% 求每一个人对49个点的z分数
for i=1:30
    z=zscore(result((i-1)*49+1:(i-1)*49+49));
    a=find(z>0);
    s=sum(Mlab(a,:).*z(a))/sum(z(a));
    score(i,:)=s;
end

for i=1:49
    p=sum(result((i-1)*25+1:(i-1)*25+25));
    s(i,:)=p;
end



%% 求49个点的z分数
for i=1:49
    p=sum(result((i-1)*30+1:(i-1)*30+30));
    s(i,:)=p;
end
 score1=zscore(s);
 a=find(score1>0);
 ss1=sum(Mlab(a,:).*score1(a))/sum(score1(a));
 
 %% 求49个点的z分数
for i=1:49
    z=zscore(result((i-1)*26+1:(i-1)*26+26));
    p=mean(z);
    s(i,:)=p;
end
 score2=zscore(s);
 a=find(score2>0);
 ss2=sum(Mlab(a,:).*score2(a))/sum(score2(a));
  
 %% 求percent
 for k=1:12
    res=result((k-1)*1470+1:(k-1)*1470+1470);
    for i=1:49
        p=sum(res((i-1)*30+1:(i-1)*30+30));
        s(i,:)=p;
    end
    per(:,k)=s;
end
 
clc 
clear
result=xlsread('example.xlsx');
 for i=1:49
     for j=1:30
         s(j,:)=result((j-1)*49+i);
     end
     Y(i,:)=mean(s);  %求平均
 end
 for i=1:30
     X=result((i-1)*49+1:(i-1)*49+49);
     f=sum(X.*Y)/sum(Y.^2);
     st=sum((f.*Y-X).^2)/sum(X.^2)*100;
     stress(i,1)=st;
end
STRESS=mean(stress);

%intro
for i=1:30
    Y=data((i-1)*49+1:(i-1)*49+49,2);
    X=data((i-1)*49+1:(i-1)*49+49,1);
    f=sum(X.*Y)/sum(Y.^2);
    st=sum((f.*Y-X).^2)/sum(X.^2)*100;
     stress(i,1)=st/2;
end
STRESS=mean(stress);


w=percentage(:,1);
p0 = [1 1 1 1 1 1];  
X=Mlab;
[p] = nlinfit(X,w,@pengrui,p0);
y = pengrui(p, X);
plot(w,y,'o');
pr=corrcoef(w,y);
mse=mean((s-y).^2);
plot(yy);
p = lsqcurvefit(@pengrui,p0,X,w);

a=s(:,2);
b=s(:,3);
w=s(:,4);
p0 = [1 1 1 1 1 1];  
X=[a,b];
[p,r,j] = nlinfit(X,w,@pengrui2,p0);
y = pengrui(p, X);
plot(w,y);
pr=corrcoef(s,y);
mse=mean((s-y).^2);
plot(yy);
p = lsqcurvefit(@pengrui,p0,X,w);

x1=30:1:60;
x2=10:1:40;
x3=10:1:40;
[temp1,temp2,temp3] =ndgrid(x1,x2,x3);
result = [temp1(:),temp2(:),temp3(:)];
yy = pengrui(p, result);

w=[255,255,255]; 
xyzw = lut3d_rgb2xyz(w);
xyz=lab2xyz(lab,'user',xyzw);
rgb=newlut3d_xyz2rgb(xyz);
rgb=rgb./255;
hsv=rgb2hsv(rgb);

for i =1:10
    test=neutral(:,i);
    n_uv=uv.*test;
    u=sum(n_uv(:,1))/sum(test);
    v=sum(n_uv(:,2))/sum(test);
     score(i,1)=u;
     score(i,2)=v;
end
XYZ=uvY2xyz(score);
[CCT_out,duv_out]=CCTa(XYZ,1964);

cielab=skin_lab(:,1:3);
zscore=score_o(:,7);