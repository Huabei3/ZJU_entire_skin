function [ lab0_new ] = alg4_51( lab0, mask )
% 51 hue algorithm, center self-adjustment
% Input parameters: 
%     lab0 - image Lab matrix by [n*3];
%     mask - indicater to seperate the skin from the background, output of
%            function skin_mine;
% Output parameters:
%     lab0_new - image Lab matrix by [n*3];

lab = lab0(mask(:),:);
pars=[0.005316, -0.00371, 0.001997];
f1 = pars(1);
f2 = pars(2);
f3 = pars(3);
lab1 = mean(lab)';
lch0 = zeros(1,3);
lch0(1) = lab1(1);
lch0(2) = (lab1(2).^2 + lab1(3).^2).^0.5.*1;
lch0(3) = 51; % reset the hue to 51 degree
center = zeros(1,2);
center(1) = lch0(2).*cosd(lch0(3)); % create a* of center
center(2) = lch0(2).*sind(lch0(3)); % create b* of center
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
lab(:,1) = -0.003*lab(:,1).^2 + 1.2326*lab(:,1); % calculate new L* values

lab0(mask(:),:) = lab;
lab0_new = lab0;

end

