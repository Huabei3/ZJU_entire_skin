function VDC = lab2vdc(lab)
    
    Mv = sqrt(lab(:,1).^2+lab(:,2).^2+lab(:,3).^2);
    Md = sqrt((100-lab(:,1)).^2+lab(:,2).^2+lab(:,3).^2);
    Mc = sqrt((50-lab(:,1)).^2+lab(:,2).^2+lab(:,3).^2);
    VDC = [Mv Md Mc];