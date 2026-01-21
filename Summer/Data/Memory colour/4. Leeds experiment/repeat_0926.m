 c1=a(15*49-48:15*49,:);d1=a(27*49-48:27*49,:);
 c2=b(15*49-48:15*49,:);d2=b(27*49-48:27*49,:);
for i=1:49
 for   j=1:9
    if c1(i,j)==d1(i,j);
        e1(i,j)=1;
    else
        e1(i,j)=0;
    end
    if c2(i,j)==d2(i,j);
        e2(i,j)=1;
    else
        e2(i,j)=0;
    end
 end
end
g1(3,:)=mean(e1);g2(3,:)=mean(e2);