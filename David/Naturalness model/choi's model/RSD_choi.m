function rsd = RSD_choi(cam)
temp = find(cam(:,1) <= 30);
sz = size(temp);
rsd = sz(1);
if rsd == 0
    rsd = 1;
end