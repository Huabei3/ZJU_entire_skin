xdata = xlsread('white1.xls');
score = xdata(:,2);
group = xdata(:,3);
[p,table,stats] = anova1(score,group)


%*******************************多重比较************************************
[c,m,h,gnames] = multcompare(stats);
head = {'组序号','组序号','置信下限','组均值差','置信上限','检验p值'};
[head; num2cell(c)]
[gnames num2cell(m)]

xdata = xlsread('white1.xls');
x = xdata(:,2:4);
group = xdata(:,5);
% 调用manova1函数作多元方差分析
[d,p,stats] = manova1(x,group)

% 调用anova1函数对甲商品的销售额作一元方差分析
[p1,table1] = anova1(x(:,1),group)

% 调用anova1函数对乙商品的销售额作一元方差分析
[p2,table2] = anova1(x(:,2),group)

% 调用anova1函数对丙商品的销售额作一元方差分析
[p3,table3] = anova1(x(:,3),group)

% 调用anova1函数对丁商品的销售额作一元方差分析
[p4,table4] = anova1(x(:,4),group)
[p5,table5] = anova1(x(:,5),group)

xdata = xlsread('white1.xls');
x = xdata(:,2);
y = xdata(:,3);

Alpha = 0.05;
tail = 'both';
[h,p,muci,stats] = ttest(x,y,Alpha,tail)