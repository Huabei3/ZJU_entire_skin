function JCount = rsdChoi(J)

thr = [30 40 50 60 75 100];
for i=1:6
    locs = find(J<thr(i));
%     locs = find(J<42.3581);
    JCount(i) = length(locs);
    if JCount(i)==0
        JCount(i)=1;
    end
end

end