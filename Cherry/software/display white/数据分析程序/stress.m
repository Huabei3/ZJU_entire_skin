for i=1:12
    X=res2(:,i);
    Y=res3(:,i);
    f=sum(X.*Y)/sum(Y.^2);
    st=sum((f.*Y-X).^2)/sum(X.^2)*100;
    STRESS(i,3)=st;
end
S=mean(STRESS);

X=res1(:,9);
    Y=res1(:,11);
    f=sum(X.*Y)/sum(Y.^2);
    st=sum((f.*Y-X).^2)/sum(X.^2)*100;


