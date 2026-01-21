for i=1:5
A(:,i)=C(:,2*i-1);
B(:,i)=C(:,2*i);
end
for i=1:48
D(i,1)=max(A(i,1:5));
D(i,2)=min(A(i,1:5));
end
for i=1:48
D(i,3)=max(B(i,1:5));
D(i,4)=min(B(i,1:5));
end
for i=1:6
    for j=1:10
E(i,j)=mean(C(((8*i-7):(8*i)),j));
    end
end