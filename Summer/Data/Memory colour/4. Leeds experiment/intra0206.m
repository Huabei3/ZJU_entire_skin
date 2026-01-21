% for i=1:124
%     c(i,1)=sqrt(sum((a(i,:)-b(i,:)).^2));
% end
% c=mean(c);

for i=1:208
    c(i,1)=sqrt(sum((a(i,1:3)-a(i,4:6)).^2));
    c(i,2)=sqrt(sum((a(i,1:3)-a(i,4:6)).^2));        
    c(i,3)=sqrt(sum((a(i,1:3)-a(i,4:6)).^2)); 
    c(i,4)=sqrt(sum((a(i,1:3)-a(i,4:6)).^2));
end