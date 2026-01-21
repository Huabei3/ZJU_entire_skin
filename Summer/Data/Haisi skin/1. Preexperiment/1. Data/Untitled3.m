for i=1:45
uv(i,:)=CCT2uv(w45(i,1),w45(i,2));
end
for j=1:11
for i=1:5
  bb(i,j)=sum(aa(i:5:(40+i),j));
end
end