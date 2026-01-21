load jasondata_naturalness;
load jasondata_imgname;


for i = 1:length(imgname)
    imgname1 = char(imgname(i,:));
    [naturalnessjason_choi(i,:),Ct(i,:),RSDt(i,:),St(i,:)] = N_choi(imgname1);
end
save naturalnessjason_choi naturalnessjason_choi

scatter(naturalnessjason_choi,naturalness);
r = corr(naturalnessjason_choi,naturalness)
stress = mySTRESS(naturalnessjason_choi,naturalness)