function de = MCDM(lab)

meanlab = mean(lab);
sz = size(lab);
de = mean(cielabde(lab,repmat(meanlab,sz(1),1)));
end