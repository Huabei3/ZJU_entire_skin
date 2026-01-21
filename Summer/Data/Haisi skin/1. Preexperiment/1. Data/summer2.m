function yy=summer2(p,s) 
J1=s(:,1);
a1=s(:,2);
b1=s(:,3);

yy=p(1).*a1.^2+p(2).*a1.*b1+p(3).*b1.^2+p(4).*a1+p(5).*b1+p(6);

end