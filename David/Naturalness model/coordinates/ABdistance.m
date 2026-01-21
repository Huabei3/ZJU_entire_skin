function d = ABdistance(lab1,lab2)

d = sqrt((lab1(: , 2) - lab2(: , 2)).^2 + (lab1(: , 3) - lab2(: , 3)).^2);
end