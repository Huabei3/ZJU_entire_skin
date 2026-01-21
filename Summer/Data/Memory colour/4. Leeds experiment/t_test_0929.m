for i=5
[h(1,i),h(2,i)]=ttest(a5p,a5n,0.05);
r=corrcoef(a5p,a5n);
h(3,i)=r(1,2);
end