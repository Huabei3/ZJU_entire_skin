v1(:,4)=v(:,2);
v1(:,2)=v(:,2)./sqrt(1+tan(v(:,1)./180.*pi).^2);
v1(:,3)=sqrt(v(:,2).^2-v1(:,2).^2);
v1(:,1)=v(:,3);
for i=1:144
    if b(i,2)<0
        v1(i,2)=-v1(i,2);
    end
    if b(i,3)<0
        v1(i,3)=-v1(i,3);
    end    
end
v1(:,5)=sqrt(v1(:,2).^2+v1(:,3).^2);
v1(:,6)=v(:,1);
v1(:,7)=atan(v1(:,3)./v1(:,2))./pi.*180;
for i=1:144
if b(i,2)>0
    if b(i,3)>0
hab=v(i,1);
    else
hab=v(i,1)+360;  
    end
else
hab=v(i,1)+180;
end
v1(i,8)=hab;
end