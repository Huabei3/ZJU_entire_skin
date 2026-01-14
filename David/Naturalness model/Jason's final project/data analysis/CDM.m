function de = CDM(lab)

meanlab = mean(lab);
sz = size(lab);
de = cielabde(lab,repmat(meanlab,sz(1),1));
end