function yy=pengrui(p,result) 
L=result(:,1);
a=result(:,2);
b=result(:,3);

yy=p(1).*L.^2+p(2).*a.^2+p(3).*b.^2+p(4).*L.*a+p(5).*L.*b+p(6).*a.*b+...
p(7).*L +p(8).*a +p(9).*b+p(10);
    

% yy=p(1).*(J-p(7)).^2+p(2).*(a-p(8)).^2+p(3).*(b-p(9)).^2+...
% +p(4).*(J-p(7)).*(a-p(8))+p(5).*(J-p(7)).*(b-p(9))+p(6).*(a-p(8)).*(b-p(9))

end