function y=pengrui4(p,s) 
CCT=s(:,1);
%Duv=s(:,2);
L=s(:,3);
 %y=p(1).*(1-(p(2)./CCT+p(3).*Duv+p(4).*Duv./CCT)).*log(L);
% y=1-(p(1)./CCT+p(2).*Duv+p(3).*Duv./CCT).*log(L);
% y=1-(p(1)./CCT+p(2).*Duv+p(3).*Duv./CCT+p(4).*log(L));
% y=1-(p(1)./CCT+p(2).*Duv+p(3).*Duv./CCT+p(4).*log(L)+p(5).*log(L)./CCT);
 y=p(1).*(1-(p(2)./CCT)).*log(L);
end