% 计算每个人对每张图的平均值

load Chinese_Lab % example的顺序排列 选点肤色Lab
result=xlsread('example.xls');
for i=1:31
    lab=zeros(49,3);
    for j =1:49
        k=(i-1)*49+j;
        s=result(k);
        lab(j,:)=Chinese_Lab(j,:).*s;   
    end
    lab (all(lab == 0, 2),:) = [];
    score(i,:)=mean(lab);
end