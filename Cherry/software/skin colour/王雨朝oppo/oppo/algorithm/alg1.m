function lab0_new = alg1(lab0, mask, center)
% closer to the center, greater adjustment
% 越近越多
% Input parameters: 
%     lab0 - image Lab matrix by [n*3];
%     mask - indicater to seperate the skin from the background, output of
%            function skin_mine;
%     center - prefer color center by [1,2];
% Output parameters:
%     lab0_new - image Lab matrix by [n*3];

lab = lab0(mask(:),:);
pars=[0.005316, -0.00371, 0.001997];
f1 = pars(1);
f2 = pars(2);
f3 = pars(3);
x0 = center(1);
y0 = center(2);
x = lab(:,2);
y = lab(:,3);
d = f1.*((x-x0).^2) + f2.*(x-x0).*(y-y0) + f3.*((y-y0).^2); % calculate mahalanobis distance

% adjustment
d(d>1) = 1; % when pixel is far from the center
d(d<0.5) = 0.5; % when pixel is close to the center
w = 1 - d; % calculate the weight

lab(:,2) = x + w.*(x0-x); % calculate new a* values
lab(:,3) = y + w.*(y0-y); % calculate new b* values

lab0(mask(:),:) = lab;
lab0_new = lab0;
end