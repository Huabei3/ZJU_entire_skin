function lab0_new = alg3(lab0, mask, center)
% medium region adjustment
% ÖÐ¼äÆ«ÒÆ
% Input parameters: 
%     lab0 - image Lab matrix by [n*3];
%     mask - indicater to seperate the skin from the background, output of
%            function skin_mine;
%     center - prefer color center by [1,2];
% Output parameters:
%     lab0_new - image Lab matrix by [n*3];

lab = lab0(mask(:),:);

d1=[0.005183,-0.00535,0.002799];
ds=0.1; % adjust inner ellipse size (0~1)

x0=center(1); y0=center(2);
x=lab(:,2); y=lab(:,3);
f1=d1(1); f2=d1(2); f3=d1(3);
dp=f1.*((x-x0).^2)+f2.*(x-x0).*(y-y0)+f3.*((y-y0).^2); % calculate mahalanobis distance
idx=dp<1 & dp>ds;

dabp(:,1)=lab(idx,2)-center(1);
dabp(:,2)=lab(idx,3)-center(2);
aabb(:,1)=dabp(:,1).*(ds./dp(idx))+center(1); % calculate adjustment
aabb(:,2)=dabp(:,2).*(ds./dp(idx))+center(2); % calculate adjustment

lab(idx,2) = x(idx) + dp(idx) .* (aabb(:,1) - x(idx)); % calculate new a* values
lab(idx,3) = y(idx) + dp(idx) .* (aabb(:,2) - y(idx)); % calculate new b* values

lab0(mask(:),:) = lab;
lab0_new = lab0;
end