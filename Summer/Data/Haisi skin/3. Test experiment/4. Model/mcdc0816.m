
    for j=1:9
        for i=1:5
    b(i,1:3)=a(j+9*i-9,:);
        end
mcdm(j)=MCDM(b);
end
