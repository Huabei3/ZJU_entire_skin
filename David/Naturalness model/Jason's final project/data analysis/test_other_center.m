load naturalness1;
load skylab;
load skinlab;
load grasslab;
load ellipsoidmodel;

skycenter = [54.66 	12.78 	-60.68 
65.7 -10.4 -28.9
62.6 -10 -35.4
51.34 	17.08 	-67.28 
59.52 	8.23 	-43.06 ];
j = 1;
f = @(a,xdata)(1./(1+exp(a(1)*sqrt((xdata(:,1)-a(5)).^2+a(2)*(xdata(:,2)-a(6)).^2+a(3)*(xdata(:,3)-a(7)).^2+a(4)*(xdata(:,2)-a(6)).*(xdata(:,3)-a(7)))-a(8))));
for i = 1:5
    xdata = skylab;
    a = [par(1,1:4),skycenter(i,:),par(1,8)];
    y0 = f(a,xdata);
    y = naturalness1(1:490);
    r(j,:) = corr(y,y0);
    j = j+1;
end
grasscenter = [62.42 	-46.82 	59.81 
45.5 -40.4 32.2
55.6 -45.7 35.1
66.86 	-43.36 	61.11 
39.75 	-30.59 	47.16 ];
for i = 1:5
    xdata = grasslab;
    a = [par(2,1:4),grasscenter(i,:),par(2,8)];
    y0 = f(a,xdata);
    y = naturalness1(491:980);
    r(j,:) = corr(y,y0);
    j = j+1;
end


templab = [];
tempn = [];
for i = [1 5 7 9 10]
    templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:)];
end
asianskincenter = [68.54 	10.30 	12.89 
69.97 	12.66 	18.15 
73.1 8.6 20.3
59.34 	21.66 	31.59 
66.49 	15.96 	21.33 
65.74 	19.93 	18.09 ];

for i = 1:6
    xdata = templab;
    a = [par(4,1:4),asianskincenter(i,:),par(4,8)];
    y0 = f(a,xdata);
    y = tempn;
    r(j,:) = corr(y,y0);
    j = j+1;
end

templab = [];
tempn = [];
for i = [2 3 4 6 8]
    templab = [templab;skinlab((i-1)*49+1:(i-1)*49+49,:)];
    tempn = [tempn;naturalness1(980+(i-1)*49+1:980+(i-1)*49+49,:)];
end
caucasianskincenter = [76.86 	10.12 	10.56 
81.36 	9.53 	9.10 
81.8 10.5 19.3
58.79 	22.26 	34.82 
78.53 	10.70 	7.93 
65.21 	21.43 	23.75 ];

for i = 1:6
    xdata = templab;
    a = [par(5,1:4),caucasianskincenter(i,:),par(5,8)];
    y0 = f(a,xdata);
    y = tempn;
    r(j,:) = corr(y,y0);
    j = j+1;
end

