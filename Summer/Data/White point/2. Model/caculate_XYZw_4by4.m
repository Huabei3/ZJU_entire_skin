CCT=[4000,5000,6500,8500];
duv=[-0.02,-0.01,0,0.01];
for i=1:4
    for j=1:4
        n=i*4-4+j;
        XYZw(n,:)=CCT2xyz(CCT(i),duv(j));
       [ b(n,1),b(n,2)]=CCTa(XYZw(n,:));
    end
end
