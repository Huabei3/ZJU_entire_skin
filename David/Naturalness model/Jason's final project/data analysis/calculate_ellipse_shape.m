function shape = calculate_ellipse_shape(par)
% par0 = par;
par(:,2:4) = par(:,2:4).*(par(:,1)./par(:,8)).^2;
theta = 0.5*atan(par(:,4)./(par(:,2)-par(:,3)));
thetapi = theta*360/(2*pi)+90;


% method 1
majoraxist = sqrt(1./(par(:,3)+par(:,4).*cot(theta)/2));
minoraxist = sqrt(1./(par(:,2)-par(:,4).*cot(theta)/2));
% method 2
% par(:,2:4) = par0(:,2:4)./(par0(:,2).*par0(:,6).^2+par0(:,3).*par0(:,7).^2+par0(:,4).*par0(:,6).*par0(:,7)-(par0(:,8)./par0(:,1)).^2);
% A = par(:,2);
% B = par(:,4);
% C = par(:,3);
% Xc = par(:,6);
% Yc = par(:,7);
% theta2 = 0.5*atan(B./(A-C));
% thetapi2 = theta2*360/(2*pi)+90;
% majoraxist2 = sqrt(2*(A.*Xc.^2+B.*Xc.*Yc+C.*Yc.^2-1)./(A+C+sqrt((A-C).^2+B.^2)));
% minoraxist2 = sqrt(2*(A.*Xc.^2+B.*Xc.*Yc+C.*Yc.^2-1)./(A+C-sqrt((A-C).^2+B.^2)));

majoraxis = max(majoraxist,minoraxist);
minoraxis = min(majoraxist,minoraxist);
mr = majoraxis./minoraxis;

shape = [thetapi,majoraxis,minoraxis,mr];