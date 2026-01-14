load imgname;
for i = 1:size(imgname,1)
    cl(i,:) = calculate_localcontrast(char(imgname(i,:)));
end