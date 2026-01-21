aa=[3,10,15,29,23,24];aa=aa-1;
bb=[25,26,27,28,29,30];bb=bb-1;
for i=1:6
    for k=1:32
    for j=1:48
    if c3(aa(i)*48+j,k)==c3(bb(i)*48+j,k)
        cc(i*48-48+j,k)=1;
    else
        cc(i*48-48+j,k)=0;
    end
    end
    end
end
dd(:,3)=mean(cc)';