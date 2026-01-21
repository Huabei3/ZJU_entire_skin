% ¼ÆËãÖØ¸´ÂÊ
result=xlsread('example.xls');
for i=1:31
    for j=1:49
        k=(i-1)*98+j;
        s1=result(k);
        s2=result(k+49);
        repeat(j,:)= s1==s2;
    end
    cf(i,:)=sum(double(repeat))/49;
end