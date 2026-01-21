function yy=labsummer(p,s) 
l=s(:,1);
a=s(:,2);
b=s(:,3);

yy=p(1).*l.^2+p(2).*a.^2+p(3).*b.^2+p(4).*l.*a+p(5).*l.*b+p(6).*a.*b+...
p(7).*l +p(8).*a +p(9).*b+p(10);
end