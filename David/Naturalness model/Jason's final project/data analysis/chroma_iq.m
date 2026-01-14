load chroma2;
load chroma;
load image_quality;

% for i = 1:10
%     scatter(chroma2((i-1)*49+1:(i-1)*49+49),image_quality((i-1)*49+1:(i-1)*49+49));
%     hold on;
% end


% for i = 11:20
%     x = chroma2((i-1)*49+1:(i-1)*49+49,:);
%     y = image_quality((i-1)*49+1:(i-1)*49+49,:);
% 
%     options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
%     f = @(a,x)a(1)*x.^2 + a(2)*x + a(3);
%     a(i,:) = lsqcurvefit(f,[1,1,1],x,y,[-inf,-inf,-inf],[0,inf,inf],options);
% 
%     y0 = a(i,1)*x.^2 + a(i,2)*x + a(i,3);
%     chroma_index((i-1)*49+1:(i-1)*49+49,:) = y0;
%     r(i,:) = corr(y,y0);
%     
%     fplot(@(x)a(i,1)*x.^2 + a(i,2)*x + a(i,3),[0,100]);
%     axis([0,100,0,1]);
%     hold on;
% end
% mean(r)
% corr(chroma_index,image_quality)

x1 = chroma2(1:490,:);
y1 = image_quality(1:490,:);
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
f = @(a,x)a(1)*x.^2 + a(2)*x;
f2 = @(a,x)exp(a(1)-a(2)./x-a(3)*log(x));
a(1,:) = lsqcurvefit(f2,[1,1,1],x1,y1,[0,0,0],[inf,inf,inf],options);
y0 = f2(a(1,:),x1);
chroma_index(1:490,:) = y0;
r(1,:) = corr(y1,y0);
% fplot(@(x)a(1,1)*x.^2 + a(1,2)*x,[0,100]);
fplot(@(x)exp(a(1,1)-a(1,2)./x-a(1,3)*log(x)),[0,100]);
axis([0,100,0,1]);
hold on;

x2 = chroma2(491:980,:);
y2 = image_quality(491:980,:);
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
f = @(a,x)a(1)*x.^2 + a(2)*x;
f2 = @(a,x)exp(a(1)-a(2)./x-a(3)*log(x));
a(2,:) = lsqcurvefit(f2,[1,1,1],x2,y2,[0,0,0],[inf,inf,inf],options);
y0 = f2(a(2,:),x2);
chroma_index(491:980,:) = y0;
r(2,:) = corr(y2,y0);
% fplot(@(x)a(2,1)*x.^2 + a(2,2)*x,[0,100]);
fplot(@(x)exp(a(2,1)-a(2,2)./x-a(2,3)*log(x)),[0,100]);
axis([0,100,0,1]);
hold on;

tempc=[];
tempiq=[];
for i = [1 5 7 9 10]
    tempc = [tempc;chroma2(980+(i-1)*49+1:980+(i-1)*49+49,:)];
    tempiq = [tempiq;image_quality(980+(i-1)*49+1:980+(i-1)*49+49,:)];
end
x3 = tempc;
y3 = tempiq;
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
f = @(a,x)a(1)*x.^2 + a(2)*x;
f2 = @(a,x)exp(a(1)-a(2)./x-a(3)*log(x));
a(3,:) = lsqcurvefit(f2,[1,1,1],x3,y3,[0,0,0],[inf,inf,inf],options);
y0 = f2(a(3,:),x3);
j = 1;
for i = [1 5 7 9 10]
    chroma_index(980+(i-1)*49+1:980+(i-1)*49+49,:) = y0((j-1)*49+1:(j-1)*49+49);
    j = j+1;
end
r(3,:) = corr(y3,y0);
% fplot(@(x)a(3,1)*x.^2 + a(3,2)*x,[0,100]);
fplot(@(x)exp(a(3,1)-a(3,2)./x-a(3,3)*log(x)),[0,100]);
axis([0,100,0,1]);
hold on;

tempc=[];
tempiq=[];
for i = [2 3 4 6 8]
    tempc = [tempc;chroma2(980+(i-1)*49+1:980+(i-1)*49+49,:)];
    tempiq = [tempiq;image_quality(980+(i-1)*49+1:980+(i-1)*49+49,:)];
end
x4 = tempc;
y4 = tempiq;
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
f = @(a,x)a(1)*x.^2 + a(2)*x;
f2 = @(a,x)exp(a(1)-a(2)./x-a(3)*log(x));
a(4,:) = lsqcurvefit(f2,[1,1,1],x4,y4,[0,0,0],[inf,inf,inf],options);
y0 = f2(a(4,:),x4);
j = 1;
for i = [2 3 4 6 8]
    chroma_index(980+(i-1)*49+1:980+(i-1)*49+49,:) = y0((j-1)*49+1:(j-1)*49+49);
    j = j+1;
end
r(4,:) = corr(y4,y0);
% fplot(@(x)a(4,1)*x.^2 + a(4,2)*x,[0,100]);
fplot(@(x)exp(a(4,1)-a(4,2)./x-a(4,3)*log(x)),[0,100]);
axis([0,100,0,1]);
hold on;

x5 = chroma2(1471:1960,:);
y5 = image_quality(1471:1960,:);
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',10000);
f = @(a,x)a(1)*x.^2 + a(2)*x;
f2 = @(a,x)exp(a(1)-a(2)./x-a(3)*log(x));
a(5,:) = lsqcurvefit(f2,[1,1,1],x5,y5,[0,0,0],[inf,inf,inf],options);
y0 = f2(a(5,:),x5);
chroma_index(1471:1960,:) = y0;
r(5,:) = corr(y5,y0);
% fplot(@(x)a(5,1)*x.^2 + a(5,2)*x,[0,100]);
fplot(@(x)exp(a(5,1)-a(5,2)./x-a(5,3)*log(x)),[0,100]);
axis([0,100,0,1]);
hold on;

corr(chroma_index,image_quality)
% apex = -a(:,2)./(2*a(:,1));