function n = naturalness_model(lab,class)
load ellipsoidmodel;
switch class
    case 'sky'
        p = par(1,:);
    case 'springgrass'
        p = par(2,:);
    case 'autumngrass'
        p = par(3,:);
    case 'asianskin'
        p = par(4,:);
    case 'caucasianskin'
        p = par(5,:);
end
f = @(lab) 1./(1+exp(p(1)*sqrt((lab(:,1)-p(5)).^2+p(2)*(lab(:,2)-p(6)).^2+p(3)*(lab(:,3)-p(7)).^2+p(4)*(lab(:,2)-p(6)).*(lab(:,3)-p(7)))-p(8)));
n = f(lab);
