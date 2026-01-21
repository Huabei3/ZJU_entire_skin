function zmat = myzscore_pc(summat,n)
[s1,s2] = size(summat);
lgmat = zeros(s1,s2);
for i=1:s1
    for j=1:s2
        if(i~=j)
            lgmat(i,j) = log((summat(i,j)+0.5)/(n-summat(i,j)+0.5));
            zmat2(i,j) = lgmat(i,j)*0.6436;
        end
    end
end

k=1;l=1;
for j=1:s2
    for i=1:s1
        if(i~=j)
            zmat(k,l) = zmat2(i,j);
            k = k+1;
        end
    end
    l = l+1;
    k = 1;
end