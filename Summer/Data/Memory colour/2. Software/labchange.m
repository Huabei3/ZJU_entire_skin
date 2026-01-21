for j=1
    for i=1:48
        d=tan((x(j,5)+y(i,3))/180*pi);
        if x(j,2)>0
        a=sqrt((x(j,4)+y(i,2)).^2./(1+d.^2));
        else
        a=-sqrt((x(j,4)+y(i,2)).^2./(1+d.^2));
        end
        b=a.*d;
        L=x(j,1)+y(i,1);
        telab(i,:)=[L,a,b];
        tlab=[L,a,b];
    end
end