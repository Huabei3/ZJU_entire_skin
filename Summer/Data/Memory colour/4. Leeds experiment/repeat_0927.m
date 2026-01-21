a2=mean(aa2')';a3=mean(aa3')';
for i=1:1372
    if a2(i,1)>=0.5
        a2(i,1)=1;
    else
        a2(i,1)=0;
    end
    if a3(i,1)>=0.5
        a3(i,1)=1;
    else
        a3(i,1)=0;
    end
end

for i=1:1372
    for j=1:11
    if aa2(i,j)==a2(i,1)
       aa2(i,j)=1;
    else
       aa2(i,j)=0;
    end
    if aa3(i,j)==a3(i,1)
       aa3(i,j)=1;
    else
       aa3(i,j)=0;
    end
    end
end
 aa2=mean(aa2);aa3=mean(aa3);              