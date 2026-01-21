for i=1:24
    d(i,1)=corr(a(i,:)',b(i,:)');
end
for j=1:5
    e(j)=corr(a(:,j),b(:,j));
end