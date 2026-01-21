load rawdata_colorfulness;
for i = 1:840
    o(i,1) = length(find(rawdata(i,:)==1));
    o(i,2) = length(find(rawdata(i,:)==2));
end
zscore = o2z(o);