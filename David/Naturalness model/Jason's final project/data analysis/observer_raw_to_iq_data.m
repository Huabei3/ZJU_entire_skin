image_quality = zeros(1960,20);
for i = 1:20
    for j = 1:1960
        idx = find(strtrim(string(char(imgname))) == string(char(observer_raw_imgname(j,i))));
        image_quality(idx,i) = cell2mat(observer_raw_results(j,i));
    end
end
raw_n = image_quality;
% save raw_n raw_n
obs = [1 2 3 4 5 6 7 9 10 11 13 14 15 16 17 18 19 20];

for i = 1:1960
    p(i,:) = sum(raw_n(i,obs) == 1)/20;
end
naturalness1 = p;
save naturalness1 naturalness1

