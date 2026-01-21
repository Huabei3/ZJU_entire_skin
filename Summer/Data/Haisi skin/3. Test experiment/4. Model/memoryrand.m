clear all
load('memory0722.mat');
for i=1:29
    if a(i,4)>b(i,4)
       if a(i,4)>c(i,4)
       a1(i,:)=a(i,:);
           if b(i,4)>c(i,4)
           a2(i,:)=b(i,:);a3(i,:)=c(i,:); 
           else
           a2(i,:)=c(i,:);a3(i,:)=b(i,:);  
           end
       else
       a1(i,:)=c(i,:); 
           if a(i,4)>b(i,4)
           a2(i,:)=a(i,:);a3(i,:)=b(i,:); 
           else
           a2(i,:)=b(i,:);a3(i,:)=a(i,:);  
           end
       end

    else 
       if b(i,4)>c(i,4)
       a1(i,:)=b(i,:);
           if a(i,4)>c(i,4)
           a2(i,:)=a(i,:);a3(i,:)=c(i,:); 
           else
           a2(i,:)=c(i,:);a3(i,:)=a(i,:);  
           end
       else
       a1(i,:)=c(i,:); 
           if a(i,4)>b(i,4)
           a2(i,:)=a(i,:);a3(i,:)=b(i,:); 
           else
           a2(i,:)=b(i,:);a3(i,:)=a(i,:);  
           end
       end
    end
end