function Qcl = clearness(imgname)


img = double(imread(imgname));
sz = size(img);
sz(1) = floor(sz(1)/5)*5;
sz(2) = floor(sz(2)/5)*5;
img0 = img(1:sz(1),1:sz(2),:);
img0 = double(reshape(img0 , sz(1) * sz(2) , 3)) / 255;
xyz0 = display_f(img0);
CAM = xyz2cam02(xyz0 , display_f([1 1 1]) , 60 , 20 , 'dark');
J = reshape(CAM(: , 1) , sz(1) , sz(2));
J0 = J(3:5:sz(1)-2,3:5:sz(2)-2);

for i = 1:5
    for j = 1:5
        Jt(i,j) = mean(mean((J(i:5:sz(1)-5+i,j:5:sz(2)-5+j)-J0).^2));
    end
end
Qclt = mean(mean(Jt));
% for i = 1 : sz(1) - 4
%     for j = 1 : sz(2) - 4
%         tempmat = J(i : i + 4 , j : j + 4 );
%         dJ(i ,j) = sum(sum((tempmat - J(i + 2 , j + 2)) .^ 2)) / 24;
%     end
% end

% Qclt = mean(mean(dJ));

PPI = sqrt(2240 ^ 2 + 1080 ^ 2) / 6.1;
Hp = 25.4 * sqrt(2 / PPI);

aP = 0.900;
bP = 1.839;
cP = 3.822;
mP = 48.656;
Qcl = (Qclt / mP) * (1 - aP / (1 + exp(bP * (Hp - cP))));
if isnan(Qcl)
    Qcl = 0;
end