load('cov_ab_theta_0227.mat')

for i=1:24 
    if aa(i,1)>aa(i,2)
        c=aa(i,2);
        aa(i,2)=aa(i,1);
        aa(i,1)=c;
        aa(i,3)=90-aa(i,3);
    end
    d=aa(i,1);
    aa(i,1)=aa(i,2);
    aa(i,2)=aa(i,2)./d;
end