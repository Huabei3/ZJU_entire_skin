for i=1:10
    p=pp(:,i);
    u=sum(uv(:,1).*p)/sum(p);
    v=sum(uv(:,2).*p)/sum(p);
    s(i,1)=u;
    s(i,2)=v;
end
XYZ=uvY2xyz(uvY);
[uv] = xyz2lab(XYZ,'d65_64');
for i=1:11
    p=pp(:,i);
    u=sum(uv(:,1).*p)/sum(p);
    v=sum(uv(:,2).*p)/sum(p);
    s(i,1)=u;
    s(i,2)=v;
end

uv=UV([4 11 18 25 32 39],:);
p1=pp(43:48,1:10);
p2=pp([4 11 18 25 32 39],1:10);
for i =1:10
    x1=sum(p1(:,i).*uv(:,1))/sum(p1(:,i));
    y1=sum(p1(:,i).*uv(:,2))/sum(p1(:,i));
    x2=sum(p2(:,i).*uv(:,1))/sum(p2(:,i));
    y2=sum(p2(:,i).*uv(:,2))/sum(p2(:,i));
    E=sqrt((x1-x2)^2+(y1-y2)^2);
    EE(i)=E;
end
s=mean(EE);
