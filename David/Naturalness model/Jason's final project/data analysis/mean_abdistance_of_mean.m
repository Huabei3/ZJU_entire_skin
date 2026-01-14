function dab = mean_abdistance_of_mean(ab)
sz = size(ab);
meanab = repmat(mean(ab),sz(1),1);
dabs = sqrt((ab(:,1)-meanab(:,1)).^2+(ab(:,2)-meanab(:,2)).^2);
dab = mean(dabs);
end